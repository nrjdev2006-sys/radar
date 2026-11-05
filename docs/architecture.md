# System architecture

## Assumptions for the first prototype

- A radar echo is received by the same radar system that transmitted the signal (monostatic setup).
- The PC configures and observes the instrument; it is not responsible for cycle-accurate RF timing.
- The FPGA has a PS/PL split (for example, a Zynq-style device), Ethernet access through the PS or a supported PL MAC, and a way to connect to RF data converters.
- Initial waveform: a short pulsed carrier. The design may move to FMCW or pulse compression after the basic transmit/receive and range path works.

These are working assumptions, not claims about the currently connected board. The board model and RF daughtercard determine what can actually be implemented.

## Functional blocks

### PC application

- Configure carrier/LO frequency, pulse width, PRI, transmit count, receive window, and capture settings within hardware limits.
- Send commands and optional waveform buffers over Ethernet.
- Receive detections and status, display PW, frequency, PRI, echo delay, and range.
- Save captures and configuration for repeatable experiments.

### Processing system (PS)

- Own the Ethernet endpoint and parse/validate packets.
- Reject unsupported parameter values and report clear error/status codes.
- Move sample buffers between Ethernet and PL using DMA or the board's supported data path.
- Configure PL registers and RF front-end controls; return detections and health telemetry.
- Buffer incoming work so packet arrival jitter does not perturb pulse timing.

### Programmable logic (PL)

- Produce pulse/trigger timing from a stable hardware clock.
- Control transmit/receive gates and coordinate ADC/DAC or RF-transceiver interfaces.
- Capture receive samples with a known relation to the transmit trigger.
- Detect echoes (initially threshold plus constant-false-alarm-rate or matched filtering, as supported by signal quality).
- Estimate echo delay and calculate range.
- Estimate PW, PRI, and carrier/instantaneous frequency from captured pulses. Frequency measurement requires an appropriate sampled RF/IF/IQ signal and adequate sample rate; a control setting alone is not a measurement of the received echo frequency.
- Attach timestamps and quality indicators to each detection.

### RF path

The FPGA's digital interface is not itself an antenna or RF transmitter/receiver. The system needs a compatible DAC/transceiver for transmit, an ADC/transceiver for receive, frequency conversion and filtering as required, suitable antennas, and a safe transmit setup. Many FPGA boards have no radar-capable RF path without an add-on card.

## Measurements and calculations

For pulsed monostatic ranging, let `t_tx` be the PL transmit reference and `t_echo` the detected return time. Then `delay = t_echo - t_tx`, and `range = c * delay / 2`. Calibrate fixed TX/RX, cable, and processing delays using a known loopback or reference target.

| Quantity | Meaning | How to obtain it |
|---|---|---|
| PW | Received pulse duration | Count samples above a qualified pulse-detection threshold, then convert using the sample clock |
| Carrier / IF frequency | Frequency of the sampled received signal | Estimate phase change or spectral peak on ADC/IF/IQ samples; report which frequency domain is being measured |
| PRI | Time between successive pulse references | Difference PL timestamps for successive detected pulses |
| Echo delay | Round-trip propagation time | Difference between transmit reference and detected echo timestamp, with calibrated system delay removed |
| Distance | Target range | `c * echo_delay / 2` |

Use integer clock counts internally where possible. Convert to SI units at the host/API boundary. Include overflow, saturation, and invalid-detection flags rather than silently reporting fabricated values.

## Key design decisions still open

1. Exact FPGA board and PS/PL architecture.
2. RF transceiver or ADC/DAC card, RF frequency band, sample rate, and available clocking.
3. Pulsed radar versus FMCW. Pulsed is the proposed learning path because PW/PRI and echo timing map directly to the requested measurements. FMCW is a viable alternative if the available RF hardware is better suited to chirps; range is then computed from beat frequency and chirp slope.
4. UDP control/result packets versus a higher-throughput sample transport. UDP is a practical first control protocol; it needs sequence numbers and explicit loss handling.
5. Range, resolution, update-rate, and target environment requirements.

## Engineering constraints

- Maximum unambiguous pulsed range is approximately `c * PRI / 2`; longer PRI increases this range but reduces pulse update rate.
- Unmodulated pulse range resolution is approximately `c * PW / 2`. Better resolution generally requires wider effective waveform bandwidth and corresponding RF/sample-rate support.
- Ethernet transport must be sized for the chosen sample format and rate. Do not assume a PC can sustain lossless raw-IQ streaming just because the link is labelled Gigabit Ethernet; account for packet, OS, DMA, and memory overhead.
- TX leakage, receiver recovery time, antenna isolation, ADC dynamic range, clock accuracy, and cable/RF delays affect detection and range quality.
- Start with conducted loopback or a controlled, legal low-power setup. Select a permitted frequency and transmit power before over-the-air tests.
