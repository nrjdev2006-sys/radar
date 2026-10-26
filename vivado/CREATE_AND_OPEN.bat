@echo off
title Create radar Vivado project
cd /d "%~dp0"

set VIVADO=D:\Vivado\2024.2\bin\vivado.bat
set XPR=%~dp0radar_vivado\radar_vivado.xpr
set TCL=%~dp0create_project_gui.tcl

if not exist "%VIVADO%" (
  echo Vivado not found: %VIVADO%
  pause
  exit /b 1
)

if exist "%XPR%" (
  echo Opening existing project
  call "%VIVADO%" "%XPR%"
  goto :eof
)

echo Creating project from Tcl. Keep this window open.
call "%VIVADO%" -mode gui -source "%TCL%"
pause
