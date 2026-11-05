#ifndef RADAR_DRIVER_H
#define RADAR_DRIVER_H

#include <stdint.h>

/* AXI-Lite register offsets. A board-specific SDK app supplies the base address. */
#define RADAR_REG_CONTROL       0x00u
#define RADAR_REG_PW_TICKS      0x04u
#define RADAR_REG_PRI_TICKS     0x08u
#define RADAR_REG_STATUS        0x0Cu
#define RADAR_REG_PULSE_COUNT   0x10u

#define RADAR_CONTROL_START     (1u << 0)
#define RADAR_CONTROL_STOP      (1u << 1)

#define RADAR_STATUS_BUSY       (1u << 0)
#define RADAR_STATUS_CONFIG_ERR (1u << 1)
#define RADAR_STATUS_TX_GATE    (1u << 2)

typedef struct {
    volatile uint32_t *registers;
} radar_device_t;

typedef struct {
    uint32_t busy;
    uint32_t config_error;
    uint32_t tx_gate;
    uint32_t pulse_count;
} radar_status_t;

typedef enum {
    RADAR_OK = 0,
    RADAR_INVALID_ARGUMENT = -1,
    RADAR_INVALID_TIMING = -2
} radar_result_t;

radar_result_t radar_attach(radar_device_t *device, volatile uint32_t *register_base);
radar_result_t radar_configure(radar_device_t *device, uint32_t pw_ticks, uint32_t pri_ticks);
radar_result_t radar_start(radar_device_t *device);
radar_result_t radar_stop(radar_device_t *device);
radar_result_t radar_read_status(radar_device_t *device, radar_status_t *status);

#endif
