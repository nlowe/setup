#Requires -Version 5
#Requires -RunAsAdministrator

Write-Output "=== Applying W10 Customization Settings"
Import-Module $PSScriptRoot\tools\Win10-Initial-Setup-Script\Win10.psm1
& "$PSScriptRoot\tools\Win10-Initial-Setup-Script\Win10.ps1" -preset $PSScriptRoot\conf\Win10-Initial-Setup-Script\custom.preset

$hosts = Join-Path -Path $env:SystemRoot -ChildPath System32 | Join-Path -ChildPath drivers | Join-Path -ChildPath etc | Join-Path -ChildPath hosts
if (-not (Get-Content -Raw -Path $hosts).Contains("# Microsoft Telemetry")) {
    Write-Output "=== Black-holing MS Telemetry"
    Get-Content -Path "$PSSCriptRoot\tools\w10-hosts-blacklist\hosts" | Select-Object -Skip 21 | Out-File -Encoding ascii -Append -FilePath $hosts
}