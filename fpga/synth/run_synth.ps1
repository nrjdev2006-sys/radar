param(
    [string]$Part = 'xc7z020clg400-1'
)

$ErrorActionPreference = 'Stop'
$projectRoot = (Resolve-Path (Join-Path $PSScriptRoot '..\..')).Path
$vivado = 'C:\Xilinx\Vivado\2014.4\bin\vivado.bat'
$tcl = Join-Path $PSScriptRoot 'synth.tcl'
$outputDir = Join-Path $env:TEMP 'radar_synth_build'
$sourceDir = Join-Path $outputDir 'src'
$artifactDir = Join-Path $projectRoot 'fpga\build\provisional_zynq7020'

if (-not (Test-Path -LiteralPath $vivado)) {
    throw "Vivado not found: $vivado"
}
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
