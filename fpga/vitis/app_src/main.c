#include <stdio.h>
#include <string.h>

#include "xparameters.h"
#include "xil_printf.h"
#include "xtime_l.h"
#include "xil_exception.h"
#include "xscugic.h"
#include "netif/xadapter.h"
#include "lwip/init.h"
#include "lwip/inet.h"
#include "lwip/udp.h"
#include "platform.h"
#include "platform_config.h"
#include "radar_driver.h"

#define RADAR_UDP_PORT       5005
#define RADAR_BOARD_IP       "192.168.1.10"
#define RADAR_NETMASK        "255.255.255.0"
#define RADAR_GATEWAY        "192.168.1.1"
#define RADAR_DEMO_PW_TICKS  10000000u
#define RADAR_DEMO_PRI_TICKS 20000000u
#define RADAR_IQ_SAMPLE_RATE_HZ 20000000u
#define RDR_HEADER_SIZE      16u
#define RDR_CRC_SIZE         4u
#define RDR_MAX_PACKET       1400u
#define RADAR_MAX_IQ_SAMPLES ((RDR_MAX_PACKET - RDR_HEADER_SIZE - RDR_CRC_SIZE) / 4u)
#define RADAR_PL_TICKS_PER_IQ_SAMPLE 5u

#if defined(XPAR_RADAR_AXI_PULSE_0_BASEADDR)
#define RADAR_BASEADDR XPAR_RADAR_AXI_PULSE_0_BASEADDR
#elif defined(XPAR_RADAR_AXI_PULSE_0_S_AXI_BASEADDR)
#define RADAR_BASEADDR XPAR_RADAR_AXI_PULSE_0_S_AXI_BASEADDR
#else
#error "No radar AXI base-address macro found in xparameters.h"
#endif

#ifndef PLATFORM_EMAC_BASEADDR
#define PLATFORM_EMAC_BASEADDR XPAR_XEMACPS_0_BASEADDR
#endif

static struct netif board_netif;
static struct udp_pcb *radar_udp;
static radar_device_t radar;

typedef struct {
    u32_t detected;
    u32_t tx_start;
    u32_t echo_start;
    u32_t peak_component;
    u32_t echo_peak_component;
    u32_t noise_median_mag2;
    double range_m;
} radar_iq_result_t;

static u16_t cfg_threshold_component = 3932u; /* 0.12 full scale */
static u16_t cfg_min_snr_ratio_q8 = 640u;     /* about 8 dB amplitude SNR */
static u16_t cfg_pw_samples = 3u;
static u16_t cfg_pri_samples = 128u;
static u16_t cfg_echo_delay_samples = 40u;

static u16_t read_be16(const u8_t *p);

/* IQ_SAMPLES is one real receive window whose sample 0 is aligned to the PL
 * transmit trigger. Find the first two above-threshold pulse regions: the
 * first is the TX reference/leakage pulse and the second is the first echo. */
