Write-Host "Installing multimedia apps..." -ForegroundColor "Yellow"

Import-Module (Join-Path $PSScriptRoot "..\modules\AppInstaller.psm1") -Force

installApps @(
    "VideoLAN.VLC"
    "yt-dlp.yt-dlp"
)

winget install ffmpeg