# Ethernet-Controlled FPGA Radar

Project plan for a PC-controlled radar prototype using an Ethernet-connected FPGA. The first implementation target is a pulsed, monostatic radar: the FPGA controls the transmit timing, captures the receive signal, estimates pulse parameters, and reports target range to the PC.

> **Hardware status:** target board is the Digilent Zybo Z7-10 (`xc7z010clg400-1`). The Vivado 2024.2 project applies the board preset, enables PS GEM0 over RGMII, and routes the PL pulse output to user LED 0. Synthesis, implementation, and bitstream generation pass. The bitstream has not yet been programmed to the board, and PS Ethernet/UDP firmware is not built; see `docs/checkpoint-log.md` for current Vitis status.

## Goal

Send radar configuration (and, if the selected hardware supports it, buffered waveform data) from a PC over Ethernet. Use the FPGA's programmable logic (PL) for deterministic signal timing and real-time processing, with the processing system (PS) handling Ethernet, configuration, and result reporting. Show detected range and measured pulse parameters on the PC.

## Proposed signal path

```text
PC control / display
       │ Ethernet (UDP control + result packets; optional sample stream)
       ▼
FPGA PS: Ethernet, packet validation, buffering, configuration, telemetry
       │ AXI stream / DMA
       ▼
FPGA PL: pulse timing, ADC capture, detection, PW / frequency / PRI, range
       │                         ▲
   DAC / RF TX ── antenna ── target ── antenna ── RF RX / ADC
```

Ethernet is the control and data link. It is packetized and can have variable latency, so it should not be used as the clock that defines transmit pulses. The PL and RF data converters provide the deterministic timing. For a first build, send waveform settings over Ethernet and generate the RF pulse in the FPGA; stream raw samples from the PC only if the required throughput and buffering have been confirmed.

## First range model

For a monostatic pulsed radar, measure the time between the transmit reference and the detected echo:

```text
range_m = speed_of_light_m_per_s * echo_delay_s / 2
```

The factor of two accounts for the signal travelling to the target and back. Pulse width (PW), carrier frequency, and pulse repetition interval (PRI) are useful radar parameters, but do not by themselves determine the target distance. For an unmodulated pulse, approximate range resolution is `c * PW / 2`; a pulse-compression waveform can improve resolution based on its bandwidth. The maximum unambiguous range is approximately `c * PRI / 2` for this simple pulsed design.

## Project documents

- [System architecture and design decisions](docs/architecture.md)
- [Build phases and acceptance criteria](docs/roadmap.md)
- [Ethernet and FPGA interface proposal](docs/interface.md)
- [Bring-up checkpoint log](docs/checkpoint-log.md)

## Current software scaffold

The project includes a hardware-independent signal reference model, UDP framing/client module, a PL pulse timing peripheral, and a provisional Zynq PS7+PL Vivado design. The PS driver and Vitis application source are present; Vitis 2024.2 currently rejects the XSA during platform import, so the Vitis platform/application build is not yet validated. See [FPGA project status](fpga/README.md) for exact open paths and checks.

Open the Vivado project:

```text
fpga/vivado/radar_vivado_project/radar_vivado.xpr
```

The hardware handoff is `fpga/vivado/radar_vivado_project/radar_hardware.xsa`. To regenerate the Vivado project with the installed Vivado 2024.2 tools, run:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\fpga\vivado\build_project.ps1
```

Run the synthetic 3 km echo example:

```powershell
python -m radar_host
```

Run the software checks:

```powershell
python -m unittest discover -s tests -v
```

The sample output is simulated IQ. It does not transmit RF or claim a real target range.

The FPGA timing core and its simulation are documented in [fpga/README.md](fpga/README.md). Run its current Vivado simulation with:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\fpga\sim\run_xsim.ps1
```

## First milestone

Before writing board-specific RTL or drivers, identify the FPGA board and confirm that it has (or can connect to) a suitable RF transmit/receive chain, ADC/DAC or RF transceiver, and antenna interface. Then validate the packet link and timing pipeline with a simulated or loopback echo before attempting over-the-air range measurements.
