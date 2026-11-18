param(
    [Parameter(Mandatory = $true)][string]$BspRoot,
    [string]$Python = 'py'
)
$ErrorActionPreference = 'Stop'
$patcher = Join-Path $PSScriptRoot 'apply_phy_patch.py'
& $Python -3.11 $patcher $BspRoot
if ($LASTEXITCODE -ne 0) { throw "PHY patch failed with exit code $LASTEXITCODE" }
