import unittest

from radar_host import PulseConfig, analyze_capture, simulate_capture
from radar_host.model import SPEED_OF_LIGHT_M_PER_S


class PulseConfigTests(unittest.TestCase):
    def test_rejects_frequency_at_or_above_nyquist(self):
        with self.assertRaisesRegex(ValueError, "Nyquist"):
            PulseConfig(20e6, 10e6, 5e-6, 100e-6)

    def test_rejects_pulse_width_not_shorter_than_pri(self):
        with self.assertRaisesRegex(ValueError, "shorter than PRI"):
            PulseConfig(20e6, 2.5e6, 100e-6, 100e-6)


class CaptureAnalysisTests(unittest.TestCase):
    def setUp(self):
        self.config = PulseConfig(
            sample_rate_hz=20e6,
            carrier_hz=2.5e6,
            pulse_width_s=5e-6,
            pri_s=100e-6,
            pulse_count=3,
        )
        self.target_range_m = 3000.0
        self.capture = simulate_capture(self.config, self.target_range_m)
        self.measurement = analyze_capture(self.capture)

    def test_estimates_pw_frequency_and_pri(self):
        self.assertAlmostEqual(self.measurement.pulse_width_s, 5e-6, places=12)
        self.assertAlmostEqual(self.measurement.carrier_hz, 2.5e6, places=6)
        self.assertAlmostEqual(self.measurement.pri_s, 100e-6, places=12)
        self.assertEqual(self.measurement.tx_pulse_count, 3)

    def test_range_matches_sample_quantized_echo_delay(self):
        delay_ticks = round(2 * self.target_range_m / SPEED_OF_LIGHT_M_PER_S * 20e6)
        expected_range_m = SPEED_OF_LIGHT_M_PER_S * (delay_ticks / 20e6) / 2
        self.assertAlmostEqual(self.measurement.range_m, expected_range_m, places=9)
        self.assertLess(abs(self.measurement.range_m - self.target_range_m), 8.0)

    def test_applies_system_delay_calibration(self):
        corrected = analyze_capture(
            self.capture,
            calibrated_system_delay_s=2 / self.config.sample_rate_hz,
        )
        expected_shift_m = SPEED_OF_LIGHT_M_PER_S / self.config.sample_rate_hz
        self.assertAlmostEqual(
            self.measurement.range_m - corrected.range_m,
            expected_shift_m,
            places=9,
        )

    def test_rejects_missing_echo(self):
        from radar_host import Capture

        no_echo = Capture(self.capture.sample_rate_hz, self.capture.tx_iq, (0j,) * len(self.capture.rx_iq))
        with self.assertRaisesRegex(ValueError, "no RX echo"):
            analyze_capture(no_echo)

    def test_rejects_calibration_longer_than_measured_delay(self):
        with self.assertRaisesRegex(ValueError, "exceeds measured"):
            analyze_capture(self.capture, calibrated_system_delay_s=1.0)


if __name__ == "__main__":
    unittest.main()
