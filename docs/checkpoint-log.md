  # Bring-up checkpoint log
  
  Use this file to record what was checked, the result, and the evidence needed before moving to the next phase.
  
  ## Checkpoint 0 — PC and hardware discovery
  
  **Status:** blocked at physical Ethernet link; exact board and RF front end still need identification.
  
  **Checked:**
  
  - Windows detects a wired Intel Ethernet adapter.
  - Windows detects an FTDI USB interface with two USB serial converter interfaces. This may be a cable or board interface, but the device IDs alone do not identify the FPGA board.
  - The Intel Ethernet adapter reports `Disconnected` and `0 bps`, so it has no active physical link at this check.
  - A separate `Remote NDIS` network adapter is active; it is not the Intel wired Ethernet port.
  - No FPGA board appears in the current Ethernet neighbor table.
  - AMD/Xilinx Vivado is installed at `C:\Xilinx\Vivado\2014.4`; running its version command reports Vivado 2014.4. `xsct` was not found on the command path.
  - The FTDI interface does not appear as an identified FPGA board or serial COM port in the current device listing.
  
  **Needed to close this checkpoint:**
  
  1. FPGA board manufacturer and exact model/revision (from the board label or silkscreen).
  2. RF transceiver/ADC-DAC card model, if one is attached; otherwise state that no RF card is attached yet.
  3. Confirm the Ethernet cable is connected to the PC's Intel Ethernet port and the FPGA board, and check that both port link LEDs are on. If this FPGA connection is on a different adapter, provide that adapter name.
  4. Board Ethernet IP address, if already configured, and whether the PC is connected directly or through a shared network.
  
  **Next action:** once the physical link reports `Up`, record the board IP and use a targeted ping/service check. Then confirm the board/tool compatibility before attempting any PL programming. No board IP was guessed and no network-wide scan was run.
  
  ## Checkpoint 1 — Signal reference model and PC protocol
  
  **Status:** software-only checks pass; hardware integration is pending.
  
  **Implemented:**
  
  - A synthetic pulsed-IQ capture generator and reference analyzer for pulse width, signed complex-IQ frequency, PRI, echo delay, and calibrated monostatic range.
  - Version 1 UDP framing with type, sequence, payload length, and CRC-32; JSON helpers; normalized signed-int16 IQ encoding; and a synchronous request/reply client.
  - A local mock-FPGA request/reply test using UDP loopback.
  
  **Checked:** `python -m unittest discover -s tests -v` passes 14 tests. `python -m radar_host` reports a synthetic target at approximately 2997.925 m with 5 us PW, 2.5 MHz sampled-IQ frequency, and 100 us PRI. The range differs from exactly 3000 m because delay is rounded to the 20 MHz sample clock.
  
  **Limit:** this verifies the host-side math and packet code only. No FPGA packet server, RF samples, ADC/DAC, or over-the-air range has been tested. The framing and JSON fields must be implemented in the board firmware and may need adjustment for its software stack.
  
  **Next action:** restore the physical Ethernet link, identify the board and RF front end, and make a targeted HELLO/ACK exchange before sending configuration or sample data.
  
  ## Checkpoint 2 — FPGA PL pulse timing
  
  **Status:** board-independent timing RTL passes Vivado 2014.4 functional simulation.
  
  **Implemented:** `fpga/rtl/radar_pulse_timing.v` creates a local-clock transmit gate from PW/PRI tick settings. It latches valid settings at start, marks pulse edges, stops cleanly, and rejects zero PW or `PRI <= PW`.
  
  **Checked:** run `powershell -NoProfile -ExecutionPolicy Bypass -File .\fpga\sim\run_xsim.ps1`. Vivado 2014.4 `xvlog`, `xelab`, and `xsim` completed successfully; the testbench reported `PASS: pulse width, PRI, stop, and invalid-config checks`.
  
  **Limit:** this is RTL simulation only. No part number/constraints are known, no bitstream has been synthesized or programmed, and this block is not yet connected to PS registers, Ethernet, ADC/DAC, or an RF transceiver.
  
  **Next action:** after identifying the board, add a PS-to-PL control/status wrapper with safe clock-domain handling, then test a HELLO/ACK path and pulse timing on a board output pin.
  
  ## Checkpoint 3 — PS7 + PL control system
  
  **Status:** a provisional Zynq PS7 + PL design is generated and synthesized. The actual board configuration remains open.
  
  **Implemented:**
  
  - AXI4-Lite slave wrapper with registers at `0x00` (start/stop), `0x04` (PW ticks), `0x08` (PRI ticks), `0x0C` (busy/error/TX status), and `0x10` (pulse count).
  - Vivado IP Integrator design connects PS7 `M_AXI_GP0` through an AXI interconnect to the PL peripheral, enables a 100 MHz `FCLK_CLK0`, applies the reset path, assigns a 64 KiB register segment at `0x43C00000`, and exports `tx_gate`, DDR, and fixed I/O.
  - Bare-metal Cortex-A9 driver and an eight-pulse example application under `fpga/ps/`. The example base address in the compile script is the provisional generated address; regenerate `xparameters.h` and use the actual address when a board BSP is built.
  - Re-runnable simulation, PS compile, standalone PL synthesis, and full provisional PS7+PL synthesis scripts.
  
  **Checked:**
  
  - Vivado 2014.4 simulation passes both `tb_radar_pulse_timing` and `tb_radar_axi_pulse` with explicit PASS markers.
  - The Xilinx SDK 2014.4 ARM compiler builds the driver and demo with `-Wall -Wextra -Werror`.
  - Full PS7+PL synthesis completes for provisional part `xc7z020clg400-1`; utilization reports 860 LUTs and 973 flip-flops. Vivado reports zero synthesis errors and zero critical warnings. Noncritical warnings include unused ports from disabled PS7 functions and missing board-part definitions in the old tool install.
  - The AXI-only synthesis reports 306 LUTs and 310 flip-flops. The AXI response LSB is intentionally constant because supported responses are `OKAY (00)` and `SLVERR (10)`.
  - The generated BD, wrapper, system DCP, and utilization report are saved under `fpga/build/provisional_zynq7020_pspl/`.
  
  **Limit:** the exact FPGA model is unknown. The PS7 was configured without a board preset, so its DDR/MIO setup and all package constraints are provisional. No placement, routing, timing closure, board bitstream, PS runtime, RF card, ADC/DAC, or over-the-air output has been validated. Vivado notes its PS BFM requires a separate AXI BFM license, so PS7 traffic was not simulated; the PL AXI peripheral was checked independently with a bus master testbench.
  
  **Needed before programming hardware:** exact board and revision, FPGA part number, and RF/front-end model. Then apply the board PS preset, verify the actual AXI base address and fabric clock, constrain `tx_gate` to the correct interface, implement for that exact part, and run the eight-pulse PS demo on hardware. Ethernet integration follows after these checks.
  
  ## Checkpoint 4 — Vivado 2024.2 project and Vitis handoff
  
  **Status:** generated an openable Zybo Z7-10 Vivado 2024.2 project, routed bitstream, and fixed XSA. The Vitis 2024.2 platform/application build remains blocked during SDT generation.
  
  **Artifacts:** open `fpga/vivado/radar_vivado_project/radar_vivado.xpr`; the hardware handoff is `radar_hardware.xsa`. The PS application currently only exercises the AXI pulse driver.
  
  **Checked:** Vivado 2024.2 synthesis, implementation, routing, and bitstream generation pass with zero errors. The initial missing `tx_gate` pin constraint was fixed by mapping the output to Zybo user LED 0 (M14, LVCMOS33). GEM0 RGMII is enabled on MIO 16–27 with MDIO/MDC on MIO 52–53. The XSA includes the bitstream and the correct board/part. Vitis Unified reports `Unsupported Target 'HW' ... Supported Target's are '[]'` on the project path and `Error in generating SDT for given XSA` on a simple path; no Vitis platform or application build is claimed.
  
  **Limit:** the XSA/bitstream have not been programmed to the board. The PS app has no UDP service. The PL output on LED 0 only visualizes pulse timing; no RF transmit/receive, echo capture, or range measurement is implemented. Range requires measuring echo time-of-flight; PW, carrier frequency, and PRI alone do not determine distance.
  
  **Next action:** resolve the Vitis 2024.2 XSA/SDT import or install a supported Zynq-7000 standalone platform flow, build the PS application, program over JTAG, verify LED timing, then add and test the UDP service.
  ## Checkpoint 5 — Physical Ethernet link and endpoint discovery
  
  **Status:** PC Ethernet PHY link is up at 100 Mbps. No FPGA IP endpoint was found on the tested direct-link ranges.
  
  **Observed on the PC:** Intel I219-LM interface `Ethernet` has IPv4 `10.0.3.148/8` and `192.168.1.100/24`. The host had a stale neighbor entry for `10.0.7.100`; ping tests to `10.0.7.100`, `10.0.0.1`, and `192.168.1.1` returned no remote reply. ICMP sweeps of `10.0.0.0/24` through `10.0.3.0/24`, `10.0.7.0/24`, and `192.168.1.0/24` found no remote host (only the PC's own address replied locally).
  
  **Board-side items needed to continue:** confirm the FPGA board is powered and its Ethernet PHY/link LEDs are on; identify or set its IPv4 address and subnet; then provide the UDP service port. If DHCP is expected, check the router's lease list. The current PS demo only accesses the AXI pulse peripheral and does not run a UDP/Ethernet server, so there is no radar protocol service on the FPGA yet. The Vitis platform import issue recorded above also prevents building that PS application with the current Vitis 2024.2 setup.
  
  **Next action:** once a board IP is reachable, verify ARP/ping and an agreed UDP port before implementing the PS network service. Keep the Ethernet test separate from RF transmission; no RF hardware or radar echo was involved in this check.
  
  ## Checkpoint 6 — Ethernet root cause in the current design
  
  **Finding:** the generated PS7 hardware configuration has both Ethernet controllers disabled: `PCW_ENET0_PERIPHERAL_ENABLE=0`, `PCW_ENET1_PERIPHERAL_ENABLE=0`, and both EMIO Ethernet paths are off. The current PS application only accesses the AXI pulse registers; it has no Ethernet MAC setup, lwIP stack, or UDP listener. Therefore the current project cannot answer an Ethernet ping or the radar UDP protocol, even if the cable LEDs show link/activity.
  
  **What can be fixed in the project:** finish Vitis platform import, add the PS lwIP service, configure static IP/UDP settings, and rebuild/deploy the app. Zybo GEM wiring is now established by its installed board preset.
  
  **Configurations identified for validation:** Zybo Z7-10 PS GEM0 RGMII on MIO 16–27 and MDIO/MDC on MIO 52–53, from the installed Digilent board preset.
  
  **Current state:** PC Ethernet physical link is up, but the endpoint sweep found no remote host and the current design has no Ethernet endpoint. A passive 4-second read of the detected USB serial port `COM5` returned no console output. The blocker is the board-specific PS Ethernet wiring/IP configuration plus the not-yet-built PS network firmware, rather than the PC radar packet codec.
  
  ## Checkpoint 7 — Zybo Z7-10 Vivado implementation and Vitis blocker
  
  **Board confirmed:** Digilent Zybo Z7-10, part `xc7z010clg400-1`, board part `digilentinc.com:zybo-z7-10:part0:1.2`.
  
  **Vivado result:** board preset and GEM0 RGMII/MDIO route applied; `tx_gate` maps to user LED 0 at M14 (LVCMOS33); custom AXI IP register block metadata is read-write. Synthesis, place/route, and bitstream generation pass. The XSA includes `radar_hardware.bit`.
  
  **Vitis result:** Vitis Unified 2024.2 still fails while generating SDT from the XSA. XSCT can read the XSA, but the legacy platform flow cannot complete because the current Vitis installation lacks the classic IDE service and registered FSBL template. No PS executable, Ethernet ping, or UDP round trip has been validated.
  
  **Next step:** resolve/install a supported Zynq-7000 standalone platform toolchain, build the PS app, program over JTAG, verify LED pulse timing, then implement static-IP UDP receive/reporting. Actual range output requires an RF receive/echo-time measurement path; it cannot be computed from pulse settings alone.
  
  ## Checkpoint 8 — Manual SDT generation diagnosis
  
  **Path-space check:** copied the XSA to `C:\fpga_radar\radar_hardware_access.xsa`; the Vitis import error persisted, so the workspace path space is not sufficient to explain the failure.
  
  **Manual result:** XSCT's installed `sdtgen` succeeds with `sdtgen set_dt_param -xsa ... -dir ... -debug 1 -trace 1` followed by `sdtgen generate_sdt`. Output is in `C:\fpga_radar\sdt_manual`. Its `system-top.dts` identifies `zybo-z7-10` / `7z010`; `pcw.dtsi` includes GEM0, MDIO, and `phy-mode = "rgmii-id"`; the address map includes `radar_axi_pulse_0` at `0x40000000`.
  
  **Additional checks:** Vitis 2024.2 has no `data\boards\board_files` folder. Specifying the Vivado-installed `system-device-tree-xlnx` repo in Vitis advanced options did not fix XSA import. Re-exporting with board metadata cleared also did not fix it. A board-preset PS-only XSA and a no-Ethernet PS-only XSA fail similarly in Vitis, while Vitis can enumerate processors from its built-in ZC702 XSA. This isolates the problem to Vitis processing of custom XSA metadata/SDT import rather than the custom AXI peripheral or Ethernet enablement.
  
  **Current state:** manual SDT generation is verified; automatic Vitis platform creation is still blocked. No PS executable or UDP endpoint has been built.
  
  ## Checkpoint 9 — XSCT platform route attempts
  
  **Route 1 result:** XSCT 2024.2 rejects the suggested `platform create -sdt <directory>` option. Its supported `platform create` options include `-hw`, `-proc`, `-os`, and `-no-boot-bsp`, but not `-sdt`. The documented `sdtgen` output can be created independently, but cannot be passed through that unsupported option.
  
  **Route 2 result:** `platform create ... -no-boot-bsp` creates a partial XSCT workspace component and copies the XSA, generated `ps7_init.*`, and bitstream. The command then tries to start `vitis.bat -classic`; the installed Vitis Unified package exits with `-classic option is only supported by full Vitis installation`. Platform generation and the subsequent domain/app commands therefore do not run. The partial workspace is `C:\fpga_radar\vitis_workspace_route2`.
  
  **Log check:** the current Unified workspace logs under `C:\fpga_radar\ws_*\_ide\logs\vitis.log` contain workspace startup messages only, not a more detailed SDT exception. XSCT's `radar_platform\logs\platform.log` confirms the XSA was opened and identified as Zynq, then legacy workspace import hit the missing classic Vitis path.
  
  **Current state:** the supplied XSCT routes do not produce a buildable platform or application in this installation. Manual SDT generation remains successful; no UDP app is built.
  
  ## Checkpoint 10 — Check of proposed SDT-to-CMake route
  
  **Checked paths:** `D:\Vitis\2024.2\scripts\vitis\util\sdt2cmake.py` is absent. Recursive filename search under both Vitis 2024.2 and Vivado 2024.2 found no `sdt2cmake.py` or `arm-none-eabi-gcc.exe`. The suggested `D:\Vitis\2024.2\gnu\aarch32\nt\gcc-arm-none-eabi\bin` directory is absent.
  
  **Available:** CMake 3.24.2 exists at `D:\Vitis\2024.2\tps\win64\cmake-3.24.2\bin\cmake.exe`. Vitis ships `vitis-server\scripts\cmake\zynq_baremetal.toolchain`, which invokes `arm-none-eabi-gcc`, but that compiler is not installed or on PATH. A much older SDK 2014.4 `arm-xilinx-eabi-gcc` 4.8.3 executable exists; it is not the compiler named by the Vitis toolchain and was not substituted.
  
  **Result:** the posted `sdt2cmake.py` command cannot run as written, and the required compiler for the bundled Zynq CMake toolchain is missing. No CMake build was attempted with the incompatible 2014.4 compiler. Manual SDT output remains valid, but it does not itself generate a standalone BSP or lwIP libraries.
  
  ## Checkpoint 11 — Vitis interactive Python CLI route
  
  **Interactive shell check:** `vitis.bat -i` launches and accepts Python API calls. `client.create_platform_component(...)` using the space-free XSA still reports `Error in generating SDT for given XSA`, even with `generate_dtb=False`; therefore interactive mode uses the same failing platform creation path.
  
  **API corrections:** the installed API defines `domain.set_lib(lib_name=...)`, not `name=...`; the library exists in embeddedsw as lwip220. No `platform.configure()` method exists in the installed Python API; a successful `platform.build()` is the available build call. Platform creation failure prevents reaching domain/library configuration. Compiler availability is a later build prerequisite, not the cause of the earlier SDT-generation failure.
  
  **Current state:** no platform, BSP, or application was built through the interactive CLI. No UDP service or hardware Ethernet test has run.
  
  ## Checkpoint 12 — Clean workspace and environment recheck
  
  **Clean-path reproduction:** ran `vitis -s` with workspace `C:\vitis_ws_clean` and XSA `C:\fpga_radar\radar_hardware_access.xsa`. Processor discovery and platform creation still fail with `Error in generating SDT for given XSA`; Vitis leaves `C:\vitis_ws_clean\.rigel_lopper_temp_platform\radar_hardware_access\hw\sdt` empty. This rules out the project workspace's `New project` path containing spaces as the sole cause.
  
  **Version check:** the XSA was exported by Vivado 2024.2, and the installed Vivado is also 2024.2. The interactive Vitis Python shell uses Python 3.8.3 from the Vivado 2024.2 embedded runtime; system `python` is 3.11.4 but is not the Python executable Vitis uses for its CLI API.
  
  **Diagnostic output:** the full Vitis CLI output contains no lower-level SDT error line, only the generic SDT failure. Vitis logs show normal server/workspace startup; its temporary SDT directory is created but stays empty. The compiler is not invoked at this stage, so missing `arm-none-eabi-gcc` cannot explain the SDT-generation failure (it may block a later BSP build).
  
  **Isolation:** prior Vitis checks also failed on a minimal PS-only XSA and on a no-Ethernet PS-only XSA. Manual XSCT `sdtgen` succeeds on the same XSA. The `cout`/C++ example included in the user message is unrelated to this FPGA workflow.
  
  ## Checkpoint 13 — Vitis SDT path fix and platform-domain retry
  
  **Environment change:** launched the Vitis Python CLI with `D:\Vivado\2024.2\xsct-trim\bin` prepended to `PATH`, and set `XILINX_VITIS`, `XILINX_VIVADO`, and `VITIS_SDT_REPO` to the installed 2024.2 paths before `vitis.create_client()`. Processor discovery then succeeds and Vitis reports `SDT generated successfully`; the platform workspace now contains the full SDT output under `hw\sdt` instead of an empty temporary directory. This shows the earlier SDT failure was at least partly caused by the Vitis process environment and is now bypassed.
  
  **Platform creation retry:** called the documented Python API with the Cortex-A9 standalone domain specified, once with `no_boot_bsp=True` and once with the default boot-BSP behavior. Both runs stop after SDT generation with `Cannot create platform, status = StatusCode.UNKNOWN, details = ''`. The resulting platform metadata has no domains; `platform.build()` and lwIP configuration are consequently unreachable. Full logs are saved as `C:\fpga_radar\platform_domain_retry.log` and `C:\fpga_radar\platform_domain_retry2.log`.
  
  **Tool availability:** Vitis does include `lwip220_v1_0` and `lwip220_v1_1` sources, but the required `arm-none-eabi-gcc` binary remains absent. The platform failure is still before compilation, so installing that compiler alone would not explain or fix this particular error. The likely next action is to repair/modify the Vitis installation to include the full Zynq-7000 platform/standalone components and GNU ARM toolchain, then rerun the same script with the corrected XSCT PATH. No board programming, PS firmware, ping, or UDP test has occurred.
