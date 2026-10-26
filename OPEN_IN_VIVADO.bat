@echo off
title Zynq Radar Vivado
setlocal
cd /d "%~dp0"

set VIVADO=D:\Vivado\2024.2\bin\vivado.bat
set XPR=%~dp0vivado\radar_vivado\radar_vivado.xpr
set TCL=%~dp0vivado\create_project_gui.tcl

if not exist "%VIVADO%" (
  echo Vivado not found: %VIVADO%
  pause
  exit /b 1
)

if exist "%XPR%" (
  echo Opening %XPR%
  call "%VIVADO%" "%XPR%"
  goto :eof
)

echo Creating the Vivado project first time. Wait for the GUI.
call "%VIVADO%" -mode gui -source "%TCL%"
pause
