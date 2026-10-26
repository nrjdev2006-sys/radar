# radar_core AXI-Lite register map

Base address (default): `0x43C0_0000`  
Data width: 32-bit. All offsets are byte addresses.

| Offset | Name        | R/W | Description |
|--------|-------------|-----|-------------|
| 0x00   | CONTROL     | R/W | `[0]` enable, `[1]` soft_reset (write-1, self-clear), `[2]` Hann window enable, `[3]` FFT config kick (write-1) |
| 0x04   | STATUS      | RO  | `[0]` peak_valid, `[1]` pulse_valid (PW captured), `[2]` pri_valid, `[3]` frame_busy, `[4]` in_pulse |
| 0x08   | FFT_SIZE    | R/W | Matches the Xilinx FFT length (default 1024). Used to scale the Hann ROM address. |
| 0x0C   | THRESHOLD   | R/W | Pulse-detector mag² = I²+Q² threshold. Written from each UDP header (derived from radar RF frequency on the PC). |
| 0x10   | PEAK_BIN    | RO  | Strongest non-DC FFT bin of the last completed frame. |
| 0x14   | PEAK_MAG2   | RO  | mag² of that bin. |
| 0x18   | DC_MAG2     | RO  | mag² of bin 0. |
| 0x1C   | PW_SAMPLES  | RO  | Last completed pulse width, in samples. `PW = PW_SAMPLES / fs`. |
| 0x20   | PRI_SAMPLES | RO  | Samples between consecutive rising edges. `PRI = PRI_SAMPLES / fs`, `PRF = 1/PRI`. |
| 0x24   | PULSE_COUNT | RO  | Rising edges seen since reset. |
| 0x28   | BINS_SEEN   | RO  | FFT output samples in the last frame (should equal FFT_SIZE). |
| 0x2C   | LAST_MAG2   | RO  | Time-domain mag² of the most recent I/Q sample (debug). |
| 0x30   | FRAME_COUNT | RO  | Completed FFT frames. |
| 0x34   | MAGIC       | RO  | `0x52444152` (`RADR`). Identity check after boot. |
| 0x38   | SCRATCH     | R/W | Host write/read test. |

AXI DMA (simple mode) default base: `0x4040_0000` (MM2S only).
