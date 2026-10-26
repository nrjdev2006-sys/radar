#!/usr/bin/env python3
"""
Shared radar constants, UDP header layout, and the RF-frequency threshold.

The detection threshold is computed from the radar carrier frequency so a
2.4 GHz Pluto session and a 10 GHz X-band session do not share one magic
number. Python writes that threshold into every UDP header; the PS copies
it into the PL pulse-detector register.

Received-power scaling (radar equation, other terms held constant):

    Pr ~ λ²  ~  1 / f²
    amplitude ~ 1 / f

A 2.4 GHz short-range echo is the reference amplitude; higher RF lowers
the expected echo and the threshold tracks it, never dropping below a
noise-floor + SNR floor.
"""
from __future__ import annotations

import math
import struct
from dataclasses import dataclass

# ---- defaults (keep in sync with config/defaults.cfg and radar_config.h) ----
FFT_SIZE = 1024
SAMPLE_RATE_HZ = 10_000_000
BOARD_IP = "192.168.1.10"
UDP_DATA_PORT = 5000
UDP_RESULT_PORT = 5001

C_MPS = 299_792_458.0

DEFAULT_RADAR_FREQ_HZ = 2.4e9
DEFAULT_BANDWIDTH_HZ = 100e6
DEFAULT_T_CHIRP_S = 1e-3
DEFAULT_PW_S = 50e-6
DEFAULT_PRF_HZ = 5_000.0
DEFAULT_TONE_HZ = 1.0e6
DEFAULT_AMP = 16_000

PKT_MAGIC = 0x52444152  # 'RADR'
RES_MAGIC = 0x52534C54  # 'RSLT'

# Header: 12 x uint32 little-endian = 48 bytes
HDR_STRUCT = struct.Struct("<12I")
RES_STRUCT = struct.Struct("<16I8f")  # packed radar_result_t: 16 u32 + 8 float

FLAG_WINDOW = 1 << 0
FLAG_PULSE_RESET = 1 << 1

# ---- threshold model --------------------------------------------------------
F_REF_HZ = 2.4e9          # reference RF (Pluto ISM / this project's default)
AMP_REF = 12_000.0        # expected 16-bit echo amplitude at F_REF, short range
NOISE_AMP = 80.0          # quantization / analog noise floor of scaled I/Q
MIN_SNR_DB = 12.0         # keep threshold at least this far above noise^2
ECHO_FRACTION = 0.30      # detect at 30 % of the expected echo amplitude


def threshold_from_radar_freq(radar_freq_hz: float) -> int:
    """Return a mag^2 = I^2+Q^2 threshold for the PL pulse detector."""
    f = max(float(radar_freq_hz), 1.0e6)
    expected_amp = AMP_REF * (F_REF_HZ / f)
    expected_amp = max(expected_amp, NOISE_AMP * 4.0)
    noise_th = int((NOISE_AMP ** 2) * (10.0 ** (MIN_SNR_DB / 10.0)))
    signal_th = int((ECHO_FRACTION * expected_amp) ** 2)
    return max(noise_th, signal_th, 1)


def fmcw_distance_m(f_beat_hz: float, t_chirp_s: float, bandwidth_hz: float) -> float:
    """R = (c * f_beat * T_chirp) / (2 * B)  — change here to swap formulas."""
    if f_beat_hz <= 0.0 or t_chirp_s <= 0.0 or bandwidth_hz <= 0.0:
        return 0.0
    return (C_MPS * f_beat_hz * t_chirp_s) / (2.0 * bandwidth_hz)


def unambiguous_range_m(prf_hz: float) -> float:
    if prf_hz <= 0.0:
        return 0.0
    return C_MPS / (2.0 * prf_hz)


def wavelength_m(freq_hz: float) -> float:
    if freq_hz <= 0.0:
        return 0.0
    return C_MPS / freq_hz


