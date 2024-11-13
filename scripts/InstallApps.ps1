Write-Host "Installing your apps..." -ForegroundColor "Yellow"

function installApp {
    Param ([string]$appName)
    Write-Output "Installing $appName"
    winget install -e --id $appName
}

$applicationList = @(
    "Microsoft.VisualStudioCode"
    "Git.Git"
    "Python.Python.3.11"
    "Volta.Volta"
    "Obsidian.Obsidian"
    "Google.Chrome"
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
    "CodecGuide.K-LiteCodecPack.Full"
    "Spotify.Spotify"
    "HandBrake.HandBrake"
    "7zip.7zip"
    "LIGHTNINGUK.ImgBurn"
    "WinDirStat.WinDirStat"
    "EclipseAdoptium.Temurin.8.JRE"
    "EclipseAdoptium.Temurin.11.JRE"
    "EclipseAdoptium.Temurin.17.JRE"
    "EclipseAdoptium.Temurin.21.JRE"
);

foreach ($app in $applicationList) {
    installApp $app
}