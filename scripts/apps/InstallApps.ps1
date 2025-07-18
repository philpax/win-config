Write-Host "Installing your apps..." -ForegroundColor "Yellow"

Import-Module (Join-Path $PSScriptRoot "..\modules\AppInstaller.psm1") -Force

installApps @(
    "Obsidian.Obsidian"
    "Mozilla.Firefox"
    "BlenderFoundation.Blender"
    "GIMP.GIMP"
    "dotPDNLLC.paintdotnet"
    "ShareX.ShareX"
    "Valve.Steam"
    "Discord.Discord"
    "qBittorrent.qBittorrent"
    "WinSCP.WinSCP"
    "Audacity.Audacity"
    "Spotify.Spotify"
    "Anki.Anki"
)
