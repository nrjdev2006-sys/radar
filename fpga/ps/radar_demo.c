/* Minimal standalone PS example. Set RADAR_BASEADDR from the generated address map. */
#include "radar_driver.h"

#ifndef RADAR_BASEADDR
#error "Define RADAR_BASEADDR from the board-specific Vivado address map"
#endif

#define DEMO_PW_TICKS       10u
#define DEMO_PRI_TICKS      1000u
#define DEMO_BURST_PULSES   8u
#define DEMO_TIMEOUT_POLLS  100000000u

int main(void)
{
    radar_device_t radar;
    radar_status_t status;
    volatile uint32_t *base = (volatile uint32_t *)(uintptr_t)RADAR_BASEADDR;
    uint32_t first_pulse_count;
    uint32_t polls;

    if (radar_attach(&radar, base) != RADAR_OK)
        return 1;
    if (radar_configure(&radar, DEMO_PW_TICKS, DEMO_PRI_TICKS) != RADAR_OK)
        return 2;
    if (radar_read_status(&radar, &status) != RADAR_OK)
        return 3;

    first_pulse_count = status.pulse_count;
    if (radar_start(&radar) != RADAR_OK)
        return 4;

    for (polls = 0; polls < DEMO_TIMEOUT_POLLS; ++polls) {
        if (radar_read_status(&radar, &status) != RADAR_OK)
            return 5;
        if (status.config_error) {
            radar_stop(&radar);
            return 6;
        }
        if ((uint32_t)(status.pulse_count - first_pulse_count) >= DEMO_BURST_PULSES)
            break;
    }

    radar_stop(&radar);
    if (polls == DEMO_TIMEOUT_POLLS)
        return 7;
    return 0;
}
