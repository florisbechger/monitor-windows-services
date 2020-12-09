
<#
.NOTES
    Author: Floris Bechger, Technisch Applicatie Beheerder Planning
	E-mail: floris.bechger@gvb.nl; floris.bechger@gmail.com
    Last Edit: 2020-11-06
    Version 1.0 - initial release of Quintiq Service Script
#>

## Read latest logfile on Server

## Elevate privileges ##
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }

## Load and Store Folder Variables ##
. .\qservices_variables.ps1
Write-Host "$Admin $Domain $ShareFolder $DesktopFolder $ScriptFolder $LogFolder $Date $Time $StartTime"

Clear-Host

## Source and Destination folders ##
$Source = "$Admin\$DesktopFolder\$ScriptFolder\$LogFolder"
$Destination = "$Admin\$DesktopFolder"
$LogFiles = Get-ChildItem -Path $Source -Include *.log -File -Recurse -ErrorAction SilentlyContinue `
 | Where-Object { $_.LastWriteTime -ge $Date } `
 | Sort-Object LastAccessTime -Descending | Select-Object -First 1

## Open latest Logfile ##
Write-Host "`nLatest Logfile ($Date $Time):"
Write-Host ""
Get-Content $LogFiles

## Show Today's Logfiles ##
# Write-Host "`nPath to File:"
# Get-ChildItem -Path $Source -Include *.log -File -Recurse -ErrorAction SilentlyContinue | Where-Object { $_.LastWriteTime -ge $Date }

## Copy Today's Logfiles to Desktop ##
# New-Item -ItemType directory -Path $Destination -Force
# Copy-Item -Path $Source\*.* -Destination $Destination -Force