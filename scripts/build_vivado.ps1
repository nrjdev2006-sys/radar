# Launch Vivado 2024.2 in batch and build the project (+ optional bitstream).
# Usage:
#   .\scripts\build_vivado.ps1
#   .\scripts\build_vivado.ps1 -Bitstream
#   .\scripts\build_vivado.ps1 -Board zybo-z7-20

param(
    [string]$Board = "zybo-z7-10",
    [int]$FftSize = 1024,
    [switch]$Bitstream
)

$ErrorActionPreference = "Stop"
$root = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)
$tcl  = Join-Path $root "vivado\create_project.tcl"
$vivado = Get-ChildItem "C:\Xilinx\Vivado\2024.2\bin\vivado.bat" -ErrorAction SilentlyContinue
if (-not $vivado) {
    $vivado = Get-Command vivado -ErrorAction SilentlyContinue
}
if (-not $vivado) {
    Write-Error "Vivado 2024.2 not found. Open the Vivado Tcl shell and: source vivado/create_project.tcl"
}

$bit = if ($Bitstream) { 1 } else { 0 }
$cmd = @"
set BOARD {$Board}
set FFT_SIZE $FftSize
set BUILD_BIT $bit
source {$tcl}
"@
$tmp = Join-Path $env:TEMP "radar_vivado_build.tcl"
Set-Content -Path $tmp -Value $cmd -Encoding ASCII
& $vivado.FullName -mode batch -source $tmp
