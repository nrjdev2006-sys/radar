# =============================================================================
# Optional ZedBoard extras. Ethernet/UART/DDR are on the PS MIO.
# Uncomment LED pins if you retarget the project to a ZedBoard (xc7z020clg484-1).
# =============================================================================

# set_property -dict {PACKAGE_PIN T22 IOSTANDARD LVCMOS33} [get_ports {leds[0]}]
# set_property -dict {PACKAGE_PIN T21 IOSTANDARD LVCMOS33} [get_ports {leds[1]}]
# set_property -dict {PACKAGE_PIN U22 IOSTANDARD LVCMOS33} [get_ports {leds[2]}]
# set_property -dict {PACKAGE_PIN U21 IOSTANDARD LVCMOS33} [get_ports {leds[3]}]

# ZedBoard Ethernet PHY reset is typically handled by the PS / board preset.
# If the PHY stays in reset, export eth_rst_n and map it to the board's PHY reset pin.
