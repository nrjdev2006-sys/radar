#!/usr/bin/env python3
"""
PC I/Q streamer for the Zynq radar processor.

Modes (same packet format in all three — no FPGA change when you switch):

  file   Read a pre-recorded .bin (int16 I,Q) or .npy (complex) and loop it.
  synth  Generate the pulsed 1 MHz tone on the fly (no file needed).
  pluto  Relay live ADALM-Pluto RX (pyadi-iio / libiio) to the board.

Every UDP datagram carries:
  sequence, sample count, fs, radar RF frequency, bandwidth, T_chirp,
  nominal PW, nominal PRF, and the mag^2 threshold derived from radar_freq.

The FPGA bitstream and PS software are identical for file playback today
and a Pluto relay tomorrow.

Optional: listen on UDP 5001 for result datagrams from the board and print
PW / PRI / PRF / distance next to the local UART output.

Examples
--------
  python streamer.py --mode synth --ip 192.168.1.10
  python streamer.py --mode file --file ../data/tone_1mhz_pulsed.bin
  python streamer.py --mode pluto --pluto-uri ip:pluto.local --radar-freq 800e6
"""
from __future__ import annotations

import argparse
import socket
import struct
import sys
import threading
import time
from pathlib import Path

import numpy as np

from radar_params import (
    BOARD_IP,
    DEFAULT_BANDWIDTH_HZ,
    DEFAULT_PRF_HZ,
    DEFAULT_PW_S,
    DEFAULT_RADAR_FREQ_HZ,
    DEFAULT_T_CHIRP_S,
    DEFAULT_TONE_HZ,
    FFT_SIZE,
    FLAG_PULSE_RESET,
    FLAG_WINDOW,
    SAMPLE_RATE_HZ,
    UDP_DATA_PORT,
    UDP_RESULT_PORT,
    RadarHeader,
    format_result_table,
    pack_packet,
    threshold_from_radar_freq,
    unpack_result,
)

ROOT = Path(__file__).resolve().parents[1]


def to_int16_iq(x: np.ndarray) -> tuple[np.ndarray, np.ndarray]:
    """Convert complex or float arrays to saturated int16 I and Q."""
    x = np.asarray(x)
    if np.iscomplexobj(x):
        i = np.real(x)
        q = np.imag(x)
    elif x.ndim == 1 and x.dtype == np.int16:
        i = x[0::2].astype(np.float64)
        q = x[1::2].astype(np.float64)
    else:
        i = np.real(x)
        q = np.imag(x)
    scale = 1.0
    peak = max(np.max(np.abs(i)) if i.size else 1.0,
               np.max(np.abs(q)) if q.size else 1.0, 1.0)
    # Pluto complex64 is typically ±1..few thousand; scale into int16 if small
    if peak <= 2.0:
        scale = 16000.0
    elif peak < 200.0:
        scale = 16000.0 / peak
    i16 = np.clip(np.round(i * scale), -32768, 32767).astype(np.int16)
    q16 = np.clip(np.round(q * scale), -32768, 32767).astype(np.int16)
    return i16, q16


def load_file(path: Path) -> np.ndarray:
    if path.suffix.lower() == ".npy":
        return np.asarray(np.load(path))
    raw = np.fromfile(path, dtype=np.int16)
    return raw[0::2].astype(np.float32) + 1j * raw[1::2].astype(np.float32)


def synth_chunk(n: int, fs: float, tone: float, pw_s: float, prf: float,
                amp: float, phase0: float) -> tuple[np.ndarray, float]:
    t = (np.arange(n) / fs) + phase0
    pri = 1.0 / prf if prf > 0 else 1.0
    gate = (np.mod(t, pri) < pw_s).astype(np.float64)
    iq = (amp * gate) * np.exp(1j * 2.0 * np.pi * tone * t)
    t_end = phase0 + n / fs
    return iq.astype(np.complex64), t_end


