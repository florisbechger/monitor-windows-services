
<#
.NOTES
    Author: Floris Bechger, Technisch Applicatie Beheerder Planning
	E-mail: floris.bechger@gvb.nl; floris.bechger@gmail.com
    Last Edit: 2020-11-06
    Version 1.0 - initial release of Quintiq Service Script
#>

## Find installed Software on Servers and print out results in text file

## Elevate privileges ##
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }

## Load and Store Folder Variables ##
. .\qservices_variables.ps1
Write-Host "$Admin $Domain $ShareFolder $DesktopFolder $ScriptFolder $LogFolder $Date $Time $StartTime"

## Start logging ##
Start-Transcript -Path $Admin\$DesktopFolder\$ScriptFolder\$LogFolder\$Server-$Date-software.log -Append

$Software = Get-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*',
 'HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*',
 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*',
 'HKCU:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*' -ErrorAction Ignore |
 Where-Object DisplayName |
 Select-Object -Property DisplayName, DisplayVersion, InstallDate, UninstallString |
 Sort-Object -Property DisplayName, DisplayVersion, InstallDate
$AppPackage = Get-AppPackage | Select-Object Name, Publisher, Architecture, Version, PackageFullName, InstallLocation, Status | Sort-Object -Property Name
$Background = Get-AppBackgroundTask | Select-Object PackageFullName, EntryPoint | Sort-Object -Property PackageFullName -desc

Write-Host "`n==== Software Summary on Server: '$Server' ===="
Write-Host ""
$Software | Format-Table DisplayName, DisplayVersion, InstallDate

Write-Host "`n==== AppPackages on Server: '$Server' ===="
Write-Host ""
$AppPackage | Format-Table PackageFullName, EntryPoint

Write-Host "`n==== Background processes on Server: '$Server' ===="
Write-Host ""
$Background | Format-Table PackageFullName, EntryPoint

Write-Host "`n==== Scheduled registered tasks on local (!) Server: ===="
Write-Host ""
Get-ScheduledTask | Select-Object TaskName, TaskPath, State | Sort-Object -Property State, TaskName

## Stop logging ##
Write-Host ""
Stop-Transcript

## Return to Menu ##
# Invoke-Expression -Command "$Admin\$DesktopFolder\$ScriptFolder\menu_$Server.ps1"

## End script
