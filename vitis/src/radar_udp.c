#include "radar_app.h"
#include "radar_config.h"
#include "xil_printf.h"
#include "lwip/udp.h"
#include "lwip/ip_addr.h"
#include <string.h>

volatile uint32_t g_samples_ready = 0;
volatile uint32_t g_pkt_loss      = 0;
volatile uint32_t g_pkt_ok        = 0;
radar_pkt_hdr_t   g_last_hdr;
uint32_t          g_iq_buf[RADAR_CIRC_SAMPLES]
                    __attribute__((aligned(32)));

static struct udp_pcb *s_pcb;
static struct udp_pcb *s_tx_pcb;
static ip_addr_t       s_peer_ip;
static u16_t           s_peer_port;
static int             s_have_peer;
static uint32_t        s_expect_seq;
static uint32_t        s_wr;          /* write index into g_iq_buf */

static void udp_rx(void *arg, struct udp_pcb *pcb, struct pbuf *p,
                   const ip_addr_t *addr, u16_t port)
{
    radar_pkt_hdr_t hdr;
    const u8_t *payload;
    uint32_t i, n, need;

    (void)arg;
    (void)pcb;

    if (!p)
        return;

    if (p->tot_len < (u16_t)sizeof(radar_pkt_hdr_t)) {
        pbuf_free(p);
        return;
    }

    memcpy(&hdr, p->payload, sizeof(hdr));
    if (hdr.magic != RADAR_PKT_MAGIC) {
        pbuf_free(p);
        return;
    }

    if (g_pkt_ok > 0u && hdr.seq != s_expect_seq)
        g_pkt_loss += (hdr.seq > s_expect_seq) ? (hdr.seq - s_expect_seq) : 1u;
    s_expect_seq = hdr.seq + 1u;
    g_pkt_ok++;

    ip_addr_copy(s_peer_ip, *addr);
    s_peer_port = port;
    s_have_peer = 1;
    g_last_hdr  = hdr;

    n = hdr.sample_count;
    if (n > RADAR_MAX_PKT_SAMPLES)
        n = RADAR_MAX_PKT_SAMPLES;
    need = n * 4u; /* int16 I + int16 Q */
    if ((uint32_t)p->tot_len < sizeof(hdr) + need) {
        pbuf_free(p);
        return;
    }

    payload = (const u8_t *)p->payload + sizeof(hdr);
    for (i = 0; i < n; i++) {
        int16_t i_s, q_s;
        if (g_samples_ready >= RADAR_CIRC_SAMPLES)
            break; /* drop rather than overwrite unread frames */
        memcpy(&i_s, payload + i * 4u,     2);
        memcpy(&q_s, payload + i * 4u + 2, 2);
        /* Pack as {Q, I} matching PL tdata[31:0] */
        g_iq_buf[s_wr] = ((uint32_t)(uint16_t)q_s << 16) | (uint16_t)i_s;
        s_wr++;
        if (s_wr >= RADAR_CIRC_SAMPLES)
            s_wr = 0;
        g_samples_ready++;
    }

    radar_core_apply_header(&hdr);
    pbuf_free(p);
}

int radar_udp_start(void)
{
    err_t e;
    memset(&g_last_hdr, 0, sizeof(g_last_hdr));
    s_pcb = udp_new();
    if (!s_pcb) {
        xil_printf("ERROR: udp_new failed\r\n");
        return -1;
    }
    e = udp_bind(s_pcb, IP_ADDR_ANY, RADAR_UDP_DATA_PORT);
    if (e != ERR_OK) {
        xil_printf("ERROR: udp_bind %d failed\r\n", RADAR_UDP_DATA_PORT);
        return -1;
    }
    udp_recv(s_pcb, udp_rx, NULL);

    s_tx_pcb = udp_new();
    xil_printf("UDP listening on port %d (I/Q), results -> peer :%d\r\n",
               RADAR_UDP_DATA_PORT, RADAR_UDP_RESULT_PORT);
    return 0;
}

void radar_udp_send_result(const radar_result_t *r)
{
    struct pbuf *p;
    if (!s_have_peer || !s_tx_pcb || !r)
        return;
    p = pbuf_alloc(PBUF_TRANSPORT, sizeof(*r), PBUF_RAM);
    if (!p)
        return;
    memcpy(p->payload, r, sizeof(*r));
    udp_sendto(s_tx_pcb, p, &s_peer_ip, RADAR_UDP_RESULT_PORT);
    pbuf_free(p);
}
