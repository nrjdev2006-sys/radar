"""Small pulsed-IQ simulator and reference measurements.

This module validates the radar math on synthetic, single-target captures. It is
not a driver for an FPGA or RF front end.
"""

from __future__ import annotations

from dataclasses import dataclass
import math
from typing import Sequence


SPEED_OF_LIGHT_M_PER_S = 299_792_458.0


@dataclass(frozen=True)
class PulseConfig:
    """Pulse-train settings for the software reference model."""

    sample_rate_hz: float
    carrier_hz: float
    pulse_width_s: float
    pri_s: float
    pulse_count: int = 3

    def __post_init__(self) -> None:
        if not math.isfinite(self.sample_rate_hz) or self.sample_rate_hz <= 0:
            raise ValueError("sample_rate_hz must be a finite positive number")
        if not math.isfinite(self.carrier_hz) or self.carrier_hz < 0:
            raise ValueError("carrier_hz must be a finite non-negative number")
        if self.carrier_hz >= self.sample_rate_hz / 2:
            raise ValueError("carrier_hz must be below the sample-rate Nyquist limit")
        if not math.isfinite(self.pulse_width_s) or self.pulse_width_s <= 0:
            raise ValueError("pulse_width_s must be a finite positive number")
        if not math.isfinite(self.pri_s) or self.pri_s <= 0:
            raise ValueError("pri_s must be a finite positive number")
        if self.pulse_count < 2:
            raise ValueError("pulse_count must be at least 2 to estimate PRI")
        if self.pulse_width_ticks >= self.pri_ticks:
            raise ValueError("pulse width must be shorter than PRI")
        if self.pulse_width_ticks < 1:
            raise ValueError("pulse width must cover at least one sample")

    @property
    def pulse_width_ticks(self) -> int:
        return round(self.pulse_width_s * self.sample_rate_hz)

    @property
    def pri_ticks(self) -> int:
        return round(self.pri_s * self.sample_rate_hz)


@dataclass(frozen=True)
class Capture:
    """Synthetic transmit-reference and receive-IQ channels."""

    sample_rate_hz: float
    tx_iq: tuple[complex, ...]
    rx_iq: tuple[complex, ...]


@dataclass(frozen=True)
class Measurement:
    """Measured values in SI units, plus the underlying sample timing."""

    pulse_width_s: float
    carrier_hz: float
    pri_s: float
    echo_delay_s: float
    range_m: float
    tx_pulse_count: int
    rx_echo_count: int


def simulate_capture(
    config: PulseConfig,
    target_range_m: float,
    *,
    echo_amplitude: float = 0.5,
) -> Capture:
    """Create ideal TX and delayed single-target RX complex-IQ sample arrays."""

    if not math.isfinite(target_range_m) or target_range_m < 0:
        raise ValueError("target_range_m must be a finite non-negative number")
    if not math.isfinite(echo_amplitude) or echo_amplitude <= 0:
        raise ValueError("echo_amplitude must be a finite positive number")

    fs = config.sample_rate_hz
    delay_ticks = round((2.0 * target_range_m / SPEED_OF_LIGHT_M_PER_S) * fs)
    last_pulse_start = (config.pulse_count - 1) * config.pri_ticks
    sample_count = last_pulse_start + delay_ticks + config.pulse_width_ticks
    tx = [0j] * sample_count
    rx = [0j] * sample_count

    for pulse_index in range(config.pulse_count):
        tx_start = pulse_index * config.pri_ticks
        rx_start = tx_start + delay_ticks
        for offset in range(config.pulse_width_ticks):
            phase = 2.0 * math.pi * config.carrier_hz * (tx_start + offset) / fs
            sample = complex(math.cos(phase), math.sin(phase))
            tx[tx_start + offset] = sample
            rx[rx_start + offset] += echo_amplitude * sample

    return Capture(fs, tuple(tx), tuple(rx))


def _pulse_regions(
    samples: Sequence[complex], threshold_fraction: float
) -> list[tuple[int, int]]:
    if not samples:
        raise ValueError("capture channel is empty")
    if not math.isfinite(threshold_fraction) or not 0 < threshold_fraction < 1:
        raise ValueError("threshold_fraction must be between 0 and 1")

    peak = max(abs(sample) for sample in samples)
    if peak == 0:
        return []
    threshold = peak * threshold_fraction
    regions: list[tuple[int, int]] = []
    start: int | None = None
    for index, sample in enumerate(samples):
        active = abs(sample) > threshold
        if active and start is None:
            start = index
        elif not active and start is not None:
            regions.append((start, index))
            start = None
    if start is not None:
        regions.append((start, len(samples)))
    return regions


def _estimate_frequency_hz(samples: Sequence[complex], start: int, end: int, fs: float) -> float:
    # Average adjacent-sample phase changes. This estimates signed complex-IQ
    # frequency within the Nyquist interval; it is not an RF-frequency counter.
    correlation = sum(
        samples[index + 1] * samples[index].conjugate()
        for index in range(start, end - 1)
    )
    if abs(correlation) == 0:
        raise ValueError("cannot estimate frequency from this pulse")
    return math.atan2(correlation.imag, correlation.real) * fs / (2.0 * math.pi)


def analyze_capture(
    capture: Capture,
    *,
    threshold_fraction: float = 0.25,
    calibrated_system_delay_s: float = 0.0,
) -> Measurement:
    """Estimate pulse parameters and first-echo range from a capture.

    PW, carrier/IF frequency, and PRI are estimated from the TX reference
    channel. Range uses the first detected RX echo relative to the first TX
    pulse, after subtracting a fixed system-delay calibration.
    """

    fs = capture.sample_rate_hz
    if not math.isfinite(fs) or fs <= 0:
        raise ValueError("capture sample rate must be finite and positive")
    if not math.isfinite(calibrated_system_delay_s) or calibrated_system_delay_s < 0:
        raise ValueError("calibrated_system_delay_s must be finite and non-negative")

    tx_regions = _pulse_regions(capture.tx_iq, threshold_fraction)
    rx_regions = _pulse_regions(capture.rx_iq, threshold_fraction)
    if len(tx_regions) < 2:
        raise ValueError("at least two TX pulses are required to estimate PRI")
    if not rx_regions:
        raise ValueError("no RX echo was detected")

    tx_starts = [start for start, _ in tx_regions]
    tx_width_ticks = sum(end - start for start, end in tx_regions) / len(tx_regions)
    pri_ticks = sum(b - a for a, b in zip(tx_starts, tx_starts[1:])) / (len(tx_starts) - 1)
    tx_start, tx_end = tx_regions[0]
    carrier_hz = _estimate_frequency_hz(capture.tx_iq, tx_start, tx_end, fs)

    raw_delay_s = (rx_regions[0][0] - tx_regions[0][0]) / fs
    echo_delay_s = raw_delay_s - calibrated_system_delay_s
    if echo_delay_s < 0:
        raise ValueError("calibrated system delay exceeds measured TX-to-echo delay")

    return Measurement(
        pulse_width_s=tx_width_ticks / fs,
        carrier_hz=carrier_hz,
        pri_s=pri_ticks / fs,
        echo_delay_s=echo_delay_s,
        range_m=SPEED_OF_LIGHT_M_PER_S * echo_delay_s / 2.0,
        tx_pulse_count=len(tx_regions),
        rx_echo_count=len(rx_regions),
    )
