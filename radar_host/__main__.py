"""Run a reproducible software-only pulsed-radar simulation."""

from __future__ import annotations

import argparse
from dataclasses import asdict
import json

from .model import PulseConfig, analyze_capture, simulate_capture


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--range-m", type=float, default=3000.0)
    parser.add_argument("--sample-rate-hz", type=float, default=20_000_000.0)
    parser.add_argument("--carrier-hz", type=float, default=2_500_000.0)
    parser.add_argument("--pulse-width-us", type=float, default=5.0)
    parser.add_argument("--pri-us", type=float, default=100.0)
    parser.add_argument("--pulse-count", type=int, default=3)
    args = parser.parse_args()

    config = PulseConfig(
        sample_rate_hz=args.sample_rate_hz,
        carrier_hz=args.carrier_hz,
        pulse_width_s=args.pulse_width_us * 1e-6,
        pri_s=args.pri_us * 1e-6,
        pulse_count=args.pulse_count,
    )
    result = analyze_capture(simulate_capture(config, args.range_m))
    print(json.dumps(asdict(result), indent=2))


if __name__ == "__main__":
    main()
