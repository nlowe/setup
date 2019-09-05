#Requires -Version 5.0
#Requires -RunAsAdministrator

Write-Output "Bootstrapping Setup"

if (-not (Get-Command choco -ErrorAction SilentlyContinue)) {
    Write-Output "Installing Chocolatey"
    Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}

Write-Output "Chocolatey is Installed"
if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    Write-Output "Installing git"
    choco install --yes git
}
refreshenv

Write-Output "Downloading Setup Scripts"
New-Item -ItemType Directory -Path $env:USERPROFILE -Name projects -ErrorAction SilentlyContinue | Out-Null
$target = Join-Path -Path $env:USERPROFILE -ChildPath setup
if (-not (Test-Path -Path $target)) {
    git clone https://github.com/nlowe/setup $target
}

Set-Location $target

Write-Output "Getting Latest Changes"
git pull --ff origin master
git submodule update --init --recursive

./windows/all.ps1