def open_pluto(uri: str, fs: int, radar_freq: int, bandwidth: int, buf: int):
    try:
        import adi
    except ImportError as exc:
        raise SystemExit(
            "pyadi-iio is required for --mode pluto\n"
            "  pip install pyadi-iio numpy\n"
            f"({exc})"
        )
    sdr = adi.Pluto(uri)
    sdr.sample_rate = int(fs)
    sdr.rx_lo = int(radar_freq)
    sdr.rx_rf_bandwidth = int(bandwidth)
    sdr.rx_buffer_size = int(buf)
    sdr.gain_control_mode_chan0 = "slow_attack"
    print(f"Pluto {uri}: LO={radar_freq} Hz  fs={fs} Hz  BW={bandwidth} Hz  buf={buf}")
    return sdr


def result_listener(port: int, stop: threading.Event) -> None:
    sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    sock.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
    sock.bind(("0.0.0.0", port))
    sock.settimeout(0.5)
    print(f"Listening for FPGA results on UDP {port}")
    while not stop.is_set():
        try:
            data, _addr = sock.recvfrom(2048)
        except socket.timeout:
            continue
        except OSError:
            break
        r = unpack_result(data)
        if r:
            print(format_result_table(r), flush=True)
    sock.close()


def parse_args() -> argparse.Namespace:
    ap = argparse.ArgumentParser(description="UDP I/Q streamer for the Zynq radar PL")
    ap.add_argument("--mode", choices=("file", "synth", "pluto"), default="synth",
                    help="file=recorded I/Q, synth=generated pulse train, pluto=live SDR")
    ap.add_argument("--ip", default=BOARD_IP, help="Zynq board IP")
    ap.add_argument("--port", type=int, default=UDP_DATA_PORT)
    ap.add_argument("--file", default=str(ROOT / "data" / "tone_1mhz_pulsed.bin"))
    ap.add_argument("--fs", type=float, default=SAMPLE_RATE_HZ)
    ap.add_argument("--radar-freq", type=float, default=DEFAULT_RADAR_FREQ_HZ,
                    help="RF carrier / Pluto LO. Threshold is derived from this.")
    ap.add_argument("--bandwidth", type=float, default=DEFAULT_BANDWIDTH_HZ)
    ap.add_argument("--t-chirp", type=float, default=DEFAULT_T_CHIRP_S)
    ap.add_argument("--pw", type=float, default=DEFAULT_PW_S, help="nominal TX pulse width (s)")
    ap.add_argument("--prf", type=float, default=DEFAULT_PRF_HZ, help="nominal TX PRF (Hz)")
    ap.add_argument("--tone", type=float, default=DEFAULT_TONE_HZ, help="synth IF / beat (Hz)")
    ap.add_argument("--amp", type=float, default=16000.0)
    ap.add_argument("--threshold", type=int, default=0,
                    help="override mag^2 threshold; 0 = compute from --radar-freq")
    ap.add_argument("--pkt-samples", type=int, default=256,
                    help="complex samples per UDP packet (keep payload under MTU)")
    ap.add_argument("--rate-limit", action="store_true",
                    help="pace packets to ~realtime fs (off = as-fast-as-possible)")
    ap.add_argument("--no-window", action="store_true")
    ap.add_argument("--listen-results", action="store_true", default=True)
    ap.add_argument("--no-listen-results", action="store_false", dest="listen_results")
    ap.add_argument("--pluto-uri", default="ip:pluto.local")
    ap.add_argument("--seconds", type=float, default=0.0, help="stop after N seconds (0=forever)")
    return ap.parse_args()


