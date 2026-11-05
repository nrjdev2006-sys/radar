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
$tcl = Join-Path $PSScriptRoot 'build_system.tcl'
$workDir = Join-Path $env:TEMP 'radar_pspl_system'
$sourceDir = Join-Path $workDir 'src'
$artifactDir = Join-Path $projectRoot 'fpga\build\provisional_zynq7020_pspl'

New-Item -ItemType Directory -Force -Path $workDir | Out-Null
New-Item -ItemType Directory -Force -Path $sourceDir | Out-Null
Copy-Item -LiteralPath (Join-Path $projectRoot 'fpga\rtl\radar_pulse_timing.v') -Destination $sourceDir -Force
Copy-Item -LiteralPath (Join-Path $projectRoot 'fpga\rtl\radar_axi_pulse.v') -Destination $sourceDir -Force

Push-Location $workDir
try {
    $vivadoOutput = & $vivado -mode batch -source $tcl -tclargs $Part $workDir 2>&1
    $vivadoExitCode = $LASTEXITCODE
    $vivadoOutput | ForEach-Object { Write-Output $_ }
    if ($vivadoExitCode -ne 0) { throw "Vivado PS/PL block design build failed with exit code $vivadoExitCode" }
    if (($vivadoOutput -join "`n").IndexOf("PSPL_BD_PASS part=$Part", [StringComparison]::Ordinal) -lt 0) {
        throw 'Vivado did not report the expected PS/PL block-design pass marker.'
    }
    if (($vivadoOutput -join "`n").IndexOf("PSPL_SYNTH_PASS part=$Part", [StringComparison]::Ordinal) -lt 0) {
        throw 'Vivado did not report the expected PS/PL synthesis pass marker.'
    }

    New-Item -ItemType Directory -Force -Path $artifactDir | Out-Null
    Copy-Item -LiteralPath (Join-Path $workDir 'radar_pspl.srcs\sources_1\bd\radar_system\radar_system.bd') -Destination $artifactDir -Force

    $wrapperCandidate = Join-Path $workDir 'radar_pspl.gen\sources_1\bd\radar_system\hdl\radar_system_wrapper.v'
    if (-not (Test-Path -LiteralPath $wrapperCandidate)) {
        $wrapperCandidate = Join-Path $workDir 'radar_pspl.srcs\sources_1\bd\radar_system\hdl\radar_system_wrapper.v'
    }
    Copy-Item -LiteralPath $wrapperCandidate -Destination $artifactDir -Force
    Copy-Item -LiteralPath (Join-Path $workDir 'system_utilization.rpt') -Destination $artifactDir -Force
    Copy-Item -LiteralPath (Join-Path $workDir 'radar_system_synth.dcp') -Destination $artifactDir -Force
    Write-Output "PS/PL block design artifacts copied to: $artifactDir"
}
finally {
    Pop-Location
}
