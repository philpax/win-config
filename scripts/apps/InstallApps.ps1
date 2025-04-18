Write-Host "Installing your apps..." -ForegroundColor "Yellow"

function installApp {
    Param ([string]$appName)
    Write-Output "Installing $appName"
    winget install -e --id $appName
}

$applicationList = @(
    "Obsidian.Obsidian"
#    "Google.Chrome"
    "Mozilla.Firefox"
    "BlenderFoundation.Blender"
    "GIMP.GIMP"
    "dotPDNLLC.paintdotnet"
    "ShareX.ShareX"
    "Valve.Steam"
    "Discord.Discord"
    "qBittorrent.qBittorrent"
    "WinSCP.WinSCP"
    "VideoLAN.VLC"
    "Audacity.Audacity"
    "Spotify.Spotify"
#    "HandBrake.HandBrake"
#    "LIGHTNINGUK.ImgBurn"
#    "EclipseAdoptium.Temurin.8.JRE"
#    "EclipseAdoptium.Temurin.11.JRE"
#    "EclipseAdoptium.Temurin.17.JRE"
#    "EclipseAdoptium.Temurin.21.JRE"
     CPUID.CPU-Z
);

foreach ($app in $applicationList) {
    installApp $app
}
