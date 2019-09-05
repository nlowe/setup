#Requires -Version 5
#Requires -RunAsAdministrator

$packages = @(
    # System Utilities
    "7zip",
    "microsoft-windows-terminal",
    "sysinternals",
    "windirstat",

    # Media
    "audacity",
    "audacity-ffmpeg",
    "ffmpeg",
    "dopamine",
    "obs-studio",
    "vlc",
    "youtube-dl",

    # Security
    "bitwarden",
    "keybase",
    "pia",
    "veracrypt",

    # Development
    "docker-compose",
    "docker-desktop",
    "dotnetcore-runtime",
    "dotnetcore-sdk",
    "fiddler",
    "git",
    "golang",
    "gpg4win",
    "hackfont",
    "jetbrainstoolbox",
    "kubernetes-cli",
    "meld",
    "notepadplusplus",
    "nuget.commandline",
    "python2",
    "python3",
    "shellcheck",
    "vscode",
    "visualstudio-installer",

    # Gaming
    "logitechgaming",
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