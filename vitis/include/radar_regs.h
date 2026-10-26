#ifndef RADAR_REGS_H
#define RADAR_REGS_H

#include <stdint.h>
#include "radar_config.h"

/* Byte offsets of radar_core AXI-Lite registers. */
#define REG_CONTROL         0x00u
#define REG_STATUS          0x04u
#define REG_FFT_SIZE        0x08u
#define REG_THRESHOLD       0x0Cu
#define REG_PEAK_BIN        0x10u
#define REG_PEAK_MAG2       0x14u
#define REG_DC_MAG2         0x18u
#define REG_PW_SAMPLES      0x1Cu
#define REG_PRI_SAMPLES     0x20u
#define REG_PULSE_COUNT     0x24u
#define REG_BINS_SEEN       0x28u
#define REG_LAST_MAG2       0x2Cu
#define REG_FRAME_COUNT     0x30u
#define REG_MAGIC           0x34u
#define REG_SCRATCH         0x38u

#define CTRL_ENABLE         (1u << 0)
#define CTRL_SOFT_RESET     (1u << 1)
#define CTRL_WINDOW_EN      (1u << 2)
#define CTRL_CFG_KICK       (1u << 3)

#define STAT_PEAK_VALID     (1u << 0)
#define STAT_PULSE_VALID    (1u << 1)
#define STAT_PRI_VALID      (1u << 2)
#define STAT_FRAME_BUSY     (1u << 3)
#define STAT_IN_PULSE       (1u << 4)

#define RADAR_CORE_MAGIC    0x52444152u

static inline uint32_t radar_read(uint32_t off)
{
    return *(volatile uint32_t *)(RADAR_CORE_BASEADDR + off);
}

static inline void radar_write(uint32_t off, uint32_t val)
{
    *(volatile uint32_t *)(RADAR_CORE_BASEADDR + off) = val;
}

#endif /* RADAR_REGS_H */
