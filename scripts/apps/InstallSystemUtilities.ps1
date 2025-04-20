Write-Host "Installing system utilities..." -ForegroundColor "Yellow"

Import-Module "$PSScriptRoot/../modules/AppInstaller.psm1"

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