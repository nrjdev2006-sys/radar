#include "radar_driver.h"

static volatile uint32_t *reg_at(const radar_device_t *device, uint32_t offset)
{
    return device->registers + (offset / sizeof(uint32_t));
}

radar_result_t radar_attach(radar_device_t *device, volatile uint32_t *register_base)
{
    if (device == 0 || register_base == 0)
        return RADAR_INVALID_ARGUMENT;
    device->registers = register_base;
    return RADAR_OK;
}

radar_result_t radar_configure(radar_device_t *device, uint32_t pw_ticks, uint32_t pri_ticks)
{
    if (device == 0 || device->registers == 0)
        return RADAR_INVALID_ARGUMENT;
    if (pw_ticks == 0 || pri_ticks <= pw_ticks)
        return RADAR_INVALID_TIMING;

    *reg_at(device, RADAR_REG_PW_TICKS) = pw_ticks;
    *reg_at(device, RADAR_REG_PRI_TICKS) = pri_ticks;
    return RADAR_OK;
}

radar_result_t radar_start(radar_device_t *device)
{
    if (device == 0 || device->registers == 0)
        return RADAR_INVALID_ARGUMENT;
    *reg_at(device, RADAR_REG_CONTROL) = RADAR_CONTROL_START;
    return RADAR_OK;
}

radar_result_t radar_stop(radar_device_t *device)
{
    if (device == 0 || device->registers == 0)
        return RADAR_INVALID_ARGUMENT;
    *reg_at(device, RADAR_REG_CONTROL) = RADAR_CONTROL_STOP;
    return RADAR_OK;
}

radar_result_t radar_read_status(radar_device_t *device, radar_status_t *status)
{
    uint32_t raw_status;

    if (device == 0 || device->registers == 0 || status == 0)
        return RADAR_INVALID_ARGUMENT;

    raw_status = *reg_at(device, RADAR_REG_STATUS);
    status->busy = (raw_status & RADAR_STATUS_BUSY) != 0;
    status->config_error = (raw_status & RADAR_STATUS_CONFIG_ERR) != 0;
    status->tx_gate = (raw_status & RADAR_STATUS_TX_GATE) != 0;
    status->pulse_count = *reg_at(device, RADAR_REG_PULSE_COUNT);
    return RADAR_OK;
}
