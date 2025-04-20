Write-Host "Installing your apps..." -ForegroundColor "Yellow"

Import-Module (Join-Path $PSScriptRoot "..\modules\AppInstaller.psm1") -Force

installApps @(
    "Maxon.CinebenchR23"
    "CPUID.CPU-Z"
)