static void analyze_iq_capture(const u8_t *iq, u32_t count, radar_iq_result_t *result)
{
    u32_t i, peak_mag2 = 0, active = 0, region_count = 0;
    u32_t magnitudes[RADAR_MAX_IQ_SAMPLES];
    u32_t sorted[RADAR_MAX_IQ_SAMPLES];
    u32_t region_start[2] = {0, 0}, region_length[2] = {0, 0};
    u32_t region_peak[2] = {0, 0}, region_component[2] = {0, 0};
    u32_t abs_threshold_mag2;
    uint64_t snr_threshold_mag2;

    memset(result, 0, sizeof(*result));
    if (count > RADAR_MAX_IQ_SAMPLES) return;
    for (i = 0; i < count; ++i) {
        s32_t iv = (s16_t)read_be16(iq + i * 4u);
        s32_t qv = (s16_t)read_be16(iq + i * 4u + 2u);
        u32_t mag2 = (u32_t)(iv * iv) + (u32_t)(qv * qv);
        u32_t component = (u32_t)(iv < 0 ? -iv : iv);
        u32_t qcomponent = (u32_t)(qv < 0 ? -qv : qv);
        u32_t j;
        if (qcomponent > component) component = qcomponent;
        if (component > result->peak_component) result->peak_component = component;
        if (mag2 > peak_mag2) peak_mag2 = mag2;
        magnitudes[i] = mag2;
        /* Insertion sort is small and bounded by the maximum UDP IQ frame. */
        j = i;
        while (j > 0u && sorted[j - 1u] > mag2) {
            sorted[j] = sorted[j - 1u];
            --j;
        }
        sorted[j] = mag2;
    }
    /* Median noise power is robust against the few TX/echo pulse samples. */
    result->noise_median_mag2 = sorted[count / 2u];
    if (result->noise_median_mag2 == 0u) result->noise_median_mag2 = 1u;
    abs_threshold_mag2 = (u32_t)cfg_threshold_component * (u32_t)cfg_threshold_component;
    snr_threshold_mag2 = ((uint64_t)result->noise_median_mag2 *
                          cfg_min_snr_ratio_q8 * cfg_min_snr_ratio_q8) / 65536u;
    if (snr_threshold_mag2 > 0xffffffffULL)
        abs_threshold_mag2 = 0xffffffffu;
    else if (snr_threshold_mag2 > abs_threshold_mag2)
        abs_threshold_mag2 = (u32_t)snr_threshold_mag2;

    for (i = 0; i <= count; ++i) {
        int above = (i < count) && (magnitudes[i] > abs_threshold_mag2);
        if (above) {
            if (!active) {
                if (region_count < 2u) region_start[region_count] = i;
                active = 1;
            }
            if (region_count < 2u) {
                region_length[region_count]++;
                if (magnitudes[i] > region_peak[region_count])
                    region_peak[region_count] = magnitudes[i];
                {
                    s32_t iv = (s16_t)read_be16(iq + i * 4u);
                    s32_t qv = (s16_t)read_be16(iq + i * 4u + 2u);
                    u32_t component = (u32_t)(iv < 0 ? -iv : iv);
                    u32_t qcomponent = (u32_t)(qv < 0 ? -qv : qv);
                    if (qcomponent > component) component = qcomponent;
                    if (component > region_component[region_count])
                        region_component[region_count] = component;
                }
            }
        } else if (active) {
            region_count++;
            active = 0;
        }
    }
    if (region_count >= 2u && region_start[0] == 0u &&
        region_start[1] == cfg_echo_delay_samples &&
        region_length[0] >= cfg_pw_samples &&
        region_length[1] >= cfg_pw_samples &&
        region_peak[1] > abs_threshold_mag2) {
        result->detected = 1;
        result->tx_start = region_start[0];
        result->echo_start = region_start[1];
        result->echo_peak_component = region_component[1];
        result->range_m = 299792458.0 * (double)(result->echo_start - result->tx_start) /
                          (2.0 * (double)RADAR_IQ_SAMPLE_RATE_HZ);
    }
}

static void radar_interrupts_init(void)
{
    Xil_ExceptionInit();
    if (XScuGic_DeviceInitialize(XPAR_SCUGIC_0_DEVICE_ID) != XST_SUCCESS) {
        xil_printf("FAIL: GIC initialization\r\n");
        return;
    }
    Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_IRQ_INT,
        (Xil_ExceptionHandler)XScuGic_DeviceInterruptHandler,
        (void *)(UINTPTR)XPAR_SCUGIC_0_DEVICE_ID);
    Xil_ExceptionEnableMask(XIL_EXCEPTION_IRQ);
}

static u16_t read_be16(const u8_t *p) { return (u16_t)(((u16_t)p[0] << 8) | p[1]); }
static u32_t read_be32(const u8_t *p)
{
    return ((u32_t)p[0] << 24) | ((u32_t)p[1] << 16) | ((u32_t)p[2] << 8) | p[3];
}
static void write_be32(u8_t *p, u32_t v)
{
    p[0] = (u8_t)(v >> 24); p[1] = (u8_t)(v >> 16);
    p[2] = (u8_t)(v >> 8); p[3] = (u8_t)v;
}

static u32_t crc32(const u8_t *data, u32_t length)
{
    u32_t crc = 0xffffffffu, i;
    u8_t bit;
    for (i = 0; i < length; ++i) {
        crc ^= data[i];
        for (bit = 0; bit < 8; ++bit)
            crc = (crc >> 1) ^ ((crc & 1u) ? 0xedb88320u : 0u);
    }
    return crc ^ 0xffffffffu;
}

