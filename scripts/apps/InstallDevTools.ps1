Write-Host "Installing dev tools..." -ForegroundColor "Yellow"

Import-Module "$PSScriptRoot/../modules/AppInstaller.psm1"

$applicationList = @(
    "Anysphere.Cursor"
    "Git.Git"
    "Rustlang.Rustup"
);

foreach ($app in $applicationList) {
    installApp $app
}
