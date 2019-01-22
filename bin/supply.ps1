[CmdletBinding()]
Param(
[Parameter(Mandatory=$True,Position=1)] [string]$BuildDir,
[Parameter(Mandatory=$True,Position=2)] [string]$CacheDir,
[Parameter(Mandatory=$True,Position=3)] [string]$DepsDir,
[Parameter(Mandatory=$True,Position=4)] [string]$DepsIdx
)

$ErrorActionPreference = "Stop"

$Version = (Get-Content "$PSScriptRoot/../VERSION" -Raw).Replace("`n","").Replace("`r","")
Write-Output "-----> Example Extension Buildpack (version $Version)"
Write-Output "       BuildDir: $BuildDir"
Write-Output "       CacheDir: $CacheDir"
Write-Output "       DepsDir: $DepsDir"
Write-Output "       DepsIdx: $DepsIdx"
Write-Output ""

New-Item -ItemType directory -Path "$DepsDir/$DepsIdx/bin"
Set-Content -Path "$DepsDir/$DepsIdx/bin/mysupplied.bat" -Value 'echo "Hi from file on path, mysupplied.bat"'

New-Item -ItemType directory -Path "$DepsDir/$DepsIdx/profile.d"
Set-Content -Path "$DepsDir/$DepsIdx/profile.d/mysupplied.bat" -Value 'set MyTestVariable="My temporary test variable."'
