open_project radar_vivado.xpr
set_property platform.extensible false [current_project]
set_property platform.board_id provisional_zynq7020 [current_project]
set_property platform.name radar_platform [current_project]
set_property platform.vendor user.org [current_project]
set_property platform.version 1.0 [current_project]
set_property platform.default_output_type hw_export [current_project]
set_property platform.design_intent.embedded true [current_project]
set_property platform.design_intent.datacenter false [current_project]
set_property platform.design_intent.external_host false [current_project]
set_property platform.design_intent.server_managed false [current_project]
write_hw_platform -fixed -force -file radar_hardware.xsa
puts "FIXED_XSA_PASS"
close_project
exit
