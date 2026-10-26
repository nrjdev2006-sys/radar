#!/usr/bin/env python3
"""
Host-side replica of the PL chain: Hann window, FFT peak (skip DC),
pulse detector with the RF-frequency threshold, then the same distance
math the PS runs. Use this to know what the UART should print.
"""
from __future__ import annotations

import argparse
import json
from pathlib import Path

import numpy as np

from radar_params import (
    DEFAULT_BANDWIDTH_HZ,
    DEFAULT_PRF_HZ,
    DEFAULT_PW_S,
    DEFAULT_RADAR_FREQ_HZ,
    DEFAULT_T_CHIRP_S,
    FFT_SIZE,
    SAMPLE_RATE_HZ,
    fmcw_distance_m,
    format_result_table,
    threshold_from_radar_freq,
    unambiguous_range_m,
    wavelength_m,
)

ROOT = Path(__file__).resolve().parents[1]


def load_iq(path: Path) -> np.ndarray:
    if path.suffix == ".npy":
        x = np.load(path)
        return np.asarray(x, dtype=np.complex64)
    raw = np.fromfile(path, dtype=np.int16)
    return raw[0::2].astype(np.float32) + 1j * raw[1::2].astype(np.float32)


def hann(n: int) -> np.ndarray:
    return 0.5 * (1.0 - np.cos(2.0 * np.pi * np.arange(n) / (n - 1)))


def pulse_metrics(iq: np.ndarray, threshold: int) -> tuple[int, int, int]:
    mag2 = np.real(iq) ** 2 + np.imag(iq) ** 2
    above = mag2 >= threshold
    rises = np.where(np.diff(above.astype(np.int8)) == 1)[0] + 1
    falls = np.where(np.diff(above.astype(np.int8)) == -1)[0] + 1
    if above[0]:
        rises = np.r_[0, rises]
    if above[-1]:
        falls = np.r_[falls, len(above)]
    pw = int(np.median(falls[: len(rises)] - rises[: len(falls)])) if len(rises) and len(falls) else 0
    pri = int(np.median(np.diff(rises))) if len(rises) >= 2 else 0
    return pw, pri, int(len(rises))


def process_frame(iq: np.ndarray, fs: float, nfft: int, threshold: int,
                  radar_freq: float, bandwidth: float, t_chirp: float,
                  frame_id: int) -> dict:
    n = min(nfft, iq.size)
    x = np.zeros(nfft, dtype=np.complex128)
    x[:n] = iq[:n] * hann(n)
    spec = np.fft.fft(x)
    mag2 = (spec.real ** 2 + spec.imag ** 2).astype(np.float64)
    mag2[0] = 0.0
    peak_bin = int(np.argmax(mag2[: nfft // 2]))  # positive freqs, skip DC
    freq = peak_bin * fs / nfft
    pw_s, pri_s, n_pulses = pulse_metrics(iq, threshold)
    pw = pw_s / fs if fs else 0.0
    pri = pri_s / fs if fs else 0.0
    prf = (1.0 / pri) if pri > 0 else 0.0
    return {
        "magic": 0,
        "frame_id": frame_id,
        "status": 0x07,
        "peak_bin": peak_bin,
        "peak_mag2": int(mag2[peak_bin]),
        "pw_samples": pw_s,
        "pri_samples": pri_s,
        "pulse_count": n_pulses,
        "fft_size": nfft,
        "sample_rate_hz": int(fs),
        "radar_freq_hz": int(radar_freq),
        "bandwidth_hz": int(bandwidth),
        "t_chirp_ns": int(t_chirp * 1e9),
        "threshold": int(threshold),
        "pkt_loss": 0,
        "dma_errors": 0,
        "freq_hz": freq,
        "wavelength_m": wavelength_m(freq),
        "rf_lambda_m": wavelength_m(radar_freq),
        "pw_s": pw,
        "pri_s": pri,
        "prf_hz": prf,
        "distance_m": fmcw_distance_m(freq, t_chirp, bandwidth),
        "r_unamb_m": unambiguous_range_m(prf if prf else DEFAULT_PRF_HZ),
    }


def main() -> None:
    ap = argparse.ArgumentParser()
    ap.add_argument("--file", default=str(ROOT / "data" / "tone_1mhz_pulsed.bin"))
    ap.add_argument("--fs", type=float, default=SAMPLE_RATE_HZ)
    ap.add_argument("--nfft", type=int, default=FFT_SIZE)
    ap.add_argument("--radar-freq", type=float, default=DEFAULT_RADAR_FREQ_HZ)
    ap.add_argument("--bandwidth", type=float, default=DEFAULT_BANDWIDTH_HZ)
    ap.add_argument("--t-chirp", type=float, default=DEFAULT_T_CHIRP_S)
    ap.add_argument("--threshold", type=int, default=0, help="0 = from radar-freq")
    ap.add_argument("--frames", type=int, default=3)
    args = ap.parse_args()

    path = Path(args.file)
    iq = load_iq(path)
    th = args.threshold or threshold_from_radar_freq(args.radar_freq)
    print(f"Loaded {iq.size} samples from {path}")
    print(f"threshold={th}  (radar_freq={args.radar_freq} Hz)")

    js = path.with_suffix(".json")
    if js.exists():
        meta = json.loads(js.read_text(encoding="utf-8"))
        print("File metadata expected peak_bin =", meta.get("expected_peak_bin"))

    hop = args.nfft
    for k in range(args.frames):
        sl = iq[k * hop : k * hop + hop]
        if sl.size < args.nfft // 4:
            break
        r = process_frame(sl if sl.size >= hop else iq[k * hop :], args.fs, args.nfft,
                          th, args.radar_freq, args.bandwidth, args.t_chirp, k + 1)
        # Pulse metrics over a longer slice so PRI (2000 samples) is visible
        long = iq[k * hop : k * hop + hop * 4]
        pw, pri, npul = pulse_metrics(long if long.size else sl, th)
        r["pw_samples"] = pw
        r["pri_samples"] = pri
        r["pulse_count"] = npul
        r["pw_s"] = pw / args.fs
        r["pri_s"] = pri / args.fs if pri else DEFAULT_PW_S * 0
        r["prf_hz"] = (args.fs / pri) if pri else 0.0
        r["r_unamb_m"] = unambiguous_range_m(r["prf_hz"] or DEFAULT_PRF_HZ)
        print(format_result_table(r))


if __name__ == "__main__":
    main()
