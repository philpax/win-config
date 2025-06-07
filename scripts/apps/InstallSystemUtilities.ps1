Write-Host "Installing system utilities..." -ForegroundColor "Yellow"

Import-Module (Join-Path $PSScriptRoot "..\modules\AppInstaller.psm1") -Force

installApps @(
    "Microsoft.Sysinternals.Autoruns"
    "Microsoft.Sysinternals.ProcessExplorer"
    "Microsoft.Sysinternals.Strings"
    "Microsoft.PowerToys"
    "Microsoft.PowerShell"
    "WinDirStat.WinDirStat"
    "7zip.7zip"
    "CodecGuide.K-LiteCodecPack.Full"
    "aria2.aria2"
    "schollz.croc"
    "RamenSoftware.Windhawk"
    "Syncthing.Syncthing"
    "Martchus.syncthingtray"
    "REALiX.HWiNFO"
)