static void send_reply(struct udp_pcb *pcb, const ip_addr_t *addr, u16_t port,
                       u8_t type, u32_t sequence, const u8_t *payload, u16_t payload_len,
                       int blink_reply_led)
{
    u8_t packet[RDR_MAX_PACKET];
    struct pbuf *out;
    err_t send_err = ERR_BUF;
    u32_t body_len = RDR_HEADER_SIZE + payload_len;
    if (body_len + RDR_CRC_SIZE > sizeof(packet)) return;
    memcpy(packet, "RDR1", 4);
    packet[4] = 1; packet[5] = type; packet[6] = 0; packet[7] = 0;
    write_be32(packet + 8, sequence);
    write_be32(packet + 12, payload_len);
    if (payload_len) memcpy(packet + RDR_HEADER_SIZE, payload, payload_len);
    write_be32(packet + body_len, crc32(packet, body_len));
    out = pbuf_alloc(PBUF_TRANSPORT, (u16_t)(body_len + RDR_CRC_SIZE), PBUF_RAM);
    if (out != NULL) {
        if (pbuf_take(out, packet, (u16_t)(body_len + RDR_CRC_SIZE)) == ERR_OK)
            send_err = udp_sendto(pcb, out, addr, port);
        pbuf_free(out);
    }
    if (send_err == ERR_OK) {
        if (blink_reply_led) {
            (void)radar_signal_reply_queued(&radar);
            xil_printf("UDP reply accepted by lwIP; LED3 signal-reply blink\r\n");
        }
    } else {
        xil_printf("UDP reply submission failed: err=%d\r\n", (int)send_err);
    }
}