def main() -> None:
    args = parse_args()
    th = args.threshold or threshold_from_radar_freq(args.radar_freq)
    flags = 0 if args.no_window else FLAG_WINDOW

    print("=== Zynq radar UDP streamer ===")
    print(f"mode        : {args.mode}")
    print(f"dest        : {args.ip}:{args.port}")
    print(f"radar_freq  : {args.radar_freq} Hz")
    print(f"threshold   : {th}  (mag^2, from radar_freq)" if not args.threshold
          else f"threshold   : {th}  (override)")
    print(f"fs          : {args.fs} Hz   pkt={args.pkt_samples} samples")
    print(f"PW nom      : {args.pw*1e6:.3f} us    PRF nom: {args.prf} Hz")
    print(f"B / T_chirp : {args.bandwidth} Hz / {args.t_chirp} s")
    print("Same bitstream works for --mode file|synth today and --mode pluto tomorrow.")

    sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    dest = (args.ip, args.port)

    stop = threading.Event()
    listener = None
    if args.listen_results:
        listener = threading.Thread(target=result_listener,
                                    args=(UDP_RESULT_PORT, stop), daemon=True)
        listener.start()

    sdr = None
    file_iq = None
    file_pos = 0
    phase = 0.0
    if args.mode == "file":
        p = Path(args.file)
        if not p.exists():
            sys.exit(f"Missing {p}. Run: python generate_test_iq.py")
        file_iq = load_file(p)
        print(f"file        : {p}  ({file_iq.size} samples)")
    elif args.mode == "pluto":
        sdr = open_pluto(args.pluto_uri, int(args.fs), int(args.radar_freq),
                         int(args.bandwidth), max(args.pkt_samples, FFT_SIZE))

    hdr = RadarHeader(
        seq=0,
        sample_rate_hz=int(args.fs),
        radar_freq_hz=int(args.radar_freq),
        bandwidth_hz=int(args.bandwidth),
        t_chirp_ns=int(args.t_chirp * 1e9),
        pw_ns=int(args.pw * 1e9),
        prf_hz=int(args.prf),
        threshold=int(th),
        flags=flags | FLAG_PULSE_RESET,
    )

    n_pkt = args.pkt_samples
    t0 = time.time()
    pkt_dt = n_pkt / args.fs if args.fs else 0.0
    sent = 0
    try:
        while True:
            if args.seconds > 0 and (time.time() - t0) >= args.seconds:
                break

            if args.mode == "synth":
                chunk, phase = synth_chunk(n_pkt, args.fs, args.tone, args.pw,
                                           args.prf, args.amp, phase)
            elif args.mode == "file":
                end = file_pos + n_pkt
                if end <= file_iq.size:
                    chunk = file_iq[file_pos:end]
                    file_pos = end
                else:
                    wrap = file_iq[file_pos:]
                    need = n_pkt - wrap.size
                    chunk = np.concatenate([wrap, file_iq[:need]])
                    file_pos = need
            else:  # pluto
                raw = sdr.rx()
                if raw is None or len(raw) == 0:
                    continue
                chunk = np.asarray(raw)
                if chunk.size > n_pkt:
                    # split into MTU-friendly packets
                    for off in range(0, chunk.size, n_pkt):
                        sl = chunk[off:off + n_pkt]
                        i16, q16 = to_int16_iq(sl)
                        hdr.sample_count = i16.size
                        sock.sendto(pack_packet(hdr, i16, q16), dest)
                        hdr.seq += 1
                        hdr.flags = flags  # reset only on first packet
                        sent += 1
                    if args.rate_limit:
                        time.sleep(pkt_dt)
                    continue

            i16, q16 = to_int16_iq(chunk)
            hdr.sample_count = i16.size
            sock.sendto(pack_packet(hdr, i16, q16), dest)
            hdr.seq += 1
            hdr.flags = flags
            sent += 1
            if sent % 200 == 0:
                print(f"sent {sent} packets  seq={hdr.seq}  th={th}", flush=True)
            if args.rate_limit:
                time.sleep(pkt_dt)
    except KeyboardInterrupt:
        print("\nStopped.")
    finally:
        stop.set()
        sock.close()
        print(f"Total packets sent: {sent}")


if __name__ == "__main__":
    main()
