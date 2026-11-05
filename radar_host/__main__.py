"""Run a reproducible software-only pulsed-radar simulation."""

from __future__ import annotations

import argparse
from dataclasses import asdict
import json

from .model import PulseConfig, analyze_capture, simulate_capture


def format_demo_report(config: PulseConfig, target_range_m: float) -> str:
    capture = simulate_capture(config, target_range_m)
    result = analyze_capture(capture)

    lines = [
        "=" * 80,
        "SYNTHETIC RADAR SIMULATION DEMO (SOFTWARE-ONLY / OFFLINE)",
        "Status: SIMULATED (No FPGA hardware or Ethernet connection)",
        "Target: SYNTHETIC (Mathematical model only; NOT a measured real target)",
        "=" * 80,
        "Simulated Configuration:",
        f"  - Sample Rate:          {config.sample_rate_hz / 1e6:.3f} MHz",
        f"  - Carrier Frequency:    {config.carrier_hz / 1e6:.3f} MHz (Simulated complex IQ)",
        f"  - Pulse Width (PW):     {config.pulse_width_s * 1e6:.3f} us ({config.pulse_width_ticks} clock ticks)",
        f"  - Pulse Rep. Int (PRI): {config.pri_s * 1e6:.3f} us ({config.pri_ticks} clock ticks)",
        f"  - Transmit Pulse Count: {config.pulse_count}",
        f"  - Target Nominal Range: {target_range_m:.3f} m",
        "-" * 80,
        "Software Reference Analysis Results:",
        f"  - Estimated Carrier:    {result.carrier_hz / 1e6:.6f} MHz",
        f"  - Estimated PW:         {result.pulse_width_s * 1e6:.3f} us",
        f"  - Estimated PRI:        {result.pri_s * 1e6:.3f} us",
        f"  - Simulated Echo Delay: {result.echo_delay_s * 1e6:.3f} us",
        f"  - Calculated Range:     {result.range_m:.3f} m (sample-quantized)",
        f"  - TX Pulses Found:      {result.tx_pulse_count}",
        f"  - RX Echoes Found:      {result.rx_echo_count}",
        "=" * 80,
        "NOTE: Physical echo path, RF front-end, and FPGA hardware remain unverified.",
        "=" * 80,
    ]
    return "\n".join(lines)


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--range-m", type=float, default=3000.0)
    parser.add_argument("--sample-rate-hz", type=float, default=20_000_000.0)
    parser.add_argument("--carrier-hz", type=float, default=2_500_000.0)
    parser.add_argument("--pulse-width-us", type=float, default=5.0)
    parser.add_argument("--pri-us", type=float, default=100.0)
    parser.add_argument("--pulse-count", type=int, default=3)
    parser.add_argument(
        "--demo",
        action="store_true",
        help="Display formatted, clearly labeled synthetic demo report",
    )
    args = parser.parse_args()

    config = PulseConfig(
        sample_rate_hz=args.sample_rate_hz,
        carrier_hz=args.carrier_hz,
        pulse_width_s=args.pulse_width_us * 1e-6,
        pri_s=args.pri_us * 1e-6,
        pulse_count=args.pulse_count,
    )

    if args.demo:
        print(format_demo_report(config, args.range_m))
    else:
        result = analyze_capture(simulate_capture(config, args.range_m))
        print(json.dumps(asdict(result), indent=2))


if __name__ == "__main__":
    main()
