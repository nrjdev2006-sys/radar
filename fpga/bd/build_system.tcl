if {$argc < 2} {
    error "Usage: build_system.tcl <zynq-part> <project-directory>"
}

set target_part [lindex $argv 0]
set project_dir [file normalize [lindex $argv 1]]
set rtl_dir [file join $project_dir src]
set ip_repo [file join $project_dir custom_ip]
file mkdir $project_dir

create_project -force radar_pspl $project_dir -part $target_part
set_property target_language Verilog [current_project]
add_files -norecurse [file join $rtl_dir radar_pulse_timing.v]
add_files -norecurse [file join $rtl_dir radar_axi_pulse.v]
set_property top radar_axi_pulse [get_filesets sources_1]
update_compile_order -fileset sources_1

# Package the AXI peripheral so Vivado 2014.4 IP Integrator can connect its bus.
ipx::package_project -root_dir $ip_repo -import_files -set_current true -force
set core [ipx::current_core]
set_property name radar_axi_pulse $core
set_property display_name {Radar AXI Pulse} $core
set_property vendor {user.org} $core
set_property library {user} $core
set_property taxonomy {/UserIP} $core
set_property version 1.0 $core
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
    CONFIG.PCW_FPGA0_PERIPHERAL_FREQMHZ {100.000000}] $ps

# Expose DDR and fixed I/O for a later board-specific pinout/configuration.
apply_bd_automation -rule xilinx.com:bd_rule:processing_system7 \
    -config {make_external "FIXED_IO, DDR" apply_board_preset "0" Master "Disable" Slave "Disable"} $ps

set pulse [create_bd_cell -type ip -vlnv user.org:user:radar_axi_pulse:1.0 radar_axi_pulse_0]
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

# Structural synthesis of the complete provisional PS/PL design. Board I/O,
# clock constraints, and timing closure remain a board-specific implementation step.
set_property top radar_system_wrapper [get_filesets sources_1]
launch_runs synth_1
wait_on_run synth_1
open_run synth_1
report_utilization -file [file join $project_dir system_utilization.rpt]
write_checkpoint -force [file join $project_dir radar_system_synth.dcp]

puts "PSPL_BD_PASS part=$target_part"
puts "PSPL_SYNTH_PASS part=$target_part"
close_project
