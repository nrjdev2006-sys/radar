#include "radar_app.h"
#include "radar_config.h"
#include "xil_printf.h"
#include <math.h>

/*
 * =========================================================================
 * DISTANCE FORMULA — change this function if your radar is not FMCW.
 *
 * Default (FMCW beat-to-range):
 *   R = (c * f_beat * T_chirp) / (2 * B)
 *
 * Pulsed round-trip alternative:
 *   R = (c * delay_s) / 2
 *   delay_s could be a range-gate offset / sample_rate
 *
 * Unambiguous range (always printed, from measured or nominal PRF):
 *   R_unamb = c / (2 * PRF)
 * =========================================================================
 */
static double fmcw_distance_m(double f_beat_hz, double t_chirp_s, double b_hz)
{
    if (b_hz <= 0.0 || t_chirp_s <= 0.0 || f_beat_hz <= 0.0)
        return 0.0;
    return (SPEED_OF_LIGHT_MPS * f_beat_hz * t_chirp_s) / (2.0 * b_hz);
}

/* newlib-nano has no %f in xil_printf; print 3 decimal places with integers. */
static void print_float(const char *label, double v, const char *unit)
{
    int neg = (v < 0.0);
    double a = neg ? -v : v;
    unsigned whole = (unsigned)a;
    unsigned frac = (unsigned)((a - (double)whole) * 1000.0 + 0.5);
    if (frac >= 1000u) {
        whole += 1u;
        frac = 0u;
    }
    xil_printf("%s : %s%u.%03u %s\r\n", label, neg ? "-" : "", whole, frac, unit);
}

void radar_compute_and_print(const radar_pkt_hdr_t *last_hdr,
                             uint32_t peak_bin, uint32_t peak_mag2,
                             uint32_t pw_samp, uint32_t pri_samp,
                             uint32_t pulse_count, uint32_t status,
                             uint32_t pkt_loss, uint32_t dma_errors,
                             uint32_t frame_id,
                             radar_result_t *out)
{
    uint32_t fs  = last_hdr->sample_rate_hz ? last_hdr->sample_rate_hz
                                            : RADAR_SAMPLE_RATE_HZ;
    uint32_t n   = RADAR_FFT_SIZE;
    uint32_t rf  = last_hdr->radar_freq_hz ? last_hdr->radar_freq_hz
                                           : DEFAULT_RADAR_FREQ_HZ;
    uint32_t bw  = last_hdr->bandwidth_hz ? last_hdr->bandwidth_hz
                                          : DEFAULT_BANDWIDTH_HZ;
    uint32_t tns = last_hdr->t_chirp_ns ? last_hdr->t_chirp_ns
                                        : DEFAULT_T_CHIRP_NS;
    uint32_t th  = last_hdr->threshold;

    double freq_hz = ((double)peak_bin * (double)fs) / (double)n;
    double lambda  = (freq_hz > 0.0) ? (SPEED_OF_LIGHT_MPS / freq_hz) : 0.0;
    double rf_lam  = (rf > 0u) ? (SPEED_OF_LIGHT_MPS / (double)rf) : 0.0;
    double pw_s    = (fs > 0u) ? ((double)pw_samp / (double)fs) : 0.0;
    double pri_s   = (fs > 0u) ? ((double)pri_samp / (double)fs) : 0.0;
    double prf     = (pri_s > 0.0) ? (1.0 / pri_s) : 0.0;
    double tchirp  = (double)tns * 1e-9;
    double dist    = fmcw_distance_m(freq_hz, tchirp, (double)bw);
    double r_unamb = (prf > 0.0) ? (SPEED_OF_LIGHT_MPS / (2.0 * prf)) : 0.0;

    /* If the pulse detector has not locked PRI yet, fall back to TX nominal. */
    if (prf <= 0.0 && last_hdr->prf_hz > 0u) {
        prf     = (double)last_hdr->prf_hz;
        pri_s   = 1.0 / prf;
        r_unamb = SPEED_OF_LIGHT_MPS / (2.0 * prf);
    }

    xil_printf("\r\n======== RADAR FRAME #%u ========\r\n", (unsigned)frame_id);
    xil_printf("Status     : 0x%08x  peak=%u pulse=%u pri=%u busy=%u in_pw=%u\r\n",
               (unsigned)status,
               (unsigned)((status >> 0) & 1u),
               (unsigned)((status >> 1) & 1u),
               (unsigned)((status >> 2) & 1u),
               (unsigned)((status >> 3) & 1u),
               (unsigned)((status >> 4) & 1u));
    xil_printf("Pkt loss   : %u    DMA errors : %u    Pulses : %u\r\n",
               (unsigned)pkt_loss, (unsigned)dma_errors, (unsigned)pulse_count);
    xil_printf("Radar f    : %u Hz\r\n", (unsigned)rf);
    xil_printf("Threshold  : %u  (mag^2, from PC / radar freq)\r\n", (unsigned)th);
    xil_printf("FFT        : N=%u  peak_bin=%u  mag2=%u\r\n",
               (unsigned)n, (unsigned)peak_bin, (unsigned)peak_mag2);

    print_float("Frequency  ", freq_hz, "Hz");
    print_float("Wavelength ", lambda,  "m  (of beat/tone)");
    print_float("RF lambda  ", rf_lam,  "m  (c / radar_freq)");
    print_float("PW         ", pw_s * 1e6, "us");
    print_float("PRI        ", pri_s * 1e6, "us");
    print_float("PRF        ", prf, "Hz");
    print_float("Distance   ", dist, "m  (FMCW: c*f*T/(2B))");
    print_float("R_unamb    ", r_unamb, "m  (c/(2*PRF))");

    if (last_hdr->pw_ns)
        xil_printf("TX nom PW  : %u ns\r\n", (unsigned)last_hdr->pw_ns);
    if (last_hdr->prf_hz)
        xil_printf("TX nom PRF : %u Hz\r\n", (unsigned)last_hdr->prf_hz);
    xil_printf("=================================\r\n");

    if (out) {
        out->magic          = RADAR_RES_MAGIC;
        out->frame_id       = frame_id;
        out->status         = status;
        out->peak_bin       = peak_bin;
        out->peak_mag2      = peak_mag2;
        out->pw_samples     = pw_samp;
        out->pri_samples    = pri_samp;
        out->pulse_count    = pulse_count;
        out->fft_size       = n;
        out->sample_rate_hz = fs;
        out->radar_freq_hz  = rf;
        out->bandwidth_hz   = bw;
        out->t_chirp_ns     = tns;
        out->threshold      = th;
        out->pkt_loss       = pkt_loss;
        out->dma_errors     = dma_errors;
        out->freq_hz        = (float)freq_hz;
        out->wavelength_m   = (float)lambda;
        out->rf_lambda_m    = (float)rf_lam;
        out->pw_s           = (float)pw_s;
        out->pri_s          = (float)pri_s;
        out->prf_hz         = (float)prf;
        out->distance_m     = (float)dist;
        out->r_unamb_m      = (float)r_unamb;
    }
}
