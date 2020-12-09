
<#
.NOTES
    Author: Floris Bechger, Technisch Applicatie Beheerder Planning
	E-mail: floris.bechger@gvb.nl; floris.bechger@gmail.com
    Last Edit: 2020-11-06
    Version 1.0 - initial release of Quintiq Service Script
#>

## Find QServices Variables

## Elevate privileges ##
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }

## List Variables ##
Get-Variable -Name Admin -ErrorAction SilentlyContinue # -Scope Global
Get-Variable -Name Clean* -ErrorAction SilentlyContinue # -Scope Global
Get-Variable -Name ClientScript -ErrorAction SilentlyContinue # -Scope Global
Get-Variable -Name Command -ErrorAction SilentlyContinue # -Scope Global
Get-Variable -Name ContainsWord -ErrorAction SilentlyContinue # -Scope Global
Get-Variable -Name Date -ErrorAction SilentlyContinue # -Scope Global
Get-Variable -Name DesktopFolder -ErrorAction SilentlyContinue # -Scope Global
Get-Variable -Name Diagnostic -ErrorAction SilentlyContinue # -Scope Global
Get-Variable -Name Domain -ErrorAction SilentlyContinue # -Scope Global
Get-Variable -Name DOWN -ErrorAction SilentlyContinue # -Scope Global
Get-Variable -Name ElapsedTime -ErrorAction SilentlyContinue # -Scope Global
Get-Variable -Name File -ErrorAction SilentlyContinue # -Scope Global
Get-Variable -Name LogFolder -ErrorAction SilentlyContinue # -Scope Global
Get-Variable -Name MainScript -ErrorAction SilentlyContinue # -Scope Global
Get-Variable -Name ScriptFolder -ErrorAction SilentlyContinue # -Scope Global
Get-Variable -Name Server -ErrorAction SilentlyContinue # -Scope Global
Get-Variable -Name Service -ErrorAction SilentlyContinue # -Scope Global
Get-Variable -Name Service* -ErrorAction SilentlyContinue # -Scope Global
Get-Variable -Name ShareFolder -ErrorAction SilentlyContinue # -Scope Global
Get-Variable -Name StartTime -ErrorAction SilentlyContinue # -Scope Global
Get-Variable -Name State -ErrorAction SilentlyContinue # -Scope Global
Get-Variable -Name TEST -ErrorAction SilentlyContinue # -Scope Global
Get-Variable -Name Time -ErrorAction SilentlyContinue # -Scope Global
Get-Variable -Name TotalTime -ErrorAction SilentlyContinue # -Scope Global
Get-Variable -Name UP -ErrorAction SilentlyContinue # -Scope Global
Get-Variable -Name Wait -ErrorAction SilentlyContinue # -Scope Global
Get-Variable -Name Wait* -ErrorAction SilentlyContinue # -Scope Global
Get-Variable -Name MenuChoice* -ErrorAction SilentlyContinue

Write-Host "`n All QServices Script Variables listed"

## List all Variables ##
# Get-Variable -ErrorAction SilentlyContinue # -Scope Global

## End script
