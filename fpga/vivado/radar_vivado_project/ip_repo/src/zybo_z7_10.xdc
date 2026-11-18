## Zybo Z7-10 user LED 0 (Digilent board definition: M14, LVCMOS33)
set_property PACKAGE_PIN M14 [get_ports tx_gate]
set_property IOSTANDARD LVCMOS33 [get_ports tx_gate]

## Zybo Z7-10 user LED 1: IQ frame analyzed (Digilent pin M15)
set_property PACKAGE_PIN M15 [get_ports rx_packet_led]
set_property IOSTANDARD LVCMOS33 [get_ports result_led]

## Zybo Z7-10 user LED 2: valid signal detected (Digilent pin G14)
set_property PACKAGE_PIN G14 [get_ports result_led]
set_property IOSTANDARD LVCMOS33 [get_ports rx_packet_led]

## Zybo Z7-10 user LED 3: lwIP accepted reply submission (Digilent pin D18)
set_property PACKAGE_PIN D18 [get_ports reply_queued_led]
set_property IOSTANDARD LVCMOS33 [get_ports reply_queued_led]
