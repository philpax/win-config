Write-Host "Installing dev tools..." -ForegroundColor "Yellow"

function installApp {
    Param ([string]$appName)
    Write-Output "Installing $appName"
    winget install -e --id $appName
}

$applicationList = @(
#    "Microsoft.VisualStudio.2022.Community"
#    "Microsoft.VisualStudioCode"
#    "JetBrains.Rider"
    "Anysphere.Cursor"
    "Git.Git"
#    "Python.Python.3.11"
#    "Volta.Volta"
    "Rustlang.Rustup"
);

foreach ($app in $applicationList) {
    installApp $app
}
