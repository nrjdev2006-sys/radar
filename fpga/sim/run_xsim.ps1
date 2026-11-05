$ErrorActionPreference = 'Stop'

$projectRoot = (Resolve-Path (Join-Path $PSScriptRoot '..\..')).Path
$vivadoBin = 'C:\Xilinx\Vivado\2014.4\bin'
$xvlog = Join-Path $vivadoBin 'xvlog.bat'
$xelab = Join-Path $vivadoBin 'xelab.bat'
$xsim = Join-Path $vivadoBin 'xsim.bat'
$buildDir = Join-Path $env:TEMP 'radar_xsim_build'

foreach ($tool in @($xvlog, $xelab, $xsim)) {
    if (-not (Test-Path -LiteralPath $tool)) {
        throw "Vivado simulator tool not found: $tool"
    }
}

New-Item -ItemType Directory -Force -Path $buildDir | Out-Null
Push-Location $buildDir
try {
    & $xvlog (Join-Path $projectRoot 'fpga\rtl\radar_pulse_timing.v') (Join-Path $projectRoot 'fpga\rtl\radar_axi_pulse.v') (Join-Path $projectRoot 'fpga\sim\tb_radar_pulse_timing.sv') (Join-Path $projectRoot 'fpga\sim\tb_radar_axi_pulse.sv')
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
