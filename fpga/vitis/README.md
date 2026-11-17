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

Change the install paths to match the PC. Optional `-Xsa` and `-Workspace` arguments select a different XSA and workspace. The launcher sets the Vitis/Vivado and XSCT environment needed for SDT generation, then runs `create_vitis_workspace.py`.

The script builds `radar_platform` and `radar_ps_app`; success prints `VITIS_PLATFORM_PASS` and `VITIS_APP_PASS`. The ELF is under `<workspace>\radar_ps_app\build\radar_ps_app.elf`. The PowerShell command returns a non-zero exit code if a build step fails.

## Ethernet bring-up test

The test app uses board IP `192.168.1.10`, UDP port `5005`, and pulses user LED 0 while it serves packets. Connect the PC directly to the board and set the wired PC adapter to `192.168.1.20` with mask `255.255.255.0` (no gateway needed for a direct cable). Load the matching bitstream and the app ELF over JTAG, then run this from the project root:

```powershell
python -m radar_host.hardware_test --host 192.168.1.10
```

The Python script sends `HELLO`, then one generated 256-sample complex IQ tone packet. It checks the FPGA PS reply's sample count and peak component. This proves PC→Ethernet→PS→Ethernet→PC packet transport and basic IQ payload handling. It does **not** calculate a target range: the PL still has no ADC capture, IQ DSP, or echo detector, and the IQ packet currently terminates in PS memory.

The app ELF was built successfully with Vitis 2024.2 and lwIP. Physical Ethernet packet exchange with this new app remains to be checked when the wired PC connection is available. Use the USB UART at 115200 baud to confirm the app prints `UDP ready: 192.168.1.10:5005`.
