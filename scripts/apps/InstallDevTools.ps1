Write-Host "Installing dev tools..." -ForegroundColor "Yellow"

Import-Module (Join-Path $PSScriptRoot "..\modules\AppInstaller.psm1") -Force

winget install Microsoft.VisualStudio.2022.Community --silent --override "--wait --quiet --add ProductLang En-us --add Microsoft.VisualStudio.Workload.NativeDesktop --includeRecommended"

installApps @(
    "Anysphere.Cursor"
    "Git.Git"
    "Rustlang.Rustup"
    "OpenJS.NodeJS"
    "Python.Python.3.12"
    "Amazon.AWSCLI"
)
