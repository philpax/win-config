Write-Host "Installing vscode extensions..." -ForegroundColor "Yellow"

function installApp {
    Param ([string]$extensionName)
    Write-Output "Installing $extensionName"
    code --install-extension $extensionName
}

$extensionList = @(
    "astro-build.astro-vscode"
    "azemoh.one-monokai"
    "bbenoist.nix"
    "bmewburn.vscode-intelephense-client"
    "bradlc.vscode-tailwindcss"
    "christian-kohler.npm-intellisense"
    "codezombiech.gitignore"
    "dbaeumer.vscode-eslint"
    "ducfilan.pug-formatter"
    "eamodio.gitlens"
    "editorconfig.editorconfig"
    "esbenp.prettier-vscode"
    "github.vscode-github-actions"
    "golang.go"
    "hashicorp.hcl"
    "mechatroner.rainbow-csv"
    "ms-azuretools.vscode-docker"
    "ms-dotnettools.csdevkit"
    "ms-dotnettools.csharp"
    "ms-dotnettools.dotnet-maui"
    "ms-dotnettools.vscode-dotnet-runtime"
    "ms-python.debugpy"
    "ms-python.isort"
    "ms-python.python"
    "ms-python.vscode-pylance"
    "ms-vscode-remote.remote-ssh"
    "ms-vscode-remote.remote-ssh-edit"
    "ms-vscode.cmake-tools"
    "ms-vscode.cpptools"
    "ms-vscode.cpptools-extension-pack"
    "ms-vscode.cpptools-themes"
    "ms-vscode.hexeditor"
    "ms-vscode.js-debug-nightly"
    "ms-vscode.remote-explorer"
    "pkief.material-icon-theme"
    "platformio.platformio-ide"
    "prisma.prisma"
    "qwtel.sqlite-viewer"
    "redhat.vscode-xml"
    "redhat.vscode-yaml"
    "ritwickdey.liveserver"
    "rust-lang.rust-analyzer"
    "simonsiefke.svg-preview"
    "statiolake.vscode-rustfmt"
    "tauri-apps.tauri-vscode"
    "tomoki1207.pdf"
    "twxs.cmake"
    "ultram4rine.vscode-choosealicense"
    "unifiedjs.vscode-mdx"
    "yzhang.markdown-all-in-one"
);

foreach ($extension in $extensionList) {
    installApp $extension
}