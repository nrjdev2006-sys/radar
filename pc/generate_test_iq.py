#!/usr/bin/env python3
"""
Build a canned I/Q file the FPGA (and simulate_dsp.py) can process today.

Default waveform: pulsed complex tone
  fs        = 10 MSPS
  tone      = 1 MHz          -> FFT bin ≈ 102 of 1024
  PW        = 50 us          -> 500 samples
  PRI       = 200 us         -> 2000 samples, PRF = 5 kHz
  radar_f   = 2.4 GHz        -> threshold computed in radar_params.py

Outputs (project data/ folder):
  tone_1mhz_pulsed.bin   interleaved int16 I/Q
  tone_1mhz_pulsed.npy   complex64
  tone_1mhz_pulsed.json  expected measurements
"""
from __future__ import annotations

import argparse
import json
from pathlib import Path

import numpy as np

from radar_params import (
    C_MPS,
    DEFAULT_AMP,
    DEFAULT_BANDWIDTH_HZ,
    DEFAULT_PRF_HZ,
    DEFAULT_PW_S,
    DEFAULT_RADAR_FREQ_HZ,
    DEFAULT_T_CHIRP_S,
    DEFAULT_TONE_HZ,
    FFT_SIZE,
    SAMPLE_RATE_HZ,
    fmcw_distance_m,
    threshold_from_radar_freq,
    unambiguous_range_m,
    wavelength_m,
)

ROOT = Path(__file__).resolve().parents[1]
DATA = ROOT / "data"


def make_pulsed_tone(
    fs: float,
    tone_hz: float,
    pw_s: float,
    pri_s: float,
    seconds: float,
    amp: float,
) -> np.ndarray:
    n = int(round(seconds * fs))
    t = np.arange(n, dtype=np.float64) / fs
    tone = amp * np.exp(1j * 2.0 * np.pi * tone_hz * t)
    pri_n = max(int(round(pri_s * fs)), 1)
    pw_n = max(int(round(pw_s * fs)), 1)
    gate = (np.arange(n) % pri_n) < pw_n
    iq = (tone * gate).astype(np.complex64)
    return iq


def main() -> None:
    ap = argparse.ArgumentParser()
    ap.add_argument("--fs", type=float, default=SAMPLE_RATE_HZ)
    ap.add_argument("--tone", type=float, default=DEFAULT_TONE_HZ)
    ap.add_argument("--pw", type=float, default=DEFAULT_PW_S, help="pulse width seconds")
    ap.add_argument("--prf", type=float, default=DEFAULT_PRF_HZ)
    ap.add_argument("--seconds", type=float, default=0.05)
    ap.add_argument("--amp", type=float, default=DEFAULT_AMP)
    ap.add_argument("--radar-freq", type=float, default=DEFAULT_RADAR_FREQ_HZ)
    ap.add_argument("--bandwidth", type=float, default=DEFAULT_BANDWIDTH_HZ)
    ap.add_argument("--t-chirp", type=float, default=DEFAULT_T_CHIRP_S)
    args = ap.parse_args()

    pri_s = 1.0 / args.prf
    iq = make_pulsed_tone(args.fs, args.tone, args.pw, pri_s, args.seconds, args.amp)

    i16 = np.clip(np.real(iq), -32768, 32767).astype(np.int16)
    q16 = np.clip(np.imag(iq), -32768, 32767).astype(np.int16)
    interleaved = np.empty(i16.size + q16.size, dtype=np.int16)
    interleaved[0::2] = i16
    interleaved[1::2] = q16

    DATA.mkdir(parents=True, exist_ok=True)
    bin_path = DATA / "tone_1mhz_pulsed.bin"
    npy_path = DATA / "tone_1mhz_pulsed.npy"
    js_path = DATA / "tone_1mhz_pulsed.json"
    interleaved.tofile(bin_path)
    np.save(npy_path, iq)

    peak_bin = int(round(args.tone * FFT_SIZE / args.fs))
    freq_est = peak_bin * args.fs / FFT_SIZE
    meta = {
        "format": "interleaved int16 I,Q little-endian (bin); complex64 (npy)",
        "n_samples": int(iq.size),
        "fs_hz": args.fs,
        "tone_hz": args.tone,
        "pw_s": args.pw,
        "pri_s": pri_s,
        "prf_hz": args.prf,
        "radar_freq_hz": args.radar_freq,
        "bandwidth_hz": args.bandwidth,
        "t_chirp_s": args.t_chirp,
        "amp": args.amp,
        "fft_size": FFT_SIZE,
        "expected_peak_bin": peak_bin,
        "expected_freq_hz": freq_est,
        "expected_wavelength_m": wavelength_m(freq_est),
        "expected_rf_lambda_m": wavelength_m(args.radar_freq),
        "expected_distance_m": fmcw_distance_m(freq_est, args.t_chirp, args.bandwidth),
        "expected_r_unamb_m": unambiguous_range_m(args.prf),
        "threshold_mag2": threshold_from_radar_freq(args.radar_freq),
        "pw_samples": int(round(args.pw * args.fs)),
        "pri_samples": int(round(pri_s * args.fs)),
        "c_mps": C_MPS,
    }
    js_path.write_text(json.dumps(meta, indent=2), encoding="utf-8")
    print(f"Wrote {bin_path}  ({iq.size} complex samples, {bin_path.stat().st_size} bytes)")
    print(f"Wrote {npy_path}")
    print(f"Wrote {js_path}")
    print(
        f"Expect: bin={peak_bin}  f={freq_est:.1f} Hz  "
        f"PW={args.pw*1e6:.1f} us  PRF={args.prf:.0f} Hz  "
        f"R={meta['expected_distance_m']:.4f} m  th={meta['threshold_mag2']}"
    )


if __name__ == "__main__":
    main()
