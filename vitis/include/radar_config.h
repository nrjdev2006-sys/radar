#ifndef RADAR_CONFIG_H
#define RADAR_CONFIG_H

/* Keep in sync with config/defaults.cfg and pc/radar_params.py */

#define RADAR_FFT_SIZE          1024u
#define RADAR_SAMPLE_RATE_HZ    10000000u

#define RADAR_BOARD_IP          "192.168.1.10"
#define RADAR_NETMASK           "255.255.255.0"
#define RADAR_GATEWAY           "192.168.1.1"
#define RADAR_UDP_DATA_PORT     5000
#define RADAR_UDP_RESULT_PORT   5001

/* Speed of light (m/s). Change if you want a different c. */
#define SPEED_OF_LIGHT_MPS      299792458.0

/*
 * FMCW placeholder constants. These are overwritten by every UDP header
 * from the PC (bandwidth_hz, t_chirp_ns). The values below are only used
 * if a packet arrives with those fields set to 0.
 *
 * DISTANCE FORMULA (see radar_math.c):
 *   R = (c * f_beat * T_chirp) / (2 * B)
 */
#define DEFAULT_BANDWIDTH_HZ    100000000u
#define DEFAULT_T_CHIRP_NS      1000000u     /* 1 ms */
#define DEFAULT_RADAR_FREQ_HZ   2400000000u
#define DEFAULT_PW_NS           50000u       /* 50 us */
#define DEFAULT_PRF_HZ          5000u

#define RADAR_PKT_MAGIC         0x52444152u  /* 'RADR' */
#define RADAR_RES_MAGIC         0x52534C54u  /* 'RSLT' */

#define RADAR_MAX_FFT           4096u
#define RADAR_MAX_PKT_SAMPLES   512u
#define RADAR_CIRC_SAMPLES      (RADAR_FFT_SIZE * 8u)

/* Hardware bases — overridden by xparameters.h when the BSP is generated. */
#ifndef RADAR_CORE_BASEADDR
#define RADAR_CORE_BASEADDR     0x43C00000u
#endif
#ifndef DMA_DEV_ID
#ifdef XPAR_AXIDMA_0_DEVICE_ID
#define DMA_DEV_ID              XPAR_AXIDMA_0_DEVICE_ID
#else
#define DMA_DEV_ID              0
#endif
#endif

#endif /* RADAR_CONFIG_H */
