param(
    [string]$Vitis = 'D:\Vitis\2024.2\bin\vitis.bat'
)

$ErrorActionPreference = 'Stop'
$script = (Resolve-Path (Join-Path $PSScriptRoot 'create_vitis_workspace.py')).Path
if (-not (Test-Path -LiteralPath $Vitis)) {
    throw "Vitis CLI not found: $Vitis"
}

$command = 'for %I in ("' + $script + '") do @echo %~sI'
$shortScript = (& $env:ComSpec /d /c $command | Select-Object -Last 1).Trim()
if (-not $shortScript -or -not (Test-Path -LiteralPath $shortScript)) {
    throw "Could not resolve a Windows short path for: $script"
}

& $Vitis -s $shortScript
if ($LASTEXITCODE -ne 0) {
    throw "Vitis project creation failed with exit code $LASTEXITCODE"
}
