[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$Response = Invoke-RestMethod -Uri https://api.github.com/repos/NationalSecurityAgency/ghidra/releases/latest
$assets = $Response.assets
$asset = $assets | where-object { $_.name -match "Ghidra" -and $_.name -match ".zip"}
$asset.browser_download_url

$temp = "C:\temp"

if ((Test-Path -Path $temp) -ne "True") {
    mkdir $temp
}
if ((Test-Path -Path "C:\Dev") -ne "True") {
    mkdir "C:\Dev"
}

mkdir "C:\temp\ghidra\"

aria2c -x2 $asset.browser_download_url --out="$($asset.name)" --dir="C:\temp\ghidra"
Expand-Archive -Path C:\temp\ghidra\$($asset.name) -DestinationPath "C:\temp\ghidra"
Remove-Item C:\temp\ghidra\$($asset.name)
Copy-Item -Path "C:\temp\ghidra\*" -Destination "C:\Dev\Ghidra" -Force -Recurse
Remove-Item C:\temp\ghidra -Recurse -Force

$shell = New-Object -comObject WScript.Shell
$shortcut = $shell.CreateShortcut("$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Ghidra.lnk")
$shortcut.TargetPath = "C:\Dev\Ghidra\$((Get-ChildItem C:\Dev\Ghidra).Name)\ghidraRun.bat"
$shortcut.Save()