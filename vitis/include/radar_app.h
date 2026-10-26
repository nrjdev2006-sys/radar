#ifndef RADAR_APP_H
#define RADAR_APP_H

#include <stdint.h>
#include "packet.h"

void radar_core_init(void);
void radar_core_apply_header(const radar_pkt_hdr_t *h);
int  radar_dma_init(void);
int  radar_dma_kick(uint32_t *buf, uint32_t nbytes);
int  radar_dma_wait_idle(uint32_t timeout_loops);
int  radar_wait_peak(uint32_t timeout_loops);
void radar_read_pl(uint32_t *peak_bin, uint32_t *peak_mag2,
                   uint32_t *pw_samp, uint32_t *pri_samp,
                   uint32_t *pulse_count, uint32_t *status);
void radar_compute_and_print(const radar_pkt_hdr_t *last_hdr,
                             uint32_t peak_bin, uint32_t peak_mag2,
                             uint32_t pw_samp, uint32_t pri_samp,
                             uint32_t pulse_count, uint32_t status,
                             uint32_t pkt_loss, uint32_t dma_errors,
                             uint32_t frame_id,
                             radar_result_t *out);

int  radar_udp_start(void);
void radar_udp_send_result(const radar_result_t *r);

/* Filled by the UDP callback, consumed in main. */
extern volatile uint32_t g_samples_ready;   /* complex samples in circ buf */
extern volatile uint32_t g_pkt_loss;
extern volatile uint32_t g_pkt_ok;
extern radar_pkt_hdr_t   g_last_hdr;
extern uint32_t          g_iq_buf[RADAR_CIRC_SAMPLES]; /* {Q,I} packed */

#endif /* RADAR_APP_H */
