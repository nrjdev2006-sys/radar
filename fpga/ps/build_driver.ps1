param(
    [string]$CompilerPath = ""
)

$ErrorActionPreference = 'Stop'

$projectRoot = (Resolve-Path (Join-Path $PSScriptRoot '..\..')).Path

if (-not $CompilerPath) {
    $candidates = @(
        'C:\Xilinx\Vitis\2024.2\gnu\aarch32\nt\gcc-arm-none-eabi\bin\arm-none-eabi-gcc.exe',
        'D:\Vitis\2024.2\gnu\aarch32\nt\gcc-arm-none-eabi\bin\arm-none-eabi-gcc.exe',
        $(if ($env:XILINX_VITIS) { Join-Path $env:XILINX_VITIS 'gnu\aarch32\nt\gcc-arm-none-eabi\bin\arm-none-eabi-gcc.exe' }),
        'C:\Xilinx\SDK\2014.4\gnu\arm\nt\bin\arm-xilinx-eabi-gcc.exe'
    )
    foreach ($cand in $candidates) {
        if ($cand -and (Test-Path -LiteralPath $cand)) {
            $CompilerPath = $cand
            break
        }
    }
}

if (-not $CompilerPath -or -not (Test-Path -LiteralPath $CompilerPath)) {
    throw "ARM compiler not found. Pass -CompilerPath with path to arm-none-eabi-gcc.exe or arm-xilinx-eabi-gcc.exe"
}

Write-Host "Using ARM compiler: $CompilerPath"
$outputDir = Join-Path $projectRoot 'fpga\build\ps'
New-Item -ItemType Directory -Force -Path $outputDir | Out-Null

$commonArgs = @('-mcpu=cortex-a9', '-marm', '-std=c99', '-Wall', '-Wextra', '-Werror', "-I$PSScriptRoot")
& $CompilerPath @commonArgs -c (Join-Path $PSScriptRoot 'radar_driver.c') -o (Join-Path $outputDir 'radar_driver.o')
if ($LASTEXITCODE -ne 0) { throw "PS driver compile failed with exit code $LASTEXITCODE" }

# Provisional block design maps the peripheral at 0x43C00000; replace it with
# the generated Xparameters value if the board-specific map assigns another address.
& $CompilerPath @commonArgs '-DRADAR_BASEADDR=0x43C00000u' -c (Join-Path $PSScriptRoot 'radar_demo.c') -o (Join-Path $outputDir 'radar_demo.o')
if ($LASTEXITCODE -ne 0) { throw "PS demo compile failed with exit code $LASTEXITCODE" }

Write-Output "PS driver and demo compiled to: $outputDir"
