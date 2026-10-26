# Architecture

```
 ADALM-Pluto (optional, USB)          pre-recorded .bin / synth
            \                                /
             \                              /
              +----------- PC Python -------+
              |  streamer.py                |
              |  threshold = f(radar_freq)  |
              |  UDP header + I/Q payload   |
              +--------------+--------------+
                             |  GbE  UDP:5000
                             v
              +-----------------------------+
              | Zynq PS (ARM, bare-metal)   |
              |  lwIP UDP RX                |
              |  circular buffer in DDR     |
              |  AXI DMA MM2S               |
              |  AXI-Lite config / readout  |
              |  λ = c/f , R = c f T / (2B) |
              |  PW, PRI, PRF from samples  |
              |  UART + UDP:5001 results    |
              +--------------+--------------+
                             | AXI HP0 / GP0
                             v
              +-----------------------------+
              | Zynq PL  (100 MHz FCLK0)    |
              |  AXI DMA -> AXIS            |
              |  pulse detector (threshold) |
              |  Hann window                |
              |  Xilinx FFT (1024, 16-bit)  |
              |  peak detector (skip DC)    |
              |  AXI-Lite register file     |
              +-----------------------------+
```

## Why the threshold comes from Python

The pulse detector compares I²+Q² against a 32-bit mag² threshold. A single
hard-coded value cannot cover 800 MHz Pluto tests and a 10 GHz radar: received
amplitude scales as 1/f (radar equation, λ² in Pr). `pc/radar_params.py`
computes the threshold from `--radar-freq` and writes it in every UDP header.
The PS copies it to `REG_THRESHOLD` with no FPGA respin.

## Distance

Default FMCW placeholder (edit `vitis/src/radar_math.c` / `pc/radar_params.py`):

    R = (c * f_beat * T_chirp) / (2 * B)

`f_beat` is the FFT peak converted with `fs / N`. `T_chirp` and `B` arrive in
the UDP header.

Always also printed:

    λ_beat = c / f_beat
    λ_RF   = c / radar_freq
    PW, PRI, PRF  (measured; nominal TX values from the header for comparison)
    R_unamb = c / (2 * PRF)

## Clocking / data widths

| Item | Choice |
|------|--------|
| PL clock | PS FCLK0 = 100 MHz |
| Sample rate | 10 MSPS (header-configurable). DMA bursts faster than real-time; PRI/PW are sample-counts / fs. |
| I/Q | 16-bit signed, packed `{Q, I}` on 32-bit AXIS |
| FFT | Xilinx xfft 9.1, 1024-point, pipelined, scaled, 16-bit, natural order |
| DMA | AXI DMA 7.1, MM2S only, simple mode, 32-bit, burst 256 |

Fits Zybo Z7-10 (`xc7z010clg400-1`).
