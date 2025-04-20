Write-Host "Installing multimedia apps..." -ForegroundColor "Yellow"

Import-Module "$PSScriptRoot/../modules/AppInstaller.psm1"

$applicationList = @(
    "Gyan.FFmpeg"
    "VideoLAN.VLC"
    "Inkscape.Inkscape"
    "yt-dlp.yt-dlp"
);

foreach ($app in $applicationList) {
    installApp $app
}
