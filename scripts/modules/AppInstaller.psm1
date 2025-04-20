function installApp {
    Param ([string]$appName)
    Write-Output "Installing $appName"
    winget install -e --id $appName
}

function installApps {
    Param ([string[]]$appNames)
    foreach ($app in $appNames) {
        installApp $app
    }
}

Export-ModuleMember -Function installApp, installApps