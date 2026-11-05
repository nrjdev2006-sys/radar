param(
    [string]$VitisHome = $env:XILINX_VITIS,
    [string]$VivadoHome = $env:XILINX_VIVADO,
    [string]$Workspace = ""
)

$ErrorActionPreference = "Stop"
$repoRoot = (Resolve-Path (Join-Path $PSScriptRoot "..\..")).Path
$xsa = Join-Path $repoRoot "fpga\vivado\radar_vivado_project\radar_hardware.xsa"

if (-not $VitisHome) {
    $VitisHome = "D:\Vitis\2024.2"
}
if (-not $VivadoHome) {
    $VivadoHome = "D:\Vivado\2024.2"
}
if (-not $Workspace) {
    $stamp = Get-Date -Format "yyyyMMdd_HHmmss"
    $Workspace = Join-Path $env:SystemDrive "radar_vitis_platform_check_$stamp"
}

$vitisBat = Join-Path $VitisHome "bin\vitis.bat"
$stageDir = Join-Path $env:SystemDrive "radar_vitis_diag"
$pythonScript = Join-Path $stageDir "diagnose_platform.py"
$stagedXsa = Join-Path $stageDir "radar_hardware.xsa"
if (-not (Test-Path -LiteralPath $vitisBat)) {
    throw "Vitis launcher not found: $vitisBat. Pass -VitisHome with the Vitis 2024.2 install directory."
}
if (-not (Test-Path -LiteralPath $xsa)) {
    throw "XSA not found: $xsa. Run the Vivado project build first."
}
New-Item -ItemType Directory -Force -Path $stageDir | Out-Null
Copy-Item -LiteralPath (Join-Path $PSScriptRoot "diagnose_platform.py") -Destination $pythonScript -Force
Copy-Item -LiteralPath $xsa -Destination $stagedXsa -Force

$xsctCandidates = @(
    (Join-Path $VivadoHome "xsct-trim\bin"),
    (Join-Path $VitisHome "xsct-trim\bin"),
    (Join-Path $VitisHome "bin")
)
$xsctBin = $xsctCandidates | Where-Object { Test-Path (Join-Path $_ "xsct.bat") } | Select-Object -First 1
$sdtRepo = Join-Path $VitisHome "data\system-device-tree-xlnx"
if (-not (Test-Path -LiteralPath $sdtRepo)) {
    $sdtRepo = Join-Path $VivadoHome "data\system-device-tree-xlnx"
}

$env:RADAR_VITIS_HOME = $VitisHome
$env:RADAR_VIVADO_HOME = $VivadoHome
$env:RADAR_XSA = $stagedXsa
$env:RADAR_VITIS_WORKSPACE = $Workspace
$env:RADAR_XSCT_BIN = $xsctBin
if (Test-Path -LiteralPath $sdtRepo) {
    $env:VITIS_SDT_REPO = $sdtRepo
}

$stamp = Get-Date -Format "yyyyMMdd_HHmmss"
$log = Join-Path $stageDir "platform_check_$stamp.log"
Write-Host "Vitis:     $VitisHome"
Write-Host "Vivado:    $VivadoHome"
Write-Host "XSA:       $stagedXsa (staged from $xsa)"
Write-Host "Workspace: $Workspace"
Write-Host "Log:       $log"

$previousErrorActionPreference = $ErrorActionPreference
$ErrorActionPreference = "Continue"
& $vitisBat -s $pythonScript 2>&1 | Tee-Object -FilePath $log
$result = $LASTEXITCODE
$ErrorActionPreference = $previousErrorActionPreference
if (-not (Select-String -LiteralPath $log -Pattern "PLATFORM_CHECK_PASSED" -Quiet)) {
    $result = 1
}
Write-Host "Vitis exit code: $result"
exit $result
