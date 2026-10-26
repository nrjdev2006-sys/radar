/*
 * Optional Linux userspace port (PetaLinux / Ubuntu on Zynq).
 * Ethernet is a normal UDP socket; DMA/FFT still go through /dev/mem
 * mapped AXI-Lite + a kernel DMA driver, OR you can run frequency
 * estimation in software as a bring-up check.
 *
 * This file is a UDP + math bring-up helper: it receives the same
 * packets the FPGA would, runs the same distance / PRI / PW / PRF
 * printout, and is useful when you want to verify the PC streamer
 * before the bitstream is ready.
 *
 * Build on the PC or the board:
 *   gcc -O2 -o radar_ps_linux radar_ps_linux.c -lm
 *   ./radar_ps_linux
 */

#define _GNU_SOURCE
#include <arpa/inet.h>
#include <math.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#define MAGIC           0x52444152u
#define PORT            5000
#define FFT_N           1024
#define C_MPS           299792458.0

typedef struct __attribute__((packed)) {
    uint32_t magic, seq, sample_count, sample_rate_hz;
    uint32_t radar_freq_hz, bandwidth_hz, t_chirp_ns, pw_ns, prf_hz;
    uint32_t threshold, flags, reserved;
} hdr_t;

int main(void)
{
    int fd = socket(AF_INET, SOCK_DGRAM, 0);
    struct sockaddr_in a;
    uint8_t buf[2048];
    memset(&a, 0, sizeof(a));
    a.sin_family = AF_INET;
    a.sin_port   = htons(PORT);
    a.sin_addr.s_addr = htonl(INADDR_ANY);
    if (bind(fd, (struct sockaddr *)&a, sizeof(a)) < 0) {
        perror("bind");
        return 1;
    }
    printf("Linux UDP sink on port %d — same packet format as the FPGA\n", PORT);

    while (1) {
        ssize_t n = recv(fd, buf, sizeof(buf), 0);
        if (n < (ssize_t)sizeof(hdr_t))
            continue;
        hdr_t h;
        memcpy(&h, buf, sizeof(h));
        if (h.magic != MAGIC)
            continue;
        printf("seq=%u samples=%u fs=%u radar_f=%u Hz th=%u pw_ns=%u prf=%u\n",
               h.seq, h.sample_count, h.sample_rate_hz, h.radar_freq_hz,
               h.threshold, h.pw_ns, h.prf_hz);
        if (h.prf_hz) {
            printf("  PRI(nom)=%.3f us  R_unamb=%.1f m\n",
                   1e6 / (double)h.prf_hz,
                   C_MPS / (2.0 * (double)h.prf_hz));
        }
        (void)n;
    }
}
