# Build roadmap

Each phase should produce a result that can be checked before adding the next layer.

## Phase 0 — Confirm the hardware and requirements

- Record the FPGA board part number, toolchain/version, PS/PL details, Ethernet path, and available memory.
- Identify the RF transceiver or ADC/DAC hardware, frequency coverage, sample rates, clock sources, and antenna connectors.
- Set target range, desired range resolution, update rate, and permitted operating band/power.
- Choose pulsed radar or FMCW based on the RF hardware. Keep pulsed radar as the default while these details are unknown.

**Exit check:** a signal-chain diagram names every interface from PC Ethernet through the RF receive path, and the desired range/resolution is feasible against the board's sample rate and waveform bandwidth.

## Phase 1 — PC/FPGA Ethernet control link

- Implement a small command/status protocol with version, sequence number, payload length, and checksum or equivalent integrity check.
- Send a configuration command from the PC and return an acknowledged configuration/status packet from the FPGA PS.
- Test malformed packets, unsupported settings, and dropped/reordered packets.

**Exit check:** repeatable configuration and status exchange without requiring any RF hardware.

## Phase 2 — Deterministic PL timing

- Implement a hardware-clocked pulse trigger and timestamp counter.
- Configure PW and PRI through PS-to-PL registers.
- Verify timing at a test pin or logic analyzer; Ethernet packet arrival must not change pulse timing.

**Exit check:** measured trigger period and width match configuration within the clock-count quantization.

## Phase 3 — Receive capture and loopback

- Connect a safe conducted loopback or digital test source; initially use a known delayed echo.
- Capture ADC/IF/IQ samples into a bounded buffer and transfer them to PS/PC.
- Measure fixed system delay and validate timestamp/sample alignment.

**Exit check:** known injected delays produce the expected echo sample index and repeatable corrected delay.

## Phase 4 — Detection and parameter estimates

- Add pulse detection and estimate PW, carrier/IF frequency, and PRI from captured samples/timestamps.
- Add echo delay and range calculation, including calibration offset and detection confidence.
- Compare PL results with an offline PC reference calculation on saved captures.

**Exit check:** estimates remain within agreed error bounds on repeatable loopback captures.

## Phase 5 — RF integration and controlled ranging

- Bring up the transceiver, LO, TX/RX gains, filters, and antenna path using board-specific vendor examples.
- Validate TX output and RX sensitivity using appropriate test equipment before range experiments.
- Conduct low-power, permitted over-the-air tests in a controlled environment and record all settings.

**Exit check:** known target distances give repeatable range estimates over the specified operating region.

## Phase 6 — Operator experience and robustness

- Add a simple PC dashboard for configuration, status, PW/frequency/PRI, range, and capture saving.
- Add packet-loss counters, buffer-overrun indicators, timestamps, and clear fault reporting.
- Document setup, calibration, limitations, and reproduction steps.

**Exit check:** another operator can configure the system, run a measurement, and interpret the result from the project documentation.

## First implementation order

1. Confirm the board and RF front end.
2. Make Ethernet command/acknowledgement work.
3. Make PL timing measurable at a pin.
4. Inject a known delayed echo and validate range math.
5. Connect the RF chain and only then run controlled radar measurements.
