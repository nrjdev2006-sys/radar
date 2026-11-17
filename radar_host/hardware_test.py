"""Send a synthetic IQ packet to the Zybo and verify its UDP response."""

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
    args = parser.parse_args()
    if not 1 <= args.samples <= 340:
        parser.error("--samples must be from 1 to 340 for one Ethernet datagram")
    if not 0 < args.tone_hz < args.sample_rate_hz / 2:
        parser.error("--tone-hz must be positive and below the Nyquist frequency")

    iq = [
        complex(0.5 * math.cos(2 * math.pi * args.tone_hz * n / args.sample_rate_hz),
                0.5 * math.sin(2 * math.pi * args.tone_hz * n / args.sample_rate_hz))
        for n in range(args.samples)
    ]
    with UDPClient(args.host, args.port, timeout_s=3.0) as client:
        hello = client.request(MessageType.HELLO, expected_types=(MessageType.ACK,))
        print("HELLO:", json.dumps(decode_json_payload(hello.payload), sort_keys=True))
        reply = client.request(
            MessageType.IQ_SAMPLES,
            encode_iq_int16(iq),
            expected_types=(MessageType.ACK,),
        )
    result = decode_json_payload(reply.payload)
    if not isinstance(result, dict) or result.get("status") != "received":
        raise RuntimeError(f"unexpected FPGA response: {result!r}")
    if result.get("sample_count") != args.samples:
        raise RuntimeError(f"FPGA counted {result.get('sample_count')} samples, expected {args.samples}")
    if result.get("peak_component", 0) < 16000:
        raise RuntimeError(f"FPGA peak sample value is unexpectedly low: {result!r}")
    print("FPGA IQ response:", json.dumps(result, sort_keys=True))
    print(f"PASS: {args.samples} synthetic IQ samples reached the Zybo PS over Ethernet")


if __name__ == "__main__":
    main()
