
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

## Clean Variables ##
Remove-Variable -Name Admin -Scope Global -ErrorAction SilentlyContinue
Remove-Variable -Name Clean* -Scope Global -ErrorAction SilentlyContinue
Remove-Variable -Name ClientScript -Scope Global -ErrorAction SilentlyContinue
Remove-Variable -Name Command -Scope Global -ErrorAction SilentlyContinue
Remove-Variable -Name ContainsWord -Scope Global -ErrorAction SilentlyContinue
Remove-Variable -Name Date -Scope Global -ErrorAction SilentlyContinue
Remove-Variable -Name DesktopFolder -Scope Global -ErrorAction SilentlyContinue
Remove-Variable -Name Diagnostic -Scope Global -ErrorAction SilentlyContinue
Remove-Variable -Name Domain -Scope Global -ErrorAction SilentlyContinue
Remove-Variable -Name DOWN -Scope Global -ErrorAction SilentlyContinue
Remove-Variable -Name ElapsedTime -Scope Global -ErrorAction SilentlyContinue
Remove-Variable -Name File -Scope Global -ErrorAction SilentlyContinue
Remove-Variable -Name LogFolder -Scope Global -ErrorAction SilentlyContinue
Remove-Variable -Name MainScript -Scope Global -ErrorAction SilentlyContinue
Remove-Variable -Name ScriptFolder -Scope Global -ErrorAction SilentlyContinue
Remove-Variable -Name Server -Scope Global -ErrorAction SilentlyContinue
Remove-Variable -Name Service -Scope Global -ErrorAction SilentlyContinue
Remove-Variable -Name Service* -Scope Global -ErrorAction SilentlyContinue
Remove-Variable -Name ShareFolder -Scope Global -ErrorAction SilentlyContinue
Remove-Variable -Name StartTime -Scope Global -ErrorAction SilentlyContinue
Remove-Variable -Name State -Scope Global -ErrorAction SilentlyContinue
Remove-Variable -Name TEST -Scope Global -ErrorAction SilentlyContinue
Remove-Variable -Name Time -Scope Global -ErrorAction SilentlyContinue
Remove-Variable -Name TotalTime -Scope Global -ErrorAction SilentlyContinue
Remove-Variable -Name UP -Scope Global -ErrorAction SilentlyContinue
Remove-Variable -Name Wait -Scope Global -ErrorAction SilentlyContinue
Remove-Variable -Name Wait* -Scope Global -ErrorAction SilentlyContinue
Remove-Variable -Name MenuChoice* -Scope Global -ErrorAction SilentlyContinue

Write-Host "`nQServices Script Variables deleted"

# Get-Variable -Scope Global

## End script
