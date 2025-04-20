# PowerShell script to download, extract, install multiple font packages and clean up

# Define a list of font packages
$fontPackages = @(
    @{
        Name        = "Iosevka"
        DownloadUrl = "https://github.com/be5invis/Iosevka/releases/download/v33.2.1/PkgTTF-Iosevka-33.2.1.zip"
    }
    # Add more font packages here as needed, following the same structure
    # Example:
    # @{
    #     Name = "AnotherFont"
    #     DownloadUrl = "https://example.com/font.zip"
    # }
)

$fontsFolder = "$env:WINDIR\Fonts"
$tempFolder = "$env:TEMP\FontInstaller"

# Check for administrator privileges
$isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
if (-not $isAdmin) {
    Write-Error "This script requires administrator privileges. Please run PowerShell as an administrator."
    exit
}

# Create temp folder if it doesn't exist
if (!(Test-Path -Path $tempFolder)) {
    New-Item -ItemType Directory -Path $tempFolder | Out-Null
}

# Create Shell.Application COM object for font registration
$shell = New-Object -ComObject Shell.Application
$fontsNamespace = $shell.Namespace(0x14)  # 0x14 is the Fonts folder

# Process each font package
foreach ($package in $fontPackages) {
    $packageName = $package.Name
    $downloadUrl = $package.DownloadUrl
    $zipPath = "$tempFolder\$packageName.zip"
    $extractPath = "$tempFolder\$packageName"

    try {
        # Create the extraction directory if it doesn't exist
        if (!(Test-Path -Path $extractPath)) {
            New-Item -ItemType Directory -Path $extractPath | Out-Null
        }

        # Download the ZIP file
        Write-Host "Downloading $packageName font package..."
        Invoke-WebRequest -Uri $downloadUrl -OutFile $zipPath

        # Extract the ZIP file
        Write-Host "Extracting $packageName ZIP file..."
        Expand-Archive -Path $zipPath -DestinationPath $extractPath -Force

        # Find all TTF files in the extracted directory
        $fontFiles = Get-ChildItem -Path $extractPath -Filter "*.ttf" -Recurse

        if ($fontFiles.Count -eq 0) {
            Write-Warning "No TTF files found in the $packageName package."
        }
        else {
            # Install each font using Shell.Application
            Write-Host "Installing $packageName fonts..."
            foreach ($fontFile in $fontFiles) {
                $fontName = $fontFile.Name
                Write-Host "Installing: $fontName"
                $fontsNamespace.CopyHere($fontFile.FullName)
            }

            Write-Host "$packageName fonts installation completed successfully!"
        }
    }
    catch {
        Write-Error ("An error occurred while processing " + $packageName + ": " + $_.Exception.Message)
    }
    finally {
        # Clean up this package's files
        Write-Host "Cleaning up $packageName files..."
        if (Test-Path -Path $zipPath) {
            Remove-Item -Path $zipPath -Force
        }
        if (Test-Path -Path $extractPath) {
            Remove-Item -Path $extractPath -Recurse -Force
        }
    }
}

# Remove the temp folder if it's empty
if ((Get-ChildItem -Path $tempFolder | Measure-Object).Count -eq 0) {
    Remove-Item -Path $tempFolder -Force
}

Write-Host "All font installations completed!"