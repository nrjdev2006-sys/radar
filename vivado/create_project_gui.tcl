# Used by OPEN_IN_VIVADO.bat — creates the .xpr then leaves the GUI open.
set BOARD zybo-z7-10
set FFT_SIZE 1024
set BUILD_BIT 0
source [file join [file dirname [info script]] create_project.tcl]
