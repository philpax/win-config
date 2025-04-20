Write-Host "Installing dev tools..." -ForegroundColor "Yellow"

Import-Module (Join-Path $PSScriptRoot "..\modules\AppInstaller.psm1") -Force

installApps @(
    "Anysphere.Cursor"
    "Git.Git"
    "Rustlang.Rustup"
)