static void udp_receive(void *arg, struct udp_pcb *pcb, struct pbuf *p,
                        const ip_addr_t *addr, u16_t port)
{
    u8_t packet[RDR_MAX_PACKET], response[640];
    u16_t length;
    u32_t payload_len, seq, expected_crc, actual_crc;
    u8_t reply_type = 128;
    int response_len = 0;
    int blink_reply_led = 0;
    LWIP_UNUSED_ARG(arg);
    if (p == NULL) return;
    length = p->tot_len;
    if (length > sizeof(packet) || pbuf_copy_partial(p, packet, length, 0) != length) {
        pbuf_free(p); return;
    }
    pbuf_free(p);

    if (length < RDR_HEADER_SIZE + RDR_CRC_SIZE || memcmp(packet, "RDR1", 4) != 0 || packet[4] != 1)
        return;
    payload_len = read_be32(packet + 12);
    if (payload_len + RDR_HEADER_SIZE + RDR_CRC_SIZE != length) return;
    expected_crc = read_be32(packet + length - RDR_CRC_SIZE);
    actual_crc = crc32(packet, length - RDR_CRC_SIZE);
    if (expected_crc != actual_crc) return;
    seq = read_be32(packet + 8);

    switch (packet[5]) {
    case 2: { /* CONFIGURE detector threshold and synthetic pulse parameters */
        u16_t threshold_component, snr_ratio_q8, pw_samples, pri_samples, echo_delay_samples;
        if (payload_len != 10u) {
            reply_type = 255;
            response_len = snprintf((char *)response, sizeof(response),
                                    "{\"error\":\"CONFIGURE requires five uint16 fields\"}");
            break;
        }
        threshold_component = read_be16(packet + RDR_HEADER_SIZE);
        snr_ratio_q8 = read_be16(packet + RDR_HEADER_SIZE + 2u);
        pw_samples = read_be16(packet + RDR_HEADER_SIZE + 4u);
        pri_samples = read_be16(packet + RDR_HEADER_SIZE + 6u);
        echo_delay_samples = read_be16(packet + RDR_HEADER_SIZE + 8u);
        if (threshold_component == 0u || snr_ratio_q8 < 256u || snr_ratio_q8 > 8192u ||
            pw_samples == 0u || pw_samples > 16u || pri_samples <= pw_samples || pri_samples > 256u) {
            reply_type = 255;
            response_len = snprintf((char *)response, sizeof(response),
                                    "{\"error\":\"CONFIGURE values are outside supported limits\"}");
            break;
        }
        if (echo_delay_samples <= pw_samples || echo_delay_samples + pw_samples >= pri_samples) {
            reply_type = 255;
            response_len = snprintf((char *)response, sizeof(response),
                                    "{\"error\":\"echo delay plus pulse width must fit inside the PRI\"}");
            break;
        }
        cfg_threshold_component = threshold_component;
        cfg_min_snr_ratio_q8 = snr_ratio_q8;
        cfg_pw_samples = pw_samples;
        cfg_pri_samples = pri_samples;
        cfg_echo_delay_samples = echo_delay_samples;
        response_len = snprintf((char *)response, sizeof(response),
            "{\"status\":\"configured\",\"threshold_component\":%u,\"min_snr_ratio_q8\":%u,\"pulse_width_samples\":%u,\"pri_samples\":%u,\"echo_delay_samples\":%u}",
            (unsigned)cfg_threshold_component, (unsigned)cfg_min_snr_ratio_q8,
            (unsigned)cfg_pw_samples, (unsigned)cfg_pri_samples,
            (unsigned)cfg_echo_delay_samples);
        xil_printf("Detector configured: threshold=%u, PW=%u samples, PRI=%u samples\r\n",
            (unsigned)cfg_threshold_component, (unsigned)cfg_pw_samples,
            (unsigned)cfg_pri_samples);
        break;
    }
    case 1: /* HELLO */
        response_len = snprintf((char *)response, sizeof(response),
                                "{\"status\":\"ready\",\"ip\":\"%s\",\"port\":%u}",
                                RADAR_BOARD_IP, RADAR_UDP_PORT);
        break;
    case 5: { /* STATUS */
        radar_status_t status;
        radar_read_status(&radar, &status);
        response_len = snprintf((char *)response, sizeof(response),
                                "{\"status\":\"ok\",\"busy\":%s,\"tx_gate\":%s,\"pulse_count\":%u}",
                                status.busy ? "true" : "false", status.tx_gate ? "true" : "false",
                                (unsigned)status.pulse_count);
        break;
    }
    case 16: { /* IQ_SAMPLES: detect a delayed pulse in a transmit-aligned IQ window */
        u32_t count;
        radar_iq_result_t result;
        if ((payload_len & 3u) != 0) { reply_type = 255; response_len = snprintf((char *)response, sizeof(response), "{\"error\":\"IQ payload must contain int16 I/Q pairs\"}"); break; }
        count = payload_len / 4u;
        if (count < 3u || count > RADAR_MAX_IQ_SAMPLES) { reply_type = 255; response_len = snprintf((char *)response, sizeof(response), "{\"error\":\"IQ sample count is outside supported limits\"}"); break; }
        analyze_iq_capture(packet + RDR_HEADER_SIZE, count, &result);
        (void)radar_signal_rx_packet(&radar); /* LED1: frame examined, including noise-only */
        xil_printf("IQ frame examined: seq=%u; LED1 frame marker\r\n", (unsigned)seq);
        if (result.detected) {
            reply_type = 129;
            response_len = snprintf((char *)response, sizeof(response),
                "{\"status\":\"detection\",\"sample_count\":%u,\"peak_component\":%u,\"echo_peak_component\":%u,\"noise_median_mag2\":%u,\"threshold_component\":%u,\"sample_rate_hz\":%u,\"tx_sample\":%u,\"echo_sample\":%u,\"echo_delay_s\":%.9f,\"range_m\":%.3f,\"pulse_width_samples\":%u,\"pri_samples\":%u,\"prf_hz\":%.3f,\"duty_percent\":%.3f,\"snr_ratio_q8\":%u,\"result_source\":\"IQ threshold and SNR detection\",\"hardware_capture\":false}",
                (unsigned)count, (unsigned)result.peak_component,
                (unsigned)result.echo_peak_component, (unsigned)result.noise_median_mag2,
                (unsigned)cfg_threshold_component, (unsigned)RADAR_IQ_SAMPLE_RATE_HZ,
                (unsigned)result.tx_start, (unsigned)result.echo_start,
                (double)(result.echo_start - result.tx_start) / (double)RADAR_IQ_SAMPLE_RATE_HZ,
                result.range_m, (unsigned)cfg_pw_samples, (unsigned)cfg_pri_samples,
                (double)RADAR_IQ_SAMPLE_RATE_HZ / (double)cfg_pri_samples,
                100.0 * (double)cfg_pw_samples / (double)cfg_pri_samples,
                (unsigned)cfg_min_snr_ratio_q8);
            blink_reply_led = 1;
            (void)radar_signal_result(&radar);
            xil_printf("IQ DETECTION: seq=%u echo=%u samples range=%u mm; LED2/LED3 valid-signal blink\r\n",
                (unsigned)seq, (unsigned)result.echo_start,
                (unsigned)(result.range_m * 1000.0));
        } else {
            reply_type = 128;
            response_len = snprintf((char *)response, sizeof(response),
                "{\"status\":\"noise_only\",\"sample_count\":%u,\"peak_component\":%u,\"noise_median_mag2\":%u,\"threshold_component\":%u,\"sample_rate_hz\":%u,\"tx_sample\":0,\"pulse_width_samples\":%u,\"pri_samples\":%u,\"prf_hz\":%.3f,\"duty_percent\":%.3f,\"echo_delay_s\":0,\"range_m\":0,\"hardware_capture\":false}",
                (unsigned)count, (unsigned)result.peak_component,
                (unsigned)result.noise_median_mag2, (unsigned)cfg_threshold_component,
                (unsigned)RADAR_IQ_SAMPLE_RATE_HZ, (unsigned)cfg_pw_samples,
                (unsigned)cfg_pri_samples,
                (double)RADAR_IQ_SAMPLE_RATE_HZ / (double)cfg_pri_samples,
                100.0 * (double)cfg_pw_samples / (double)cfg_pri_samples);
            xil_printf("IQ NOISE ONLY: seq=%u samples=%u; LED1 only\r\n",
                (unsigned)seq, (unsigned)count);
        }
        break;
    }
    default:
        reply_type = 255;
        response_len = snprintf((char *)response, sizeof(response), "{\"error\":\"unsupported message type\"}");
        break;
    }
    if (response_len > 0 && response_len < (int)sizeof(response))
        send_reply(pcb, addr, port, reply_type, seq, response, (u16_t)response_len,
                   blink_reply_led);
}

