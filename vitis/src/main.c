/*
 * Zynq PS radar application (bare-metal lwIP).
 *
 * Build: create a Vitis application from the "lwIP Echo Server" template
 * using the exported XSA, then replace echo.c with these sources
 * (keep the template's platform.c / platform.h / platform_config.h).
 *
 * Flow:
 *   UDP I/Q packets  -> circular DDR buffer -> AXI DMA -> PL FFT/peak/pulse
 *   PL registers     -> frequency, PW, PRI, PRF, distance printed on UART
 *                    -> result UDP datagram back to the PC
 */

#include "radar_app.h"
#include "radar_config.h"
#include "xil_printf.h"
#include "xil_cache.h"
#include "netif/xadapter.h"
#include "lwip/init.h"
#include "lwipopts.h"
#include "platform.h"
#include "platform_config.h"
#ifdef __has_include
#  if __has_include("xparameters.h")
#    include "xparameters.h"
#  endif
#endif
#include <string.h>

extern volatile int dhcp_timoutcntr;
extern void xemacif_input(struct netif *netif);

static struct netif server_netif;
struct netif *echo_netif = &server_netif; /* some Xilinx platform.c want this name */

static uint32_t dma_frame[RADAR_FFT_SIZE] __attribute__((aligned(32)));
static uint32_t dma_errors;
static uint32_t frame_id;

static void set_ip(struct netif *n)
{
    ip_addr_t ip, mask, gw;
    (void)ipaddr_aton(RADAR_BOARD_IP, &ip);
    (void)ipaddr_aton(RADAR_NETMASK, &mask);
    (void)ipaddr_aton(RADAR_GATEWAY, &gw);
    netif_set_addr(n, &ip, &mask, &gw);
}

static int copy_frame_from_circ(void)
{
    /*
     * Take the oldest RADAR_FFT_SIZE samples. The UDP callback writes
     * sequentially and wraps; for DMA we always use a linear snapshot.
     */
    uint32_t have = g_samples_ready;
    uint32_t start;
    uint32_t i;

    if (have < RADAR_FFT_SIZE)
        return -1;

    /* Oldest sample is (write_ptr - have) mod CIRC. We don't export write_ptr,
     * so keep a local read index. */
    static uint32_t rd;
    start = rd;
    for (i = 0; i < RADAR_FFT_SIZE; i++) {
        dma_frame[i] = g_iq_buf[start];
        start++;
        if (start >= RADAR_CIRC_SAMPLES)
            start = 0;
    }
    rd = start;
    g_samples_ready -= RADAR_FFT_SIZE;
    return 0;
}

int main(void)
{
    unsigned char mac[6] = {0x00, 0x0A, 0x35, 0x00, 0x01, 0x02};

    init_platform();
    Xil_DCacheEnable();
    Xil_ICacheEnable();

    xil_printf("\r\n==============================================\r\n");
    xil_printf(" Zynq Radar Signal Processor (PS)\r\n");
    xil_printf(" FFT=%u  fs=%u Hz  IP=%s  UDP=%u\r\n",
               (unsigned)RADAR_FFT_SIZE,
               (unsigned)RADAR_SAMPLE_RATE_HZ,
               RADAR_BOARD_IP, RADAR_UDP_DATA_PORT);
    xil_printf("==============================================\r\n");

    radar_core_init();
    if (radar_dma_init() != 0) {
        xil_printf("DMA init failed — check xparameters / XSA\r\n");
    }

    lwip_init();
#ifndef PLATFORM_EMAC_BASEADDR
#ifdef XPAR_XEMACPS_0_BASEADDR
#define PLATFORM_EMAC_BASEADDR XPAR_XEMACPS_0_BASEADDR
#else
#define PLATFORM_EMAC_BASEADDR 0xE000B000
#endif
#endif
    if (!xemac_add(&server_netif, NULL, NULL, NULL, mac,
                   PLATFORM_EMAC_BASEADDR)) {
        xil_printf("ERROR: xemac_add failed\r\n");
        return -1;
    }
    set_ip(&server_netif);
    netif_set_default(&server_netif);
    netif_set_up(&server_netif);
    xil_printf("Board IP %s  MAC %02x:%02x:%02x:%02x:%02x:%02x\r\n",
               RADAR_BOARD_IP, mac[0], mac[1], mac[2], mac[3], mac[4], mac[5]);

    platform_enable_interrupts();

    if (radar_udp_start() != 0)
        return -1;

    xil_printf("Waiting for I/Q UDP stream from PC...\r\n");

    while (1) {
        xemacif_input(&server_netif);

        if (copy_frame_from_circ() == 0) {
            uint32_t peak_bin, peak_mag2, pw, pri, pc, st;
            radar_result_t res;
            int dma_st, peak_st;

            dma_st = radar_dma_kick(dma_frame, RADAR_FFT_SIZE * 4u);
            if (dma_st != 0) {
                dma_errors++;
                continue;
            }
            if (radar_dma_wait_idle(2000000u) != 0) {
                dma_errors++;
                xil_printf("DMA timeout\r\n");
                continue;
            }
            peak_st = radar_wait_peak(2000000u);
            radar_read_pl(&peak_bin, &peak_mag2, &pw, &pri, &pc, &st);
            if (peak_st != 0)
                xil_printf("NOTE: peak_valid timeout, printing last PL values\r\n");

            frame_id++;
            memset(&res, 0, sizeof(res));
            radar_compute_and_print(&g_last_hdr, peak_bin, peak_mag2,
                                    pw, pri, pc, st,
                                    g_pkt_loss, dma_errors, frame_id, &res);
            radar_udp_send_result(&res);
        }
    }

    cleanup_platform();
    return 0;
}
