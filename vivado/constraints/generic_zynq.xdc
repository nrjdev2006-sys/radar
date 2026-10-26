# =============================================================================
# Generic Zynq-7000: no PL I/O is required for this design.
# Ethernet (PS ENET0) and UART (PS UART) use MIO — configure them in the PS.
#
# You MUST:
#   1. Enable ENET0 + MDIO and UART1 (or UART0) in the Zynq PS.
#   2. Apply a board preset, or enter the DDR part number for your SOM.
#   3. If your Ethernet PHY has a PL-side reset, add that pin here and
#      connect eth_rst_n from the block design (tied high by default).
# =============================================================================

# Example (replace PACKAGE_PIN with your board):
# set_property -dict {PACKAGE_PIN xx IOSTANDARD LVCMOS33} [get_ports eth_rst_n]
# set_property -dict {PACKAGE_PIN xx IOSTANDARD LVCMOS33} [get_ports {leds[0]}]