int main(void)
{
    unsigned char mac[6] = {0x00, 0x0a, 0x35, 0x7a, 0x01, 0x10};
    ip_addr_t ip, mask, gateway;
    err_t err;

    init_platform();
    /* The lwIP PHY driver uses sleep() during link negotiation. */
    XTime_SetTime(0);
    radar_interrupts_init();
    xil_printf("Zybo Z7-10 radar UDP bring-up\r\n");
    if (radar_attach(&radar, (volatile uint32_t *)(UINTPTR)RADAR_BASEADDR) != RADAR_OK ||
        radar_configure(&radar, RADAR_DEMO_PW_TICKS, RADAR_DEMO_PRI_TICKS) != RADAR_OK ||
        radar_start(&radar) != RADAR_OK) {
        xil_printf("FAIL: radar PL setup\r\n");
        return 1;
    }

    IP4_ADDR(&ip, 192, 168, 1, 10);
    IP4_ADDR(&mask, 255, 255, 255, 0);
    IP4_ADDR(&gateway, 192, 168, 1, 1);
    lwip_init();
    if (xemac_add(&board_netif, &ip, &mask, &gateway, mac, PLATFORM_EMAC_BASEADDR) == NULL) {
        xil_printf("FAIL: GEM0 interface init\r\n");
        return 2;
    }
    netif_set_default(&board_netif);
    netif_set_up(&board_netif);

    radar_udp = udp_new();
    if (radar_udp == NULL || udp_bind(radar_udp, IP_ADDR_ANY, RADAR_UDP_PORT) != ERR_OK) {
        xil_printf("FAIL: UDP bind port %u\r\n", RADAR_UDP_PORT);
        return 3;
    }
    udp_recv(radar_udp, udp_receive, NULL);
    xil_printf("UDP ready: %s:%u; LED0=TX gate, LED1=frame analyzed, LED2=signal detected, LED3=valid reply queued\r\n", RADAR_BOARD_IP, RADAR_UDP_PORT);
    while (1) xemacif_input(&board_netif);
}
