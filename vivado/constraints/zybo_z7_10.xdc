# =============================================================================
# Zybo Z7-10 constraints for the radar PL extras (LEDs + Ethernet PHY reset).
#
# Ethernet RGMII, UART, DDR, QSPI, SD are all on the Zynq PS MIO and are
# configured in the Processing System — they do not appear here.
#
# Part: xc7z010clg400-1
# Board: Digilent Zybo Z7-10
# =============================================================================

# Ethernet PHY reset (RTL8211E). Must be held HIGH for the PHY to run.
# Schematic: ETH_RST_N on E17 (Bank 35).
set_property -dict {PACKAGE_PIN E17 IOSTANDARD LVCMOS33} [get_ports eth_rst_n]
set_property PULLUP true [get_ports eth_rst_n]

# Optional PHY interrupt (unused, but pin is present). Leave as input if exported.
# set_property -dict {PACKAGE_PIN F16 IOSTANDARD LVCMOS33} [get_ports eth_int_n]

# On-board LEDs LD0..LD3  (status: enable, peak_valid, in_pulse, heartbeat)
set_property -dict {PACKAGE_PIN M14 IOSTANDARD LVCMOS33} [get_ports {leds[0]}]
set_property -dict {PACKAGE_PIN M15 IOSTANDARD LVCMOS33} [get_ports {leds[1]}]
set_property -dict {PACKAGE_PIN G14 IOSTANDARD LVCMOS33} [get_ports {leds[2]}]
set_property -dict {PACKAGE_PIN D18 IOSTANDARD LVCMOS33} [get_ports {leds[3]}]

# If you add an ILA, keep the 100 MHz FCLK as the debug clock.
# create_debug_core ...
