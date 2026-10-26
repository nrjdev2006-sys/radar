# UDP packet format

Little-endian. Port **5000** (I/Q to the board), port **5001** (results back to the PC).

## I/Q datagram (PC → Zynq)

48-byte header + `sample_count` × 4 bytes of interleaved int16 I, int16 Q.

| Offset | Type     | Field            | Notes |
|--------|----------|------------------|-------|
| 0      | u32      | magic            | `0x52444152` (`RADR`) |
| 4      | u32      | seq              | Incrementing. PS counts gaps as packet loss. |
| 8      | u32      | sample_count     | Complex samples in this datagram. Default 256 (fits MTU). |
| 12     | u32      | sample_rate_hz   | Default 10 000 000 |
| 16     | u32      | radar_freq_hz    | RF carrier / Pluto LO. Used for RF wavelength and the threshold model. |
| 20     | u32      | bandwidth_hz     | Chirp / RF bandwidth **B** in the FMCW range formula. |
| 24     | u32      | t_chirp_ns       | Chirp duration **T** (nanoseconds). |
| 28     | u32      | pw_ns            | Nominal TX pulse width (printed next to the measured PW). |
| 32     | u32      | prf_hz           | Nominal TX PRF. Fallback if the detector has not locked PRI yet. |
| 36     | u32      | threshold        | mag² pulse threshold. Python sets this from `radar_freq_hz`. |
| 40     | u32      | flags            | bit0 Hann window, bit1 pulse-detector reset |
| 44     | u32      | reserved         | 0 |
| 48     | i16,i16… | I,Q,I,Q,…        | Native endian of the PC (use little-endian pack). |

Keep `48 + sample_count*4 ≤ 1472` so the packet stays under a 1500-byte MTU.

## Result datagram (Zynq → PC)

Packed `radar_result_t` (see `vitis/include/packet.h`): 16 × u32 then 8 × float32.

Printed fields: frequency, wavelength, RF lambda, **PW**, **PRI**, **PRF**, **distance**, unambiguous range, threshold, peak bin.
