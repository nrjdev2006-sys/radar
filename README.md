# Zynq FPGA Radar-Style Signal Processor

Ethernet I/Q in → PL FFT + pulse detector → **frequency, wavelength, PW, PRI, PRF, distance** on UART (and back to the PC).

Works today with a pre-recorded or synthesized file. Tomorrow, point the same Python streamer at an ADALM-Pluto (`--mode pluto`). **No FPGA changes.**

Target board in this tree: **Digilent Zybo Z7-10** (`xc7z010clg400-1`), Vivado **2024.2** + Vitis **2024.2**. ZedBoard / Zybo Z7-20 / generic Zynq-7000 are TCL options.

---

## What you get on the console

```
======== RADAR FRAME #12 ========
Radar f    : 2400000000 Hz
Threshold  : 12960000  (mag^2, from PC / radar freq)
FFT        : N=1024  peak_bin=102  mag2=...
Frequency  : 996093.750000 Hz
Wavelength : 300.97 m          (of beat/tone)
RF lambda  : 0.1249 m          (c / radar_freq)
PW         : 50.000 us
PRI        : 200.000 us
PRF        : 5000.000 Hz
Distance   : 1493.11 m         (FMCW: c*f*T/(2B)  with B=100 MHz, T=1 ms)
R_unamb    : 29979 m           (c/(2*PRF))
=================================
```

Canned test tone: **1 MHz** at **10 MSPS** → bin **102**. Pulse train: **PW = 50 µs**, **PRF = 5 kHz**.

---

## Architecture (short)

```
PC  streamer.py  --UDP:5000-->  Zynq PS (lwIP, DDR circular buffer, AXI DMA)
                                      |
                                      v
                                 PL: window -> Xilinx FFT -> peak
                                     pulse detector (PW / PRI)
                                      |
                                      v
                                 AXI-Lite readout -> UART + UDP:5001
```

Full diagram: [`docs/architecture.md`](docs/architecture.md).  
Registers: [`docs/register_map.md`](docs/register_map.md).  
Packets: [`docs/packet_format.md`](docs/packet_format.md).

The **threshold** is not a magic constant in the FPGA. Python computes it from `--radar-freq` (radar equation, amplitude ~ 1/f) and puts it in every UDP header. The PS writes `REG_THRESHOLD`. Change the RF frequency, the detector tracks it.

---

## Repository layout

```
zynq-radar-sp/
  hdl/                 radar_core + window + peak + pulse detector
  vivado/              create_project.tcl, create_bd.tcl, constraints
  vitis/src            bare-metal C (UDP, DMA, math)
  vitis/linux_alt      optional Linux UDP sink (streamer bring-up)
  pc/                  Python streamer, test-file generator, DSP replica
  data/                generated I/Q (after generate_test_iq.py)
  config/defaults.cfg  shared numbers
  docs/
```

---

## 0. One-time setup

Hardware

- Zybo Z7-10, Ethernet cable to the PC (or a switch).
- USB-UART (on-board FT2232) for the console, **115200 8N1**.
- Optional: ADALM-Pluto on USB for live mode.

PC software

- Vivado 2024.2, Vitis 2024.2
- Digilent Vivado board files: https://github.com/Digilent/vivado-boards  
  (without them the part still builds; you must enable **ENET0** + **UART1** in the PS yourself)
- Python 3.9+ : `pip install -r pc/requirements.txt`

Network (defaults — change in `vitis/include/radar_config.h` and `pc/radar_params.py`)

| | |
|--|--|
| Board IP | `192.168.1.10` |
| PC IP    | `192.168.1.100` (example) |
| Mask     | `255.255.255.0` |
| Data UDP | `5000` |
| Result UDP | `5001` |

Give the PC a static address on the same subnet. Pluto’s `192.168.2.1` is a **second** NIC/USB interface; the streamer talks to the Zybo on `192.168.1.10` and to Pluto on `ip:pluto.local` independently.

---

## 1. Generate the Hann ROM and a test I/Q file

```powershell
cd C:\Users\Dell\zynq-radar-sp\pc
python generate_hann_rom.py
python generate_test_iq.py
python simulate_dsp.py
```

`simulate_dsp.py` is the host replica of the FPGA math. Confirm you see bin ≈ 102, PW ≈ 50 µs, PRF ≈ 5000 Hz, a finite distance. That is what the UART should print.

---

## 2. Build the FPGA (Vivado)

From a Vivado 2024.2 Tcl shell:

```tcl
cd C:/Users/Dell/zynq-radar-sp/vivado
# bitstream: set BUILD_BIT 1  (or generate it in the GUI)
set BUILD_BIT 1
set BOARD zybo-z7-10
set FFT_SIZE 1024
source create_project.tcl
```

Or GUI: `source create_project.tcl` with `BUILD_BIT 0`, then **Generate Bitstream**.

Export hardware **with bitstream**:

`File → Export → Export Hardware`  
to `zynq-radar-sp/vivado/radar_system_wrapper.xsa`

Block design (created for you):

- Zynq PS: ENET0, UART1 115200, HP0 32-bit, GP0, FCLK0 = 100 MHz, IRQ_F2P
- AXI DMA MM2S only (simple mode)
- `radar_core` (module reference) + Xilinx FFT 9.1 (1024, pipelined, 16-bit, scaled)
- `eth_rst_n` tied high (Zybo RTL8211E pin E17)
- LEDs: enable, peak_valid, in_pulse, heartbeat

Other boards:

```tcl
set BOARD zybo-z7-20    ;# xc7z020clg400-1, same XDC LEDs
set BOARD zedboard
set BOARD generic
```

