param(
    [string]$Vitis = '',
    [string]$VivadoHome = '',
    [string]$Xsa = '',
    [string]$Workspace = ''
)

$ErrorActionPreference = 'Stop'
$script = (Resolve-Path (Join-Path $PSScriptRoot 'create_vitis_workspace.py')).Path
if (-not $Vitis) {
    $vitisHome = if ($env:XILINX_VITIS) { $env:XILINX_VITIS } else { 'C:\Xilinx\Vitis\2024.2' }
    $Vitis = Join-Path $vitisHome 'bin\vitis.bat'
} else {
    $vitisHome = Split-Path (Split-Path $Vitis -Parent) -Parent
}
if (-not (Test-Path -LiteralPath $Vitis)) {
    throw "Vitis CLI not found: $Vitis"
}
if (-not $VivadoHome) {
    $VivadoHome = if ($env:XILINX_VIVADO) { $env:XILINX_VIVADO } else { 'C:\Xilinx\Vivado\2024.2' }
}
if (-not $Xsa) {
    $repoRoot = (Resolve-Path (Join-Path $PSScriptRoot '..\..')).Path
    $Xsa = Join-Path $repoRoot 'fpga\vivado\radar_vivado_project\radar_hardware.xsa'
}
if (-not (Test-Path -LiteralPath $Xsa)) {
    throw "Hardware handoff not found: $Xsa"
}
if (-not $Workspace) {
    $Workspace = Join-Path $PSScriptRoot 'radar_workspace_vitis'
}

$env:RADAR_XSA = (Resolve-Path -LiteralPath $Xsa).Path
$env:RADAR_VITIS_WORKSPACE = $Workspace
$env:RADAR_VITIS_HOME = $vitisHome
$env:RADAR_VIVADO_HOME = $VivadoHome
$env:XILINX_VITIS = $vitisHome
$env:XILINX_VIVADO = $VivadoHome
$env:VITIS_SDT_REPO = Join-Path $vitisHome 'data\system-device-tree-xlnx'
$xsctCandidates = @(
    (Join-Path $VivadoHome 'xsct-trim\bin'),
    (Join-Path $vitisHome 'bin')
)
$xsctBin = $xsctCandidates | Where-Object { Test-Path (Join-Path $_ 'xsct.bat') } | Select-Object -First 1
if ($xsctBin) {
    $env:PATH = "$xsctBin;$env:PATH"
}

$command = 'for %I in ("' + $script + '") do @echo %~sI'
$shortScript = (& $env:ComSpec /d /c $command | Select-Object -Last 1).Trim()
if (-not $shortScript -or -not (Test-Path -LiteralPath $shortScript)) {
    throw "Could not resolve a Windows short path for: $script"
}

$log = Join-Path $PSScriptRoot 'build_vitis.log'
$previousErrorActionPreference = $ErrorActionPreference
$ErrorActionPreference = 'Continue'
& $Vitis -s $shortScript 2>&1 | Tee-Object -FilePath $log
$result = $LASTEXITCODE
$ErrorActionPreference = $previousErrorActionPreference
if ($result -ne 0) {
    throw "Vitis project creation failed with exit code $result. See $log"
}
