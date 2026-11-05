param(
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
        if ($cand -and (Test-Path -LiteralPath (Join-Path $cand 'xvlog.bat'))) {
            $VivadoBin = $cand
            break
        }
    }
}

if (-not $VivadoBin -or -not (Test-Path -LiteralPath $VivadoBin)) {
    throw "Vivado simulator tools not found. Pass -VivadoBin or -VivadoHome with the Vivado install directory."
}

Write-Host "Using Vivado bin: $VivadoBin"

$xvlog = Join-Path $VivadoBin 'xvlog.bat'
$xelab = Join-Path $VivadoBin 'xelab.bat'
$xsim = Join-Path $VivadoBin 'xsim.bat'
$buildDir = Join-Path $env:TEMP 'radar_xsim_build'

foreach ($tool in @($xvlog, $xelab, $xsim)) {
    if (-not (Test-Path -LiteralPath $tool)) {
        throw "Vivado simulator tool not found: $tool"
    }
}

New-Item -ItemType Directory -Force -Path $buildDir | Out-Null
Push-Location $buildDir
try {
    & $xvlog (Join-Path $projectRoot 'fpga\rtl\radar_pulse_timing.v') (Join-Path $projectRoot 'fpga\rtl\radar_axi_pulse.v') -sv (Join-Path $projectRoot 'fpga\sim\tb_radar_pulse_timing.sv') (Join-Path $projectRoot 'fpga\sim\tb_radar_axi_pulse.sv')
    if ($LASTEXITCODE -ne 0) { throw "xvlog failed with exit code $LASTEXITCODE" }

    $tests = @(
        @{ Name = 'tb_radar_pulse_timing'; PassMarker = 'PASS: pulse width, PRI, stop, and invalid-config checks' },
        @{ Name = 'tb_radar_axi_pulse'; PassMarker = 'PASS: AXI-Lite register access and PL pulse control' }
    )
    foreach ($test in $tests) {
        $testbench = $test.Name
        $snapshot = "${testbench}_snapshot"
        & $xelab $testbench -s $snapshot
        if ($LASTEXITCODE -ne 0) { throw "xelab failed for $testbench with exit code $LASTEXITCODE" }

        $simulationOutput = & $xsim $snapshot -R 2>&1
        $simulationExitCode = $LASTEXITCODE
        $simulationOutput | ForEach-Object { Write-Output $_ }
        if ($simulationExitCode -ne 0) { throw "xsim failed for $testbench with exit code $simulationExitCode" }
        if (($simulationOutput -join "`n").IndexOf($test.PassMarker, [StringComparison]::Ordinal) -lt 0) {
            throw "xsim did not report the expected pass marker for $testbench"
        }
    }
}
finally {
    Pop-Location
}
