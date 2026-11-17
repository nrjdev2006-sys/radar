#include <stdio.h>
#include <string.h>

#include "xparameters.h"
#include "xil_printf.h"
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
#define RDR_HEADER_SIZE      16u
#define RDR_CRC_SIZE         4u
#define RDR_MAX_PACKET       1400u

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
                       u8_t type, u32_t sequence, const u8_t *payload, u16_t payload_len)
{
    u8_t packet[RDR_MAX_PACKET];
    struct pbuf *out;
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
            (void)udp_sendto(pcb, out, addr, port);
        pbuf_free(out);
    }
}

static void udp_receive(void *arg, struct udp_pcb *pcb, struct pbuf *p,
                        const ip_addr_t *addr, u16_t port)
{
    u8_t packet[RDR_MAX_PACKET], response[160];
    u16_t length;
    u32_t payload_len, seq, expected_crc, actual_crc;
    u8_t reply_type = 128;
    int response_len = 0;
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
    case 16: { /* IQ_SAMPLES: validate and report samples received by PS */
        u32_t count, i;
        u16_t peak = 0;
        if ((payload_len & 3u) != 0) { reply_type = 255; response_len = snprintf((char *)response, sizeof(response), "{\"error\":\"IQ payload must contain int16 I/Q pairs\"}"); break; }
        count = payload_len / 4u;
        for (i = 0; i < payload_len; i += 2) {
            s16_t value = (s16_t)read_be16(packet + RDR_HEADER_SIZE + i);
            u16_t magnitude = (value == (s16_t)-32768) ? 32768u : (u16_t)(value < 0 ? -value : value);
            if (magnitude > peak) peak = magnitude;
        }
        response_len = snprintf((char *)response, sizeof(response),
                                "{\"status\":\"received\",\"sample_count\":%u,\"peak_component\":%u}",
                                (unsigned)count, (unsigned)peak);
        break;
    }
    default:
        reply_type = 255;
        response_len = snprintf((char *)response, sizeof(response), "{\"error\":\"unsupported message type\"}");
        break;
    }
    if (response_len > 0 && response_len < (int)sizeof(response))
        send_reply(pcb, addr, port, reply_type, seq, response, (u16_t)response_len);
}

int main(void)
{
    unsigned char mac[6] = {0x00, 0x0a, 0x35, 0x7a, 0x01, 0x10};
    ip_addr_t ip, mask, gateway;
    err_t err;
    xil_printf("Zybo Z7-10 radar UDP bring-up\r\n");
    if (radar_attach(&radar, (volatile u32_t *)(UINTPTR)RADAR_BASEADDR) != RADAR_OK ||
        radar_configure(&radar, RADAR_DEMO_PW_TICKS, RADAR_DEMO_PRI_TICKS) != RADAR_OK ||
        radar_start(&radar) != RADAR_OK) {
        xil_printf("FAIL: radar PL setup\r\n");
        return 1;
    }

    IP4_ADDR(&ip, 192, 168, 1, 10);
    IP4_ADDR(&mask, 255, 255, 255, 0);
    IP4_ADDR(&gateway, 192, 168, 1, 1);
    init_platform();
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
    xil_printf("UDP ready: %s:%u; TX gate pulsing on LED 0\r\n", RADAR_BOARD_IP, RADAR_UDP_PORT);
    while (1) xemacif_input(&board_netif);
}
