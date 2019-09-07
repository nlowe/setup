#Requires -Version 5
#Requires -RunAsAdministrator

Write-Output "Using Setup Scripts in $PSScriptRoot"

& "$PSScriptRoot/customization.ps1"
& "$PSScriptRoot/packages.ps1"
& "$PSScriptRoot/dotfiles.ps1"

Write-Output "=== System Customization Complete"
Write-Output "=== Please Reboot to apply all changes"
