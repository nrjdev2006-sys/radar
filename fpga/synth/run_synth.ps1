param(
    [string]$Part = 'xc7z020clg400-1',
    [string]$VivadoBin = "",
    [string]$VivadoHome = ""
)

$ErrorActionPreference = 'Stop'
$projectRoot = (Resolve-Path (Join-Path $PSScriptRoot '..\..')).Path

if (-not $VivadoBin -and $VivadoHome) {
    $VivadoBin = Join-Path $VivadoHome 'bin'
}

if (-not $VivadoBin) {
    $candidates = @(
        $(if ($env:XILINX_VIVADO) { Join-Path $env:XILINX_VIVADO 'bin' }),
        'C:\Xilinx\Vivado\2024.2\bin',
        'D:\Vivado\2024.2\bin',
        'C:\Xilinx\Vivado\2014.4\bin'
    )
    foreach ($cand in $candidates) {
        if ($cand -and (Test-Path -LiteralPath (Join-Path $cand 'vivado.bat'))) {
            $VivadoBin = $cand
            break
        }
    }
}

if (-not $VivadoBin -or -not (Test-Path -LiteralPath $VivadoBin)) {
    throw "Vivado not found. Pass -VivadoBin or -VivadoHome."
}

$vivado = Join-Path $VivadoBin 'vivado.bat'
$tcl = Join-Path $PSScriptRoot 'synth.tcl'
$outputDir = Join-Path $env:TEMP 'radar_synth_build'
$sourceDir = Join-Path $outputDir 'src'
$artifactDir = Join-Path $projectRoot 'fpga\build\provisional_zynq7020'

New-Item -ItemType Directory -Force -Path $outputDir | Out-Null
New-Item -ItemType Directory -Force -Path $sourceDir | Out-Null
Copy-Item -LiteralPath (Join-Path $projectRoot 'fpga\rtl\radar_pulse_timing.v') -Destination $sourceDir -Force
Copy-Item -LiteralPath (Join-Path $projectRoot 'fpga\rtl\radar_axi_pulse.v') -Destination $sourceDir -Force
Push-Location $outputDir
try {
    $vivadoOutput = & $vivado -mode batch -source $tcl -tclargs $Part $outputDir 2>&1
    $vivadoExitCode = $LASTEXITCODE
    $vivadoOutput | ForEach-Object { Write-Output $_ }
    if ($vivadoExitCode -ne 0) { throw "Vivado synthesis failed with exit code $vivadoExitCode" }
    if (($vivadoOutput -join "`n").IndexOf("SYNTHESIS_PASS part=$Part", [StringComparison]::Ordinal) -lt 0) {
        throw 'Vivado did not report the expected synthesis pass marker.'
    }
    $report = Join-Path $outputDir 'utilization.rpt'
    $checkpoint = Join-Path $outputDir 'radar_axi_pulse_synth.dcp'
    if (-not (Test-Path -LiteralPath $report) -or -not (Test-Path -LiteralPath $checkpoint)) {
        throw 'Vivado returned without producing the utilization report and synthesized checkpoint.'
    }
    New-Item -ItemType Directory -Force -Path $artifactDir | Out-Null
    Copy-Item -LiteralPath $report -Destination $artifactDir -Force
    Copy-Item -LiteralPath $checkpoint -Destination $artifactDir -Force
    Write-Output "Synthesis outputs copied to: $artifactDir"
}
finally {
    Pop-Location
}
