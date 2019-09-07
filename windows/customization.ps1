#Requires -Version 5
#Requires -RunAsAdministrator

Write-Output "=== Applying W10 Customization Settings"
Import-Module $PSScriptRoot\tools\Win10-Initial-Setup-Script\Win10.psm1
& "$PSScriptRoot\tools\Win10-Initial-Setup-Script\Win10.ps1" -preset $PSScriptRoot\conf\Win10-Initial-Setup-Script\custom.preset
