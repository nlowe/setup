#Requires -Version 5

Write-Output "=== Setting Up dotfiles"

$files = Get-Content -Raw -Path $PSScriptRoot/../shared/dotfiles-map.json | ConvertFrom-Json
$files | Get-Member -MemberType NoteProperty | ForEach-Object {
    Write-Output "> $($_.Name)"
    $f = $files | Select-Object -ExpandProperty $_.Name
    $source = Join-Path -Path $PSScriptRoot -ChildPath .. | Join-Path -ChildPath shared | Join-Path -ChildPath dotfiles | Join-Path -ChildPath $_.Name
    # $destionation = Resolve-Path -Path $f.destination

    if (Test-Path -Path $f.destination) {
        Write-Warning "Skipping $($_.name) (file already exists on the system)"
        continue
    }

    if ($f.symlink) {
        New-Item -ItemType SymbolicLink -Path $f.destination -Target $source -Force | Out-Null
    } else {
        Get-Content -Path $source -Raw | Set-Content -Path $f.destination -Force | Out-Null
    }
}
