#include "radar_app.h"
#include "radar_regs.h"
#include "xil_printf.h"

void radar_core_init(void)
{
    uint32_t magic = radar_read(REG_MAGIC);
    xil_printf("radar_core MAGIC = 0x%08x (expect 0x52444152)\r\n",
               (unsigned)magic);

    radar_write(REG_SCRATCH, 0xA5A50001u);
    if (radar_read(REG_SCRATCH) != 0xA5A50001u) {
        xil_printf("WARNING: AXI-Lite scratch test failed\r\n");
    }

    radar_write(REG_FFT_SIZE, RADAR_FFT_SIZE);
    radar_write(REG_THRESHOLD, 1000000u);
    /* enable + Hann window + kick FFT config */
    radar_write(REG_CONTROL, CTRL_SOFT_RESET);
    radar_write(REG_CONTROL, CTRL_ENABLE | CTRL_WINDOW_EN | CTRL_CFG_KICK);
}

void radar_core_apply_header(const radar_pkt_hdr_t *h)
{
    if (h->threshold != 0u) {
        radar_write(REG_THRESHOLD, h->threshold);
    }
    if (h->flags & 2u) {
        uint32_t c = radar_read(REG_CONTROL);
        radar_write(REG_CONTROL, c | CTRL_SOFT_RESET);
        radar_write(REG_CONTROL, (c & ~CTRL_SOFT_RESET) | CTRL_ENABLE);
    }
    /* window flag: bit 0 */
    {
        uint32_t c = radar_read(REG_CONTROL);
        if (h->flags & 1u)
            c |= CTRL_WINDOW_EN;
        else
            c &= ~CTRL_WINDOW_EN;
        radar_write(REG_CONTROL, c | CTRL_ENABLE);
    }
}

void radar_read_pl(uint32_t *peak_bin, uint32_t *peak_mag2,
                   uint32_t *pw_samp, uint32_t *pri_samp,
                   uint32_t *pulse_count, uint32_t *status)
{
    *status      = radar_read(REG_STATUS);
    *peak_bin    = radar_read(REG_PEAK_BIN);
    *peak_mag2   = radar_read(REG_PEAK_MAG2);
    *pw_samp     = radar_read(REG_PW_SAMPLES);
    *pri_samp    = radar_read(REG_PRI_SAMPLES);
    *pulse_count = radar_read(REG_PULSE_COUNT);
}

int radar_wait_peak(uint32_t timeout_loops)
{
    uint32_t i;
    for (i = 0; i < timeout_loops; i++) {
        if (radar_read(REG_STATUS) & STAT_PEAK_VALID)
            return 0;
    }
    return -1;
}
