param(
    [string]$Part = 'xc7z010clg400-1'
)

$ErrorActionPreference = 'Stop'
$projectRoot = (Resolve-Path (Join-Path $PSScriptRoot '..\..')).Path
$vivado = 'D:\Vivado\2024.2\bin\vivado.bat'
$tcl = Join-Path $PSScriptRoot 'build_project.tcl'
$projectDir = Join-Path $PSScriptRoot 'radar_vivado_project'

function Get-ShortPath([string]$Path) {
    $command = 'for %I in ("' + $Path + '") do @echo %~sI'
    $shortPath = (& $env:ComSpec /d /c $command | Select-Object -Last 1).Trim()
    if (-not $shortPath -or -not (Test-Path -LiteralPath $shortPath)) {
        throw "Could not resolve a Windows short path for: $Path"
    }
    return $shortPath
}

if (-not (Test-Path -LiteralPath $vivado)) {
    throw "Vivado 2024.2 not found: $vivado"
}
New-Item -ItemType Directory -Force -Path $projectDir | Out-Null
$projectDirShort = Get-ShortPath $projectDir
$projectRootShort = Get-ShortPath $projectRoot
Push-Location $projectDir
try {
    $vivadoOutput = & $vivado -mode batch -source $tcl -tclargs $Part $projectDirShort $projectRootShort 2>&1
    $vivadoExitCode = $LASTEXITCODE
    $vivadoOutput | ForEach-Object { Write-Output $_ }
    if ($vivadoExitCode -ne 0) { throw "Vivado project build failed with exit code $vivadoExitCode" }
    $outputText = $vivadoOutput -join "`n"
    if ($outputText.IndexOf("VIVADO_PROJECT_PASS part=$Part", [StringComparison]::Ordinal) -lt 0) {
        throw 'Vivado did not report the expected project pass marker.'
    }
    if ($outputText.IndexOf('XSA_PASS', [StringComparison]::Ordinal) -lt 0) {
        throw 'Vivado did not report the expected XSA export marker.'
    }
    $requiredFiles = @(
        'radar_vivado.xpr',
        'radar_hardware.xsa',
        'radar_vivado.srcs\sources_1\bd\radar_system\radar_system.bd',
        'radar_vivado.gen\sources_1\bd\radar_system\hdl\radar_system_wrapper.v'
    )
    foreach ($requiredFile in $requiredFiles) {
        $path = Join-Path $projectDir $requiredFile
        if (-not (Test-Path -LiteralPath $path)) { throw "Expected Vivado output is missing: $path" }
    }
    Write-Output "Open this project in Vivado: $(Join-Path $projectDir 'radar_vivado.xpr')"
}
finally {
    Pop-Location
}
