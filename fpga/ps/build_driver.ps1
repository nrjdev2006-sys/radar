$ErrorActionPreference = 'Stop'

$projectRoot = (Resolve-Path (Join-Path $PSScriptRoot '..\..')).Path
$compiler = 'C:\Xilinx\SDK\2014.4\gnu\arm\nt\bin\arm-xilinx-eabi-gcc.exe'
$outputDir = Join-Path $projectRoot 'fpga\build\ps'

if (-not (Test-Path -LiteralPath $compiler)) {
    throw "Xilinx ARM compiler not found: $compiler"
}
New-Item -ItemType Directory -Force -Path $outputDir | Out-Null

$commonArgs = @('-mcpu=cortex-a9', '-marm', '-std=c99', '-Wall', '-Wextra', '-Werror', "-I$PSScriptRoot")
& $compiler @commonArgs -c (Join-Path $PSScriptRoot 'radar_driver.c') -o (Join-Path $outputDir 'radar_driver.o')
if ($LASTEXITCODE -ne 0) { throw "PS driver compile failed with exit code $LASTEXITCODE" }

# Provisional block design maps the peripheral at 0x43C00000; replace it with
# the generated Xparameters value if the board-specific map assigns another address.
& $compiler @commonArgs '-DRADAR_BASEADDR=0x43C00000u' -c (Join-Path $PSScriptRoot 'radar_demo.c') -o (Join-Path $outputDir 'radar_demo.o')
if ($LASTEXITCODE -ne 0) { throw "PS demo compile failed with exit code $LASTEXITCODE" }

Write-Output "PS driver and demo compiled to: $outputDir"
