if {$argc < 2} {
    error "Usage: synth.tcl <part> <output-directory>"
}

set target_part [lindex $argv 0]
set output_dir [file normalize [lindex $argv 1]]
set rtl_dir [file join $output_dir src]
file mkdir $output_dir

puts "Synthesizing radar_axi_pulse for provisional target $target_part"
read_verilog [file join $rtl_dir radar_pulse_timing.v]
read_verilog [file join $rtl_dir radar_axi_pulse.v]
# AXI is an internal block-design connection in the finished system, so don't
# count its top-level ports as package I/O buffers in this isolated check.
synth_design -top radar_axi_pulse -part $target_part -no_iobuf
report_utilization -file [file join $output_dir utilization.rpt]
write_checkpoint -force [file join $output_dir radar_axi_pulse_synth.dcp]
puts "SYNTHESIS_PASS part=$target_part"
