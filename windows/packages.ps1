#Requires -Version 5
#Requires -RunAsAdministrator

$packages = @(
    # System Utilities
    "7zip",
    "autohotkey.portable",
    "bind-toolsonly",
    "gsudo",
    "microsoft-windows-terminal",
    "nano",
    "rsat",
    "sysinternals",
    "windirstat",

    # Android
    "adb",
    
    # Media
    "audacity",
    "audacity-ffmpeg",
    "ffmpeg",
    "dopamine",
    "obs-studio",
    "transmission",
    "vlc",
    "youtube-dl",

    # Security
    "bitwarden",
    "keybase",
    "pia",
    "veracrypt",

    # Development
    "diffutils",
    "docker-compose",
    "docker-desktop",
    "dotnetcore-runtime",
    "dotnetcore-sdk",
    "fiddler",
    "git",
    "golang",
    "gpg4win",
    "graphviz",
    "hackfont",
    "hxd",
    "jetbrainstoolbox",
    "jq",
    "kubernetes-cli",
    "make",
    "meld",
    "notepadplusplus",
    "nuget.commandline",
    "pkgconfiglite",
    "python2",
    "python3",
    "shellcheck",
    "vscode",
    "visualstudio-installer",
    "yq",

    # Gaming
    "logitechgaming",
    "ksp-ckan",
    "steam",

    # Misc Apps
    "gimp",
    "GoogleChrome"
)

$args = $("install", "--yes", "--accept-license") + $packages

if (-not (Get-Command choco -ErrorAction SilentlyContinue)) {
    Write-Output "Installing Chocolatey"
    Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}

Write-Output "Installing Packages"
Start-Process -FilePath "choco" -ArgumentList $args -Wait -NoNewWindow

Write-output "Bootstrapping gpg agent"
refreshenv

gpgconf --launch gpg-agent
