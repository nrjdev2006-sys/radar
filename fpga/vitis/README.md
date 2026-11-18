# Vitis platform and PS application build

This script creates and builds a standalone Cortex-A9 platform and PS application from the checked-in Zybo Z7-10 XSA. The PS app brings up GEM0/lwIP with a static IP, runs the PL pulse output, and serves the project's `RDR1` UDP framing on port 5005.

## Requirements

- Vivado and Vitis Embedded Development 2024.2
- Zynq-7000 device support installed
- A Vitis/XSCT tool environment that can discover the Zynq processors in the XSA

## Run on Windows

From the project root, open PowerShell and run:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\fpga\vitis\build_vitis.ps1 `
  -Vitis 'C:\Xilinx\Vitis\2024.2\bin\vitis.bat' `
  -VivadoHome 'C:\Xilinx\Vivado\2024.2'
```

Change the install paths to match the PC. Optional `-Xsa` and `-Workspace` arguments select a different XSA and workspace. The script builds `radar_platform` and `radar_ps_app`; success prints `VITIS_PLATFORM_PASS` and `VITIS_APP_PASS`.

## Load and run over JTAG

After building `fpga/vitis/radar_ps_build/radar_ps_app.elf`, start Vivado Hardware Server and run `fpga/vitis/run_jtag_major.tcl` in XSCT. It resets the Cortex-A9 cores, runs the matching PS initialization, programs `radar_system_wrapper.bit`, loads the ELF, and starts the app.

## Ethernet bring-up test

The app uses board IP `192.168.1.10`, UDP port `5005`, and MAC `00-0a-35-7a-01-10`. LED0 (M14) is the TX gate pulse train. At 4 frames per second, LED1 (M15) blinks for every processed IQ frame; LEDs 1–3 blink together when the echo passes the absolute threshold and minimum-SNR checks. A noise-only frame blinks LED1 only. Each event LED pulses 100 ms on with a 100 ms off phase. For a direct PC-to-board cable, configure the wired PC adapter as `192.168.1.100/24` with no gateway required. If you add a static ARP entry, map `192.168.1.10` to MAC `00-0a-35-7a-01-10`. Then run:

```powershell
py -3.11 -m radar_host.hardware_test --host 192.168.1.10
```

A pass prints a HELLO response and an IQ detection response with sample count, peak component, echo sample, delay, and calculated range. The test sender creates a known synthetic TX-reference pulse and delayed echo in the IQ window; this checks Ethernet, PS threshold detection, range math, and the response path. The firmware expects IQ sample 0 to align with the PL transmit reference and currently uses a fixed 20 MHz sample rate (`RADAR_IQ_SAMPLE_RATE_HZ`). The response explicitly labels `hardware_capture:false`: the current PL design does not capture ADC/RF samples, so a range from this test is a digital loopback simulation, not a measured target. Replace the synthetic sender data with a properly aligned captured IQ buffer and set the firmware sample rate to match the actual ADC before interpreting a physical distance. If LED0 blinks but LED2 stays off during the sender run, pulse generation works but no UDP packet reached the application. LED2 indicates UDP reached the app; LED1 indicates a two-pulse IQ threshold detection and range calculation; LED3 indicates lwIP accepted the reply. A valid response in Python confirms the reply reached the PC.

The monitor sends repeated 256-sample IQ frames. Its threshold slider sets the FPGA's absolute amplitude threshold; minimum SNR adds a noise-relative floor. Echo disabled sends TX pulses plus configurable noise and should return `noise_only` unless the threshold is tuned too low. Pulse width, PRI, target echo delay, and echo amplitude shape the synthetic frame. FPGA replies report PW, PRI, PRF, duty cycle, delay, range, and noise/peak metrics. The dashboard launch command is below.

```powershell
py -3.11 -m radar_host.dashboard --host 192.168.1.10
```

Open `http://127.0.0.1:8765`, adjust the signal and detector controls, then press **Start**. A 20 MHz, 256-sample frame is sent every 250 ms (4 fps); press **Stop** to end the stream. The left side shows the IQ waveform and FFT spectrum. The right side shows settings, link counters, and FPGA output properties.

## Live signal and spectrum monitor

From the project root, run `py -3.11 -m radar_host.dashboard --host 192.168.1.10`, then open `http://127.0.0.1:8765`. The white page shows a live IQ waveform and spectrum on the left, signal parameters below the plots, and FPGA detections and ranges on the right. Start and Stop control the UDP IQ stream. The frames are synthetic because this design does not capture ADC/RF data.

## Latest hardware check

On 2026-11-17, the PC's stale static neighbor entry was corrected from the wrong `00-0a-35-00-01-02` address to firmware MAC `00-0a-35-7a-01-10`. The app was restarted over JTAG and negotiated at 1 Gbps. The normal host test then passed HELLO and a 256-sample IQ capture; the board returned `echo_sample=40`, `echo_delay_s=0.000002`, and `range_m=299.792`. UART confirmed UDP callback, IQ detection, and reply submission. PC wired-adapter RX counters increased during the reply. This validates synthetic IQ transport and range math end-to-end; it does not verify an ADC, RF echo, or physical target range.
