
<#
.NOTES
    Author: Floris Bechger, Technisch Applicatie Beheerder Planning
	E-mail: floris.bechger@gvb.nl; floris.bechger@gmail.com
    Last Edit: 2020-11-06
    Version 1.0 - initial release of Quintiq Service Script
#>

## Find QInda-Services on Servers and print out results in text file

## Elevate privileges ##
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }

## Load and Store Folder Variables ##
. .\qservices_variables.ps1
Write-Host "$Admin $Domain $ShareFolder $DesktopFolder $ScriptFolder $LogFolder $Date $Time $StartTime"

$Path = "$Admin\$DesktopFolder\$ScriptFolder\$LogFolder"

$Server = 'WALWQTQINDATST' # (DR/IS/RE/DV)
(get-wmiobject win32_computersystem).Name | Out-File $Path\$Server-QServices.txt -append
# Write-Host "`nProcesses:" | Out-File $Path\$Server-QServices.txt -append
# Get-Process | Where-Object {$_.ProcessName -match "dr_" -or $_.ProcessName -match "dv_" -or $_.ProcessName -match "is_" -or $_.ProcessName -match "re_" -or $_.ProcessName -match "inda_"} | Out-File $Path\$Server-QServices.txt -append
Write-Host "`nServices:" | Out-File $Path\$Server-QServices.txt -append
Get-Service -ComputerName "$Server" -name dr_* | Select-Object ServiceName, DisplayName, Status | Out-File $Path\$Server-QServices.txt -append
Get-Service -ComputerName "$Server" -name dv_* | Select-Object ServiceName, DisplayName, Status | Out-File $Path\$Server-QServices.txt -append
Get-Service -ComputerName "$Server" -name is_* | Select-Object ServiceName, DisplayName, Status | Out-File $Path\$Server-QServices.txt -append
Get-Service -ComputerName "$Server" -name re_* | Select-Object ServiceName, DisplayName, Status | Out-File $Path\$Server-QServices.txt -append
Get-Service -ComputerName "$Server" -name inda_* | Select-Object ServiceName, DisplayName, Status | Out-File $Path\$Server-QServices.txt -append

$Server = 'WVRTQTQINDAACC' # (INDA)
(get-wmiobject win32_computersystem).Name | Out-File $Path\$Server-QServices.txt -append
# Write-Host "`nProcesses:" | Out-File $Path\$Server-QServices.txt -append
# Get-Process | Where-Object {$_.ProcessName -match "dr_" -or $_.ProcessName -match "dv_" -or $_.ProcessName -match "is_" -or $_.ProcessName -match "re_" -or $_.ProcessName -match "inda_"} | Out-File $Path\$Server-QServices.txt -append
Write-Host "`nServices:" | Out-File $Path\$Server-QServices.txt -append
Get-Service -ComputerName "$Server" -name dr_* | Select-Object ServiceName, DisplayName, Status | Out-File $Path\$Server-QServices.txt -append
Get-Service -ComputerName "$Server" -name dv_* | Select-Object ServiceName, DisplayName, Status | Out-File $Path\$Server-QServices.txt -append
Get-Service -ComputerName "$Server" -name is_* | Select-Object ServiceName, DisplayName, Status | Out-File $Path\$Server-QServices.txt -append
Get-Service -ComputerName "$Server" -name re_* | Select-Object ServiceName, DisplayName, Status | Out-File $Path\$Server-QServices.txt -append
Get-Service -ComputerName "$Server" -name inda_* | Select-Object ServiceName, DisplayName, Status | Out-File $Path\$Server-QServices.txt -append

$Server = 'WVRTQTQDVACC01' # (DR/IS/RE)
(get-wmiobject win32_computersystem).Name | Out-File $Path\$Server-QServices.txt -append
# Write-Host "`nProcesses:" | Out-File $Path\$Server-QServices.txt -append
# Get-Process | Where-Object {$_.ProcessName -match "dr_" -or $_.ProcessName -match "dv_" -or $_.ProcessName -match "is_" -or $_.ProcessName -match "re_" -or $_.ProcessName -match "inda_"} | Out-File $Path\$Server-QServices.txt -append
Write-Host "`nServices:" | Out-File $Path\$Server-QServices.txt -append
Get-Service -ComputerName "$Server" -name dr_* | Select-Object ServiceName, DisplayName, Status | Out-File $Path\$Server-QServices.txt -append
Get-Service -ComputerName "$Server" -name dv_* | Select-Object ServiceName, DisplayName, Status | Out-File $Path\$Server-QServices.txt -append
Get-Service -ComputerName "$Server" -name is_* | Select-Object ServiceName, DisplayName, Status | Out-File $Path\$Server-QServices.txt -append
Get-Service -ComputerName "$Server" -name re_* | Select-Object ServiceName, DisplayName, Status | Out-File $Path\$Server-QServices.txt -append
Get-Service -ComputerName "$Server" -name inda_* | Select-Object ServiceName, DisplayName, Status | Out-File $Path\$Server-QServices.txt -append

$Server = 'WVRTQTQDVACC02' # (DV)
(get-wmiobject win32_computersystem).Name | Out-File $Path\$Server-QServices.txt -append
# Write-Host "`nProcesses:" | Out-File $Path\$Server-QServices.txt -append
# Get-Process | Where-Object {$_.ProcessName -match "dr_" -or $_.ProcessName -match "dv_" -or $_.ProcessName -match "is_" -or $_.ProcessName -match "re_" -or $_.ProcessName -match "inda_"} | Out-File $Path\$Server-QServices.txt -append
Write-Host "`nServices:" | Out-File $Path\$Server-QServices.txt -append
Get-Service -ComputerName "$Server" -name dr_* | Select-Object ServiceName, DisplayName, Status | Out-File $Path\$Server-QServices.txt -append
Get-Service -ComputerName "$Server" -name dv_* | Select-Object ServiceName, DisplayName, Status | Out-File $Path\$Server-QServices.txt -append
Get-Service -ComputerName "$Server" -name is_* | Select-Object ServiceName, DisplayName, Status | Out-File $Path\$Server-QServices.txt -append
Get-Service -ComputerName "$Server" -name re_* | Select-Object ServiceName, DisplayName, Status | Out-File $Path\$Server-QServices.txt -append
Get-Service -ComputerName "$Server" -name inda_* | Select-Object ServiceName, DisplayName, Status | Out-File $Path\$Server-QServices.txt -append

## Return to Menu ##
# Invoke-Expression -Command "$Admin\$DesktopFolder\$ScriptFolder\menu_main.ps1"

## End script
