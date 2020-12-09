
<#
.SYNOPSIS
    Global Variables script to load into Client script

.NOTES
    Author: Floris Bechger
	E-mail: floris.bechger@gmail.com
    Last Edit: 2020-12-09
    Version 1.0 - initial release of Service Script
#>

Clear-Host

## Global variables ##

Set-Location C:\Users\[Username]\Desktop\qservices

$Admin = "C:\Users\[Username]"

$Domain = "..."
$ShareFolder = "TMP" # Not in use
$DesktopFolder = "Desktop"
$ScriptFolder = "qservices"
$LogFolder = "ServiceLogs"

$Date = Get-Date -format "yyyy-MM-dd"
$Time = Get-Date -format "HH:mm:ss"
$StartTime = $(get-date)
$maxRepeat = 200 # 200 * 600 Milliseconds = 120.000 Milliseconds = 120 seconds

# $Credential = Get-Credential $Admin@$Domain

## End script
