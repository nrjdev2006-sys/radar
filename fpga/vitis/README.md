# Vitis platform check

This check creates and builds a standalone Cortex-A9 platform from the checked-in Zybo Z7-10 XSA. It does not program the board or test Ethernet packets.

## Requirements

- Vivado and Vitis Embedded Development 2024.2
- Zynq-7000 device support installed
- A Vitis/XSCT tool environment that can discover the Zynq processors in the XSA

## Run on Windows

From the project root, open PowerShell and run:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\fpga\vitis\run_platform_check.ps1 `
  -VitisHome 'D:\Vitis\2024.2' `
  -VivadoHome 'D:\Vivado\2024.2'
```

Change the two install paths to match the PC. The launcher stages the XSA and diagnostic script under `C:\radar_vitis_diag` so Vitis does not have to parse a script or XSA path containing spaces. Each run gets a fresh workspace under `C:\radar_vitis_platform_check_<timestamp>` and a console log in the staging directory.

The check prints processor discovery, whether the expected ARM GCC compiler is present, then tries platform creation, domain/library discovery, and the platform build. `PLATFORM_CHECK_PASSED` means those steps completed. If it fails, the PowerShell command returns a non-zero exit code; share the `platform_check_<timestamp>.log` file for diagnosis.

## Current result on the original PC

Processor discovery and SDT generation pass. Platform creation still stops with `StatusCode.UNKNOWN` and empty details. The expected `arm-none-eabi-gcc.exe` was not found under either the Vitis or Vivado 2024.2 install directories. The current failure happens before BSP compilation, so the missing compiler is an additional later blocker, not the cause of this platform-creation error.