@dataclass
class RadarHeader:
    seq: int = 0
    sample_count: int = 0
    sample_rate_hz: int = SAMPLE_RATE_HZ
    radar_freq_hz: int = int(DEFAULT_RADAR_FREQ_HZ)
    bandwidth_hz: int = int(DEFAULT_BANDWIDTH_HZ)
    t_chirp_ns: int = int(DEFAULT_T_CHIRP_S * 1e9)
    pw_ns: int = int(DEFAULT_PW_S * 1e9)
    prf_hz: int = int(DEFAULT_PRF_HZ)
    threshold: int = 0
    flags: int = FLAG_WINDOW
    reserved: int = 0

    def pack(self) -> bytes:
        th = self.threshold or threshold_from_radar_freq(self.radar_freq_hz)
        return HDR_STRUCT.pack(
            PKT_MAGIC,
            self.seq & 0xFFFFFFFF,
            self.sample_count & 0xFFFFFFFF,
            int(self.sample_rate_hz) & 0xFFFFFFFF,
            int(self.radar_freq_hz) & 0xFFFFFFFF,
            int(self.bandwidth_hz) & 0xFFFFFFFF,
            int(self.t_chirp_ns) & 0xFFFFFFFF,
            int(self.pw_ns) & 0xFFFFFFFF,
            int(self.prf_hz) & 0xFFFFFFFF,
            int(th) & 0xFFFFFFFF,
            int(self.flags) & 0xFFFFFFFF,
            int(self.reserved) & 0xFFFFFFFF,
        )


def pack_packet(hdr: RadarHeader, i16, q16) -> bytes:
    """i16, q16: sequences of int16. Interleaved I,Q little-endian."""
    n = len(i16)
    hdr.sample_count = n
    payload = b"".join(struct.pack("<hh", int(i), int(q)) for i, q in zip(i16, q16))
    return hdr.pack() + payload


def unpack_result(data: bytes) -> dict | None:
    if len(data) < RES_STRUCT.size:
        return None
    t = RES_STRUCT.unpack(data[: RES_STRUCT.size])
    if t[0] != RES_MAGIC:
        return None
    keys = [
        "magic", "frame_id", "status", "peak_bin", "peak_mag2",
        "pw_samples", "pri_samples", "pulse_count", "fft_size",
        "sample_rate_hz", "radar_freq_hz", "bandwidth_hz", "t_chirp_ns",
        "threshold", "pkt_loss", "dma_errors",
        "freq_hz", "wavelength_m", "rf_lambda_m", "pw_s", "pri_s",
        "prf_hz", "distance_m", "r_unamb_m",
    ]
    return dict(zip(keys, t))


def format_result_table(r: dict) -> str:
    lines = [
        f"======== RADAR FRAME #{r['frame_id']} ========",
        f"Status     : 0x{r['status']:08x}   pkt_loss={r['pkt_loss']}  dma_err={r['dma_errors']}  pulses={r['pulse_count']}",
        f"Radar f    : {r['radar_freq_hz']} Hz",
        f"Threshold  : {r['threshold']}  (mag^2)",
        f"FFT        : N={r['fft_size']}  peak_bin={r['peak_bin']}  mag2={r['peak_mag2']}",
        f"Frequency  : {r['freq_hz']:.6f} Hz",
        f"Wavelength : {r['wavelength_m']:.6f} m  (beat/tone)",
        f"RF lambda  : {r['rf_lambda_m']:.6f} m",
        f"PW         : {r['pw_s'] * 1e6:.3f} us",
        f"PRI        : {r['pri_s'] * 1e6:.3f} us",
        f"PRF        : {r['prf_hz']:.3f} Hz",
        f"Distance   : {r['distance_m']:.6f} m  (FMCW: c*f*T/(2B))",
        f"R_unamb    : {r['r_unamb_m']:.3f} m  (c/(2*PRF))",
        "=================================",
    ]
    return "\n".join(lines)


if __name__ == "__main__":
    for f in (800e6, 2.4e9, 5.8e9, 10e9):
        th = threshold_from_radar_freq(f)
        print(f"f={f/1e9:.2f} GHz  threshold(mag^2)={th}  amp~{math.sqrt(th):.1f}")
