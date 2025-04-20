Write-Host "Installing multimedia apps..." -ForegroundColor "Yellow"

Import-Module (Join-Path $PSScriptRoot "..\modules\AppInstaller.psm1") -Force

installApps @(
    "Gyan.FFmpeg"
    "VideoLAN.VLC"
    "Inkscape.Inkscape"
    "yt-dlp.yt-dlp"
)