On a generic SOM, add PHY-reset / LED pins in `vivado/constraints/generic_zynq.xdc`.

---

## 3. Build the PS application (Vitis)

Bare-metal lwIP is the supported path (Ethernet on Zynq without Linux).

1. New **Platform** from `radar_system_wrapper.xsa`.
2. New **Application** from the **lwIP Echo Server** template (standalone Cortex-A9).
3. Remove template `echo.c`.
4. Add `vitis/src/*.c` and `vitis/include/` to the application (`-I` the include folder).
5. **Keep** the template `platform.c`, `platform.h`, `platform_config.h`.
6. In `lwipopts.h` make sure `LWIP_UDP` is 1, `LWIP_DHCP` is 0, `PBUF_POOL_BUFSIZE` ≥ 1700. A ready list is in `vitis/src/NOTES_PLATFORM.txt`.
7. Build, program the FPGA, run. UART banner:

```
 Zynq Radar Signal Processor (PS)
 FFT=1024  fs=10000000 Hz  IP=192.168.1.10  UDP=5000
```

If `radar_core MAGIC` is not `0x52444152`, the AXI-Lite base is wrong — set `RADAR_CORE_BASEADDR` in `radar_config.h` from `xparameters.h`.

---

## 4. Stream I/Q from the PC

Board programmed and application running, then:

```powershell
cd C:\Users\Dell\zynq-radar-sp\pc
python streamer.py --mode synth --ip 192.168.1.10 --radar-freq 2.4e9
```

File playback (the generated test vector):

```powershell
python streamer.py --mode file --file ..\data\tone_1mhz_pulsed.bin --ip 192.168.1.10
```

Watch the **Vitis / USB-UART console** and the Python window (result UDP on port 5001).

Useful switches:

| Flag | Meaning |
|------|---------|
| `--radar-freq 800e6` | RF / Pluto LO. **Recomputes the pulse threshold.** |
| `--threshold N` | Force mag² threshold (skip the frequency model). |
| `--pw 50e-6 --prf 5000` | Nominal TX pulse / PRF (header + synth waveform). |
| `--bandwidth 100e6 --t-chirp 1e-3` | FMCW **B** and **T** in the distance formula. |
| `--rate-limit` | Pace packets to real-time 10 MSPS (default is “as fast as the NIC”). |
| `--pkt-samples 256` | Samples per UDP datagram (stay under MTU). |

---

## 5. Live ADALM-Pluto (same bitstream)

```powershell
python streamer.py --mode pluto --pluto-uri ip:pluto.local --ip 192.168.1.10 --radar-freq 800e6 --fs 2.083e6 --bandwidth 2e6
```

`--radar-freq` is programmed as the Pluto RX LO **and** sent to the FPGA for λ_RF + threshold. Match `--fs` to what Pluto actually uses (this repo’s default 10 MSPS is above Pluto’s native 61.44 MSPS cap only in the abstract; for live Pluto use a rate the AD9363 accepts, e.g. 2.083e6 as in your existing `Desktop/pluto/test.py`, and pass the same `--fs` so PW/PRI in seconds stay correct).

No HDL, no Vivado, no Vitis rebuild.

---

## Distance, PW, PRI, PRF — where to change them

**Distance** (FMCW placeholder), one function in two places:

```c
/* vitis/src/radar_math.c */
R = (c * f_beat * T_chirp) / (2 * B);
```

```python
# pc/radar_params.py
def fmcw_distance_m(f_beat_hz, t_chirp_s, bandwidth_hz): ...
```

`T_chirp` and `B` come from the UDP header (`--t-chirp`, `--bandwidth`).

**PW / PRI / PRF** are *measured* in the PL (samples above threshold, samples between rising edges) and converted with `fs` from the header. Nominal TX values travel in the same header for comparison.

**Threshold vs radar frequency** — `pc/radar_params.py` → `threshold_from_radar_freq()`. Tune `AMP_REF`, `F_REF_HZ`, `MIN_SNR_DB` there for a real radar.

**FFT size** — change `FFT_SIZE` in `config/defaults.cfg`, `radar_config.h`, `radar_params.py`, and `set FFT_SIZE` before `source create_project.tcl`. Re-run `generate_hann_rom.py` if you also change the ROM length in `axis_window.v`.

---

## Status / errors

| Signal | Where |
|--------|--------|
| Packet loss (sequence gaps) | UART `Pkt loss`, result datagram |
| DMA timeout / kick fail | UART `DMA errors` |
| `peak_valid` timeout | UART note, last PL values still printed |
| Pulse detector lock | STATUS bits `pulse_valid`, `pri_valid`; LEDs on the Zybo |
| AXI-Lite alive | boot `MAGIC = 0x52444152` |

---

## Clocking and widths (realistic for 10 MSPS)

- 32-bit I/Q @ 10 MSPS = 40 MB/s — Gigabit Ethernet and HP0 @ 100 MHz cover this with margin.
- FFT is block-wise (1024 samples), not a continuous 10 MSPS pipeline through the fabric. The pulse detector sees every sample the DMA ships, so PW/PRI in *samples* stay correct even if the PC is not real-time.

---

## LED map (Zybo Z7)

| LED | Meaning |
|-----|---------|
| LD0 | PL enable |
| LD1 | peak_valid |
| LD2 | currently inside a pulse |
| LD3 | heartbeat |

---

## License / reuse

Written as a complete teaching / lab design. Swap the distance formula and the threshold model freely; keep the UDP header layout if you want the same bitstream to keep working with `streamer.py`.
