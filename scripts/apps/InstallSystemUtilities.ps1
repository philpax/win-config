Write-Host "Installing system management tools..." -ForegroundColor "Yellow"

function installApp {
    Param ([string]$appName)
    Write-Output "Installing $appName"
    winget install -e --id $appName
}

$applicationList = @(
    "Microsoft.Sysinternals.Autoruns"
    "Microsoft.Sysinternals.ProcessExplorer"
    "Microsoft.Sysinternals.Strings"
    "Microsoft.PowerToys"
    "WinDirStat.WinDirStat"
    "7zip.7zip"
    "CodecGuide.K-LiteCodecPack.Full"
    "aria2.aria2"
    "schollz.croc"
);

foreach ($app in $applicationList) {
    installApp $app
}