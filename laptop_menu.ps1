
<#
.SYNOPSIS
    Menu script (Change Set-Location to the default folder of your choice)

.NOTES
    Author: Floris Bechger
	E-mail: floris.bechger@gmail.com
    Last Edit: 2020-12-09
    Version 1.0 - initial release of Service Script
#>

Clear-Host

## Location variables ##

# Set-Location C:\Users\[username]\Desktop\qservices

## Elevate privileges ##
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }

## Load Global Variables ##
. .\qservices_variables.ps1
Write-Host "$Admin $Domain $ShareFolder $DesktopFolder $ScriptFolder $LogFolder $Date $Time $StartTime"

## Set Server Variable ##
$Server = "laptopf"

## Initial Menu ##

[int]$MenuChoice = 0
while ( $MenuChoice -lt 1 -or $MenuChoice -gt 9 ){

Clear-Host

Write-host "`n -- QServices Script --"
Write-host "`n Laptop Server menu (Select one of these options to test, start or stop services):"
Write-host ""
Write-host " WARNING: Selected choice will run immediately!"
Write-host ""
Write-host " 1. Laptop Services Test"
Write-host " 2. Laptop Services UP"
Write-host " 3. Laptop Services Down"
Write-host ""
Write-host " 4. Open LogFolder"
Write-host " 5. Check Hardware"
Write-host " 6. Check Hotfixes"
Write-host ""
Write-host " 7. Get Qservice Variables"
Write-host " 8. Clean Qservice Variables"

[int]$MenuChoice = read-host "`n Enter option 1 to 8 ..."
}

Switch( $MenuChoice ){
  1{Invoke-Expression -Command "$Admin\$DesktopFolder\$ScriptFolder\laptop_test.ps1"}
  2{Invoke-Expression -Command "$Admin\$DesktopFolder\$ScriptFolder\laptop_up.ps1"}
  3{Invoke-Expression -Command "$Admin\$DesktopFolder\$ScriptFolder\laptop_down.ps1"}
  4{Invoke-Item "$Admin\$DesktopFolder\$ScriptFolder\$LogFolder"}
  5{Invoke-Expression -Command "$Admin\$DesktopFolder\$ScriptFolder\qservices_hardware.ps1"}
  6{Invoke-Expression -Command "$Admin\$DesktopFolder\$ScriptFolder\qservices_hotfix.ps1"}
  7{Invoke-Expression -Command "$Admin\$DesktopFolder\$ScriptFolder\qservices_scope.ps1"}
  8{Invoke-Expression -Command "$Admin\$DesktopFolder\$ScriptFolder\qservices_clean.ps1"}
default{Write-host "`n Enter option 1 to 8 ..."}
}

## End script
