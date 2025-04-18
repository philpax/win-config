Write-Host "Installing your multimedia apps..." -ForegroundColor "Yellow"

function installApp {
    Param ([string]$appName)
    Write-Output "Installing $appName"
    winget install -e --id $appName
}

$applicationList = @(
#    "GIMP.GIMP"
    "Gyan.FFmpeg"
#    "FlorianHeidenreich.Mp3tag"
#    "Unity.UnityHub"
    "VideoLAN.VLC"
    "Inkscape.Inkscape"
#    "dotPDN.PaintDotNet"
#    "HandBrake.HandBrake"
#    "LIGHTNINGUK.ImgBurn"
#    "GuinpinSoft.MakeMKV"
#    "OBSProject.OBSStudio"
    "yt-dlp.yt-dlp"
);

foreach ($app in $applicationList) {
    installApp $app
}
