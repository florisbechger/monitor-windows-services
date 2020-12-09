
<#
.NOTES
    Author: Floris Bechger, Technisch Applicatie Beheerder Planning
	E-mail: floris.bechger@gvb.nl; floris.bechger@gmail.com
    Last Edit: 2020-11-06
    Version 1.0 - initial release of Quintiq Service Script
#>

## Find installed Hotfixes on Servers and print out results in text file

## Elevate privileges ##
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }

## Load and Store Folder Variables ##
. .\qservices_variables.ps1
Write-Host "$Admin $Domain $ShareFolder $DesktopFolder $ScriptFolder $LogFolder $Date $Time $StartTime"

## Start logging ##
Start-Transcript -Path $Admin\$DesktopFolder\$ScriptFolder\$LogFolder\$Server-$Date-hotfix.log -Append

<#
$Hotfix = Get-MSHotfix # OLD
#>

$Hotfix = Get-Hotfix | Where-Object {$_.Installedon -gt ((Get-Date).Adddays(-60))} | Select-Object -Property * | Sort-Object -Property InstalledOn -desc

# $Hotfix = Get-Hotfix | Sort-Object -Property InstalledOn -desc

Write-Host "`n==== Hotfix Summary on Server (Last 60 days): '$Server' ===="
Write-Host ""
$Hotfix | Format-Table PSComputerName, HotFixID, InstalledOn, InstalledBy

## Stop logging ##
Write-Host ""
Stop-Transcript

## Return to Menu ##
# Invoke-Expression -Command "$Admin\$DesktopFolder\$ScriptFolder\menu_$Server.ps1"

## End script
