set script_dir [file dirname [file normalize [info script]]]
set repo_root [file normalize [file join $script_dir .. ..]]
set project [file join $repo_root fpga vivado radar_vivado_project]
set ps_init [file join $project ps7_init.tcl]
set bitfile [file join $project radar_system_wrapper.bit]
set app_elf [file join $script_dir radar_ps_build radar_ps_app.elf]

if {![file exists $ps_init] || ![file exists $bitfile] || ![file exists $app_elf]} {
    error "Missing JTAG input: expected ps7_init.tcl, radar_system_wrapper.bit, and radar_ps_app.elf"
}

connect -url tcp:localhost:3121
targets -set -filter {name =~ "ARM Cortex-A9 MPCore #0"}
rst -cores
targets -set -filter {name =~ "APU"}
proc mask_delay {addr val} { after $val }
source $ps_init
ps7_init
ps7_post_config
fpga -file $bitfile
targets -set -filter {name =~ "ARM Cortex-A9 MPCore #0"}
dow $app_elf
con
puts "MAJOR_BRANCH_RADAR_APP_RUNNING"
