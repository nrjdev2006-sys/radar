if {$argc < 3} {
    error "Usage: build_project.tcl <zynq-part> <project-directory> <project-root>"
}

set target_part [lindex $argv 0]
set project_dir [lindex $argv 1]
set project_root [lindex $argv 2]
set rtl_dir [file join $project_root fpga rtl]
set xdc_file [file join $project_root fpga vivado zybo_z7_10.xdc]
set ip_repo [file join $project_dir ip_repo]
file mkdir $project_dir

create_project -force radar_vivado $project_dir -part $target_part
set_property target_language Verilog [current_project]
# Apply the official Digilent Zybo Z7-10 board definition and PS preset.
set zybo_board [get_board_parts -quiet digilentinc.com:zybo-z7-10:part0:1.2]
if {[llength $zybo_board] != 1} {
    error "Digilent Zybo Z7-10 board definition is not installed in Vivado"
}
if {$target_part ne "xc7z010clg400-1"} {
    error "Zybo Z7-10 requires xc7z010clg400-1, got $target_part"
}
set_property board_part [lindex $zybo_board 0] [current_project]
set_property platform.extensible false [current_project]
set_property platform.board_id zybo_z7_10 [current_project]
set_property platform.name radar_platform [current_project]
set_property platform.vendor user.org [current_project]
set_property platform.version 1.0 [current_project]
set_property platform.default_output_type hw_export [current_project]
set_property platform.design_intent.embedded true [current_project]
set_property platform.design_intent.datacenter false [current_project]
set_property platform.design_intent.external_host false [current_project]
set_property platform.design_intent.server_managed false [current_project]
add_files -norecurse [file join $rtl_dir radar_pulse_timing.v]
add_files -norecurse [file join $rtl_dir radar_axi_pulse.v]
add_files -fileset constrs_1 -norecurse $xdc_file
set_property top radar_axi_pulse [get_filesets sources_1]
update_compile_order -fileset sources_1

ipx::package_project -root_dir $ip_repo -import_files -set_current true -force
set core [ipx::current_core]
set_property name radar_axi_pulse $core
set_property display_name {Radar AXI Pulse} $core
set_property vendor {user.org} $core
set_property library {user} $core
set_property taxonomy {/UserIP} $core
set_property version 1.0 $core
set radar_mem_map [ipx::get_memory_maps S_AXI -of_objects $core]
set radar_reg_block [ipx::get_address_blocks reg0 -of_objects $radar_mem_map]
if {[llength $radar_reg_block] != 1} {
    error "Radar AXI IP register block reg0 is missing from its packaged memory map"
}
set_property access read-write $radar_reg_block
ipx::save_core $core
ipx::unload_core $core
set_property ip_repo_paths [list $ip_repo] [current_project]
update_ip_catalog -rebuild

create_bd_design radar_system
set ps_defs [get_ipdefs -all -filter {NAME == processing_system7}]
if {[llength $ps_defs] == 0} {
    error "Processing System 7 IP is not installed in this Vivado catalog"
}
set ps_vlnv [get_property VLNV [lindex $ps_defs end]]
set ps [create_bd_cell -type ip -vlnv $ps_vlnv processing_system7_0]
set_property -dict [list \
    CONFIG.PCW_USE_M_AXI_GP0 {1} \
    CONFIG.PCW_EN_CLK0_PORT {1} \
    CONFIG.PCW_FPGA0_PERIPHERAL_FREQMHZ {100.000000} \
    CONFIG.PCW_ENET0_PERIPHERAL_ENABLE {1} \
    CONFIG.PCW_ENET0_ENET0_IO {MIO 16 .. 27} \
    CONFIG.PCW_ENET0_GRP_MDIO_ENABLE {1} \
    CONFIG.PCW_ENET0_GRP_MDIO_IO {MIO 52 .. 53}] $ps
apply_bd_automation -rule xilinx.com:bd_rule:processing_system7 \
    -config {make_external "FIXED_IO, DDR" apply_board_preset "1" Master "Disable" Slave "Disable"} $ps

create_bd_cell -type ip -vlnv user.org:user:radar_axi_pulse:1.0 radar_axi_pulse_0
set tx_gate_port [create_bd_port -dir O tx_gate]
connect_bd_net [get_bd_pins radar_axi_pulse_0/tx_gate] $tx_gate_port
apply_bd_automation -rule xilinx.com:bd_rule:axi4 \
    -config [list Master "/processing_system7_0/M_AXI_GP0" Clk "Auto"] \
    [get_bd_intf_pins radar_axi_pulse_0/S_AXI]
assign_bd_address
validate_bd_design
save_bd_design

set bd_file [get_files radar_system.bd]
generate_target all $bd_file
set wrapper [make_wrapper -files $bd_file -top]
add_files -norecurse $wrapper
update_compile_order -fileset sources_1
set_property top radar_system_wrapper [get_filesets sources_1]
launch_runs synth_1 -jobs 1
wait_on_run synth_1
open_run synth_1
report_utilization -file [file join $project_dir system_utilization.rpt]
write_checkpoint -force [file join $project_dir radar_system_synth.dcp]

# Produce a board-programmable bitstream and include it in the Vitis handoff.
launch_runs impl_1 -to_step write_bitstream -jobs 1
wait_on_run impl_1

# Export the Zybo Z7-10 embedded-design XSA for Vitis.
write_hw_platform -fixed -include_bit -force -file [file join $project_dir radar_hardware.xsa]
puts "VIVADO_PROJECT_PASS part=$target_part"
puts "XSA_PASS [file join $project_dir radar_hardware.xsa]"
close_project

