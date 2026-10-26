# =============================================================================
# create_project.tcl
#
# Builds the Vivado project, block design, wrapper, and (optionally) bitstream.
#
# Usage, from Vivado TCL console or:
#   vivado -mode batch -source vivado/create_project.tcl
#
# Optional arguments (set before sourcing, or via -tclargs):
#   FFT_SIZE     default 1024
#   BOARD        zybo-z7-10 | zybo-z7-20 | zedboard | generic
#   BUILD_BIT    1 to run synth+impl+bitstream (slow)
# =============================================================================

set script_dir [file dirname [file normalize [info script]]]
set root_dir   [file normalize [file join $script_dir ..]]

if {![info exists FFT_SIZE]}  { set FFT_SIZE  1024 }
if {![info exists BOARD]}     { set BOARD     "zybo-z7-10" }
if {![info exists BUILD_BIT]} { set BUILD_BIT 0 }

puts "============================================================"
puts " Zynq Radar Signal Processor — Vivado project"
puts "   ROOT     : $root_dir"
puts "   BOARD    : $BOARD"
puts "   FFT_SIZE : $FFT_SIZE"
puts "============================================================"

# ---- Part / board -----------------------------------------------------------
set part       "xc7z010clg400-1"
set boardpart  ""
set xdc_file   [file join $script_dir constraints zybo_z7_10.xdc]

switch -nocase $BOARD {
    "zybo-z7-10" {
        set part "xc7z010clg400-1"
        set xdc_file [file join $script_dir constraints zybo_z7_10.xdc]
        foreach cand {
            "digilentinc.com:zybo-z7-10:part0:1.2"
            "digilentinc.com:zybo-z7-10:part0:1.1"
            "digilentinc.com:zybo-z7-10:part0:1.0"
        } {
            if {[llength [get_board_parts -quiet $cand]]} {
                set boardpart $cand
                break
            }
        }
    }
    "zybo-z7-20" {
        set part "xc7z020clg400-1"
        set xdc_file [file join $script_dir constraints zybo_z7_10.xdc]
        foreach cand {
            "digilentinc.com:zybo-z7-20:part0:1.2"
            "digilentinc.com:zybo-z7-20:part0:1.1"
            "digilentinc.com:zybo-z7-20:part0:1.0"
        } {
            if {[llength [get_board_parts -quiet $cand]]} {
                set boardpart $cand
                break
            }
        }
    }
    "zedboard" {
        set part "xc7z020clg484-1"
        set xdc_file [file join $script_dir constraints zedboard.xdc]
        foreach cand {
            "em.avnet.com:zed:part0:1.4"
            "em.avnet.com:zed:part0:1.3"
        } {
            if {[llength [get_board_parts -quiet $cand]]} {
                set boardpart $cand
                break
            }
        }
    }
    default {
        set part "xc7z010clg400-1"
        set xdc_file [file join $script_dir constraints generic_zynq.xdc]
    }
}

set proj_dir  [file join $root_dir vivado radar_vivado]
set proj_name "radar_vivado"

if {[file exists $proj_dir]} {
    puts "NOTE: Removing previous project at $proj_dir"
    file delete -force $proj_dir
}

create_project $proj_name $proj_dir -part $part -force
if {$boardpart ne ""} {
    set_property board_part $boardpart [current_project]
    puts "Using board_part $boardpart"
} else {
    puts "WARNING: Board files not found. Using part $part only."
    puts "         Install Digilent/Avnet board files, then re-run."
    puts "         Enable ENET0 + UART1 in the PS if Ethernet/UART fail."
}

set_property target_language Verilog [current_project]

# ---- HDL --------------------------------------------------------------------
set rom_v [file join $root_dir hdl hann_rom.v]
if {![file exists $rom_v]} {
    error "Missing $rom_v — run: python pc/generate_hann_rom.py"
}

set hdl_files [list \
    [file join $root_dir hdl radar_core.v] \
    [file join $root_dir hdl axis_window.v] \
    [file join $root_dir hdl axis_peak_detect.v] \
    [file join $root_dir hdl axis_pulse_detect.v] \
    [file join $root_dir hdl fft_config_master.v] \
    $rom_v \
]
add_files -norecurse $hdl_files

add_files -fileset constrs_1 -norecurse $xdc_file

# ---- Block design -----------------------------------------------------------
source [file join $script_dir create_bd.tcl]
create_radar_bd $FFT_SIZE $BOARD

# Wrapper
make_wrapper -files [get_files radar_system.bd] -top
add_files -norecurse [file join $proj_dir radar_vivado.gen sources_1 bd radar_system hdl radar_system_wrapper.v]
# Older Vivado drops the wrapper next to the BD:
set wrap_alt [file join $proj_dir radar_vivado.srcs sources_1 bd radar_system hdl radar_system_wrapper.v]
if {[file exists $wrap_alt]} {
    add_files -norecurse $wrap_alt
}
set_property top radar_system_wrapper [current_fileset]
update_compile_order -fileset sources_1

validate_bd_design
save_bd_design

puts "Project created. Open: $proj_dir/$proj_name.xpr"

if {$BUILD_BIT} {
    puts "Launching synth + impl + bitstream (this takes a while)..."
    launch_runs impl_1 -to_step write_bitstream -jobs 4
    wait_on_run impl_1
    set bit [glob -nocomplain [file join $proj_dir radar_vivado.runs impl_1 *.bit]]
    puts "Bitstream: $bit"
    # Export hardware with bitstream for Vitis
    set xsa [file join $root_dir vivado radar_system_wrapper.xsa]
    write_hw_platform -fixed -include_bit -force -file $xsa
    puts "XSA: $xsa"
} else {
    puts "Skipping bitstream. In Vivado: Generate Bitstream, then"
    puts "  File > Export > Export Hardware (include bitstream) to"
    puts "  $root_dir/vivado/radar_system_wrapper.xsa"
}

puts "DONE."
