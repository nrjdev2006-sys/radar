#ifndef PACKET_H
#define PACKET_H

#include <stdint.h>
#include "radar_config.h"

#ifdef __GNUC__
#define PACKED __attribute__((packed))
#else
#define PACKED
#endif

/*
 * UDP I/Q packet (little-endian), 48-byte header + interleaved int16 I/Q.
 * The PC streamer and this firmware MUST stay in lock-step.
 *
 * flags:
 *   bit 0  window enable (1 = Hann)
 *   bit 1  pulse-detector reset
 *   bit 2  unused
 */
typedef struct PACKED {
    uint32_t magic;           /* RADAR_PKT_MAGIC */
    uint32_t seq;
    uint32_t sample_count;    /* complex samples in this packet */
    uint32_t sample_rate_hz;
    uint32_t radar_freq_hz;   /* RF carrier / Pluto LO */
    uint32_t bandwidth_hz;    /* chirp / RF bandwidth B */
    uint32_t t_chirp_ns;      /* chirp duration */
    uint32_t pw_ns;           /* nominal TX pulse width */
    uint32_t prf_hz;          /* nominal TX PRF */
    uint32_t threshold;       /* mag^2, derived from radar_freq on the PC */
    uint32_t flags;
    uint32_t reserved;
} radar_pkt_hdr_t;

typedef struct PACKED {
    int16_t i;
    int16_t q;
} iq_sample_t;

/*
 * Result datagram sent back to the PC (port RADAR_UDP_RESULT_PORT) so the
 * Python console can print the same numbers as UART.
 */
typedef struct PACKED {
    uint32_t magic;           /* RADAR_RES_MAGIC */
    uint32_t frame_id;
    uint32_t status;
    uint32_t peak_bin;
    uint32_t peak_mag2;
    uint32_t pw_samples;
    uint32_t pri_samples;
    uint32_t pulse_count;
    uint32_t fft_size;
    uint32_t sample_rate_hz;
    uint32_t radar_freq_hz;
    uint32_t bandwidth_hz;
    uint32_t t_chirp_ns;
    uint32_t threshold;
    uint32_t pkt_loss;
    uint32_t dma_errors;
    float    freq_hz;
    float    wavelength_m;
    float    rf_lambda_m;
    float    pw_s;
    float    pri_s;
    float    prf_hz;
    float    distance_m;
    float    r_unamb_m;
} radar_result_t;

#endif /* PACKET_H */
