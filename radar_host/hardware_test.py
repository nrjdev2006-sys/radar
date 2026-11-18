"""Send a synthetic delayed-echo IQ window and verify the Zybo range result."""

from __future__ import annotations

import argparse
import json
import math

from .protocol import MessageType, UDPClient, decode_json_payload, encode_iq_int16


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--host", default="192.168.1.10", help="Zybo static IPv4 address")
    parser.add_argument("--port", type=int, default=5005)
    parser.add_argument("--samples", type=int, default=256)
    parser.add_argument("--sample-rate-hz", type=float, default=20_000_000.0)
    parser.add_argument("--tone-hz", type=float, default=2_500_000.0)
    parser.add_argument("--echo-range-m", type=float, default=299.792458,
                        help="synthetic echo range encoded into the IQ capture window")
    args = parser.parse_args()
    if not 1 <= args.samples <= 340:
        parser.error("--samples must be from 1 to 340 for one Ethernet datagram")
    if not 0 < args.tone_hz < args.sample_rate_hz / 2:
        parser.error("--tone-hz must be positive and below the Nyquist frequency")
    if args.sample_rate_hz != 20_000_000.0:
        parser.error("the current firmware build uses a fixed 20 MHz IQ sample rate")

    if not math.isfinite(args.echo_range_m) or args.echo_range_m <= 0:
        parser.error("--echo-range-m must be finite and positive")
    echo_index = round(2.0 * args.echo_range_m * args.sample_rate_hz / 299_792_458.0)
    if echo_index < 4 or echo_index + 3 > args.samples:
        parser.error("echo delay must leave room for separated TX and echo pulses in the sample window")

    # This is a digital bench capture: the window starts at the TX reference,
    # with a short reference pulse at sample 0 and a synthetic echo at echo_index.
    iq = [0j] * args.samples
    for start, amplitude in ((0, 0.5), (echo_index, 0.5)):
        for offset in range(3):
            n = start + offset
            phase = 2 * math.pi * args.tone_hz * n / args.sample_rate_hz
            iq[n] = complex(amplitude * math.cos(phase), amplitude * math.sin(phase))
    with UDPClient(args.host, args.port, timeout_s=3.0) as client:
        hello = client.request(MessageType.HELLO, expected_types=(MessageType.ACK,))
        print("HELLO:", json.dumps(decode_json_payload(hello.payload), sort_keys=True))
        reply = client.request(
            MessageType.IQ_SAMPLES,
            encode_iq_int16(iq),
            expected_types=(MessageType.DETECTION, MessageType.ACK),
        )
    result = decode_json_payload(reply.payload)
    if not isinstance(result, dict) or result.get("status") != "detection":
        raise RuntimeError(f"unexpected FPGA response: {result!r}")
    if result.get("sample_count") != args.samples:
        raise RuntimeError(f"FPGA counted {result.get('sample_count')} samples, expected {args.samples}")
    if result.get("peak_component", 0) < 16000:
        raise RuntimeError(f"FPGA peak sample value is unexpectedly low: {result!r}")
    expected_range_m = echo_index * 299_792_458.0 / (2.0 * args.sample_rate_hz)
    if result.get("sample_rate_hz") != int(args.sample_rate_hz):
        raise RuntimeError(f"FPGA used a different sample rate than requested: {result!r}")
    if abs(result.get("range_m", -1.0) - expected_range_m) > 0.01:
        raise RuntimeError(f"FPGA range mismatch: received {result!r}, expected {expected_range_m:.3f} m")
    print("FPGA IQ response:", json.dumps(result, sort_keys=True))
    print(f"PASS: {args.samples} IQ samples reached the Zybo and its range result is {result['range_m']:.3f} m")
    print("NOTE: this validates Ethernet + PS threshold detection using a PC-generated synthetic echo; no RF/ADC measurement is made.")


if __name__ == "__main__":
    main()
