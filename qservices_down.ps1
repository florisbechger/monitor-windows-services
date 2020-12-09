
<#
.SYNOPSIS
    Controller script to Execute a Service State (Test/Start/Stop)

.DESCRIPTION
    This script is a Controller Script to trigger a specified action on a Windows Server for Quintiq Services to Test/Start/Stop Services. The File-name must be specified as "qservices_[test/up/down].ps1"

.NOTES
    Author: Floris Bechger, Technisch Applicatie Beheerder Planning
	E-mail: floris.bechger@gvb.nl; floris.bechger@gmail.com
    Last Edit: 2020-11-06
    Version 1.0 - initial release of Quintiq Service Script
#>

Clear-Host

## Elevate privileges ##
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }

## LogFolder check ##
$dir = "$Admin\$DesktopFolder\$ScriptFolder\$LogFolder"
if(!(Test-Path -Path $dir )){
    New-Item -ItemType directory -Path $dir
    Write-Host "`nCheck: LogFolder created"
    Write-Host ""
}
else
{
	Write-Host "`nCheck: LogFolder exists"
    Write-Host ""
}

## This loop will STOP all selected Services ##
$DOWN = {$stop = Get-Service -ComputerName "$Server" | Where-Object {$_.name -eq "$Service"}
if ($stop.status -eq "Running") {$stop.Stop()}

	do {
    $count1 = (Get-Service -ComputerName "$Server" | Where-Object {$_.name -eq "$Service"} | Where-Object {$_.status -eq "Running"}).count
    $maxRepeat--
    Start-Sleep -Milliseconds 600
    $count2 = (Get-Service -ComputerName "$Server" | Where-Object {$_.name -eq "$Service"} | Where-Object {$_.status -eq "StopPending"}).count
    $maxRepeat--
    Start-Sleep -Milliseconds 600
    $count3 = (Get-Service -ComputerName "$Server" | Where-Object {$_.name -eq "$Service"} | Where-Object {$_.status -eq "Stopped"}).count
    $maxRepeat--
    Start-Sleep -Milliseconds 600
	} until ($count1 -like 0 -and $count2 -like 0 -and $count3 -like 1 -or $maxRepeat -eq 0)
	Start-Sleep -s $Wait
	}

## Start logging ##
Start-Transcript -Path $Admin\$DesktopFolder\$ScriptFolder\$LogFolder\$Server-$Date-down.log -Append

## Time stamp ##
Write-Host "`n1. QServices Script executed on $Server at $Date $Time"

## Running State ##
$State = $DOWN
Write-Host "`n2. DOWN State selected, this will result in Services stopped:"

## Invoke script ##

## test

$ContainsWord = $File | ForEach-Object {$_ -match 'Service01'}
if ($ContainsWord -like $true) {
$Service = $Service01
$Wait = $Wait01
Invoke-Command $State
Get-Service -ComputerName "$Server" | Where-Object {$_.name -eq "$Service01"} | Select-Object MachineName, ServiceName, StartType, Status
} else {}

$ContainsWord = $File | ForEach-Object {$_ -match 'Service02'}
if ($ContainsWord -like $true) {
$Service = $Service02
$Wait = $Wait02
Invoke-Command $State
Get-Service -ComputerName "$Server" | Where-Object {$_.name -eq "$Service02"} | Select-Object MachineName, ServiceName, StartType, Status
} else {}

$ContainsWord = $File | ForEach-Object {$_ -match 'Service03'}
if ($ContainsWord -like $true) {
$Service = $Service03
$Wait = $Wait03
Invoke-Command $State
Get-Service -ComputerName "$Server" | Where-Object {$_.name -eq "$Service03"} | Select-Object MachineName, ServiceName, StartType, Status
} else {}

$ContainsWord = $File | ForEach-Object {$_ -match 'Service04'}
if ($ContainsWord -like $true) {
$Service = $Service04
$Wait = $Wait04
Invoke-Command $State
Get-Service -ComputerName "$Server" | Where-Object {$_.name -eq "$Service04"} | Select-Object MachineName, ServiceName, StartType, Status
} else {}

$ContainsWord = $File | ForEach-Object {$_ -match 'Service05'}
if ($ContainsWord -like $true) {
$Service = $Service05
$Wait = $Wait05
Invoke-Command $State
Get-Service -ComputerName "$Server" | Where-Object {$_.name -eq "$Service05"} | Select-Object MachineName, ServiceName, StartType, Status
} else {}

$ContainsWord = $File | ForEach-Object {$_ -match 'Service06'}
if ($ContainsWord -like $true) {
$Service = $Service06
$Wait = $Wait06
Invoke-Command $State
Get-Service -ComputerName "$Server" | Where-Object {$_.name -eq "$Service06"} | Select-Object MachineName, ServiceName, StartType, Status
} else {}

$ContainsWord = $File | ForEach-Object {$_ -match 'Service07'}
if ($ContainsWord -like $true) {
$Service = $Service07
$Wait = $Wait07
Invoke-Command $State
Get-Service -ComputerName "$Server" | Where-Object {$_.name -eq "$Service07"} | Select-Object MachineName, ServiceName, StartType, Status
} else {}

$ContainsWord = $File | ForEach-Object {$_ -match 'Service08'}
if ($ContainsWord -like $true) {
$Service = $Service08
$Wait = $Wait08
Invoke-Command $State
Get-Service -ComputerName "$Server" | Where-Object {$_.name -eq "$Service08"} | Select-Object MachineName, ServiceName, StartType, Status
} else {}

$ContainsWord = $File | ForEach-Object {$_ -match 'Service09'}
if ($ContainsWord -like $true) {
$Service = $Service09
$Wait = $Wait09
Invoke-Command $State
Get-Service -ComputerName "$Server" | Where-Object {$_.name -eq "$Service09"} | Select-Object MachineName, ServiceName, StartType, Status
} else {}

$ContainsWord = $File | ForEach-Object {$_ -match 'Service10'}
if ($ContainsWord -like $true) {
$Service = $Service10
$Wait = $Wait10
Invoke-Command $State
Get-Service -ComputerName "$Server" | Where-Object {$_.name -eq "$Service10"} | Select-Object MachineName, ServiceName, StartType, Status
} else {}

## wvrtqtqdvacc01

$ContainsWord = $File | ForEach-Object {$_ -match 'Service11'}
if ($ContainsWord -like $true) {
$Service = $Service11
$Wait = $Wait11
Invoke-Command $State
Get-Service -ComputerName "$Server" | Where-Object {$_.name -eq "$Service11"} | Select-Object MachineName, ServiceName, StartType, Status
} else {}

$ContainsWord = $File | ForEach-Object {$_ -match 'Service12'}
if ($ContainsWord -like $true) {
$Service = $Service12
$Wait = $Wait12
Invoke-Command $State
Get-Service -ComputerName "$Server" | Where-Object {$_.name -eq "$Service12"} | Select-Object MachineName, ServiceName, StartType, Status
} else {}

$ContainsWord = $File | ForEach-Object {$_ -match 'Service13'}
if ($ContainsWord -like $true) {
$Service = $Service13
$Wait = $Wait13
Invoke-Command $State
Get-Service -ComputerName "$Server" | Where-Object {$_.name -eq "$Service13"} | Select-Object MachineName, ServiceName, StartType, Status
} else {}

$ContainsWord = $File | ForEach-Object {$_ -match 'Service14'}
if ($ContainsWord -like $true) {
$Service = $Service14
$Wait = $Wait14
Invoke-Command $State
Get-Service -ComputerName "$Server" | Where-Object {$_.name -eq "$Service14"} | Select-Object MachineName, ServiceName, StartType, Status
} else {}

$ContainsWord = $File | ForEach-Object {$_ -match 'Service15'}
if ($ContainsWord -like $true) {
$Service = $Service15
$Wait = $Wait15
Invoke-Command $State
Get-Service -ComputerName "$Server" | Where-Object {$_.name -eq "$Service15"} | Select-Object MachineName, ServiceName, StartType, Status
} else {}

$ContainsWord = $File | ForEach-Object {$_ -match 'Service16'}
if ($ContainsWord -like $true) {
$Service = $Service16
$Wait = $Wait16
Invoke-Command $State
Get-Service -ComputerName "$Server" | Where-Object {$_.name -eq "$Service16"} | Select-Object MachineName, ServiceName, StartType, Status
} else {}

$ContainsWord = $File | ForEach-Object {$_ -match 'Service17'}
if ($ContainsWord -like $true) {
$Service = $Service17
$Wait = $Wait17
Invoke-Command $State
Get-Service -ComputerName "$Server" | Where-Object {$_.name -eq "$Service17"} | Select-Object MachineName, ServiceName, StartType, Status
} else {}

$ContainsWord = $File | ForEach-Object {$_ -match 'Service18'}
if ($ContainsWord -like $true) {
$Service = $Service18
$Wait = $Wait18
Invoke-Command $State
Get-Service -ComputerName "$Server" | Where-Object {$_.name -eq "$Service18"} | Select-Object MachineName, ServiceName, StartType, Status
} else {}

$ContainsWord = $File | ForEach-Object {$_ -match 'Service19'}
if ($ContainsWord -like $true) {
$Service = $Service19
$Wait = $Wait19
Invoke-Command $State
Get-Service -ComputerName "$Server" | Where-Object {$_.name -eq "$Service19"} | Select-Object MachineName, ServiceName, StartType, Status
} else {}

$ContainsWord = $File | ForEach-Object {$_ -match 'Service20'}
if ($ContainsWord -like $true) {
$Service = $Service20
$Wait = $Wait20
Invoke-Command $State
Get-Service -ComputerName "$Server" | Where-Object {$_.name -eq "$Service20"} | Select-Object MachineName, ServiceName, StartType, Status
} else {}

$ContainsWord = $File | ForEach-Object {$_ -match 'Service21'}
if ($ContainsWord -like $true) {
$Service = $Service21
$Wait = $Wait21
Invoke-Command $State
Get-Service -ComputerName "$Server" | Where-Object {$_.name -eq "$Service21"} | Select-Object MachineName, ServiceName, StartType, Status
} else {}

$ContainsWord = $File | ForEach-Object {$_ -match 'Service22'}
if ($ContainsWord -like $true) {
$Service = $Service22
$Wait = $Wait22
Invoke-Command $State
Get-Service -ComputerName "$Server" | Where-Object {$_.name -eq "$Service22"} | Select-Object MachineName, ServiceName, StartType, Status
} else {}

$ContainsWord = $File | ForEach-Object {$_ -match 'Service23'}
if ($ContainsWord -like $true) {
$Service = $Service23
$Wait = $Wait23
Invoke-Command $State
Get-Service -ComputerName "$Server" | Where-Object {$_.name -eq "$Service23"} | Select-Object MachineName, ServiceName, StartType, Status
} else {}

$ContainsWord = $File | ForEach-Object {$_ -match 'Service24'}
if ($ContainsWord -like $true) {
$Service = $Service24
$Wait = $Wait24
Invoke-Command $State
Get-Service -ComputerName "$Server" | Where-Object {$_.name -eq "$Service24"} | Select-Object MachineName, ServiceName, StartType, Status
} else {}

$ContainsWord = $File | ForEach-Object {$_ -match 'Service25'}
if ($ContainsWord -like $true) {
$Service = $Service25
$Wait = $Wait25
Invoke-Command $State
Get-Service -ComputerName "$Server" | Where-Object {$_.name -eq "$Service25"} | Select-Object MachineName, ServiceName, StartType, Status
} else {}

$ContainsWord = $File | ForEach-Object {$_ -match 'Service26'}
if ($ContainsWord -like $true) {
$Service = $Service26
$Wait = $Wait26
Invoke-Command $State
Get-Service -ComputerName "$Server" | Where-Object {$_.name -eq "$Service26"} | Select-Object MachineName, ServiceName, StartType, Status
} else {}

$ContainsWord = $File | ForEach-Object {$_ -match 'Service27'}
if ($ContainsWord -like $true) {
$Service = $Service27
$Wait = $Wait27
Invoke-Command $State
Get-Service -ComputerName "$Server" | Where-Object {$_.name -eq "$Service27"} | Select-Object MachineName, ServiceName, StartType, Status
} else {}

$ContainsWord = $File | ForEach-Object {$_ -match 'Service28'}
if ($ContainsWord -like $true) {
$Service = $Service28
$Wait = $Wait28
Invoke-Command $State
Get-Service -ComputerName "$Server" | Where-Object {$_.name -eq "$Service28"} | Select-Object MachineName, ServiceName, StartType, Status
} else {}

$ContainsWord = $File | ForEach-Object {$_ -match 'Service29'}
if ($ContainsWord -like $true) {
$Service = $Service29
$Wait = $Wait29
Invoke-Command $State
Get-Service -ComputerName "$Server" | Where-Object {$_.name -eq "$Service29"} | Select-Object MachineName, ServiceName, StartType, Status
} else {}

$ContainsWord = $File | ForEach-Object {$_ -match 'Service30'}
if ($ContainsWord -like $true) {
$Service = $Service30
$Wait = $Wait30
Invoke-Command $State
Get-Service -ComputerName "$Server" | Where-Object {$_.name -eq "$Service30"} | Select-Object MachineName, ServiceName, StartType, Status
} else {}

## wvrtqtqdvacc02

$ContainsWord = $File | ForEach-Object {$_ -match 'Service31'}
if ($ContainsWord -like $true) {
$Service = $Service31
$Wait = $Wait31
Invoke-Command $State
Get-Service -ComputerName "$Server" | Where-Object {$_.name -eq "$Service31"} | Select-Object MachineName, ServiceName, StartType, Status
} else {}

$ContainsWord = $File | ForEach-Object {$_ -match 'Service32'}
if ($ContainsWord -like $true) {
$Service = $Service32
$Wait = $Wait32
Invoke-Command $State
Get-Service -ComputerName "$Server" | Where-Object {$_.name -eq "$Service32"} | Select-Object MachineName, ServiceName, StartType, Status
} else {}

$ContainsWord = $File | ForEach-Object {$_ -match 'Service33'}
if ($ContainsWord -like $true) {
$Service = $Service33
$Wait = $Wait33
Invoke-Command $State
Get-Service -ComputerName "$Server" | Where-Object {$_.name -eq "$Service33"} | Select-Object MachineName, ServiceName, StartType, Status
} else {}

$ContainsWord = $File | ForEach-Object {$_ -match 'Service34'}
if ($ContainsWord -like $true) {
$Service = $Service34
$Wait = $Wait34
Invoke-Command $State
Get-Service -ComputerName "$Server" | Where-Object {$_.name -eq "$Service34"} | Select-Object MachineName, ServiceName, StartType, Status
} else {}

$ContainsWord = $File | ForEach-Object {$_ -match 'Service35'}
if ($ContainsWord -like $true) {
$Service = $Service35
$Wait = $Wait35
Invoke-Command $State
Get-Service -ComputerName "$Server" | Where-Object {$_.name -eq "$Service35"} | Select-Object MachineName, ServiceName, StartType, Status
} else {}

$ContainsWord = $File | ForEach-Object {$_ -match 'Service36'}
if ($ContainsWord -like $true) {
$Service = $Service36
$Wait = $Wait36
Invoke-Command $State
Get-Service -ComputerName "$Server" | Where-Object {$_.name -eq "$Service36"} | Select-Object MachineName, ServiceName, StartType, Status
} else {}

$ContainsWord = $File | ForEach-Object {$_ -match 'Service37'}
if ($ContainsWord -like $true) {
$Service = $Service37
$Wait = $Wait37
Invoke-Command $State
Get-Service -ComputerName "$Server" | Where-Object {$_.name -eq "$Service37"} | Select-Object MachineName, ServiceName, StartType, Status
} else {}

$ContainsWord = $File | ForEach-Object {$_ -match 'Service38'}
if ($ContainsWord -like $true) {
$Service = $Service38
$Wait = $Wait38
Invoke-Command $State
Get-Service -ComputerName "$Server" | Where-Object {$_.name -eq "$Service38"} | Select-Object MachineName, ServiceName, StartType, Status
} else {}

$ContainsWord = $File | ForEach-Object {$_ -match 'Service39'}
if ($ContainsWord -like $true) {
$Service = $Service39
$Wait = $Wait39
Invoke-Command $State
Get-Service -ComputerName "$Server" | Where-Object {$_.name -eq "$Service39"} | Select-Object MachineName, ServiceName, StartType, Status
} else {}

$ContainsWord = $File | ForEach-Object {$_ -match 'Service40'}
if ($ContainsWord -like $true) {
$Service = $Service40
$Wait = $Wait40
Invoke-Command $State
Get-Service -ComputerName "$Server" | Where-Object {$_.name -eq "$Service40"} | Select-Object MachineName, ServiceName, StartType, Status
} else {}

$ContainsWord = $File | ForEach-Object {$_ -match 'Service41'}
if ($ContainsWord -like $true) {
$Service = $Service41
$Wait = $Wait41
Invoke-Command $State
Get-Service -ComputerName "$Server" | Where-Object {$_.name -eq "$Service41"} | Select-Object MachineName, ServiceName, StartType, Status
} else {}

$ContainsWord = $File | ForEach-Object {$_ -match 'Service42'}
if ($ContainsWord -like $true) {
$Service = $Service42
$Wait = $Wait42
Invoke-Command $State
Get-Service -ComputerName "$Server" | Where-Object {$_.name -eq "$Service42"} | Select-Object MachineName, ServiceName, StartType, Status
} else {}

$ContainsWord = $File | ForEach-Object {$_ -match 'Service43'}
if ($ContainsWord -like $true) {
$Service = $Service43
$Wait = $Wait43
Invoke-Command $State
Get-Service -ComputerName "$Server" | Where-Object {$_.name -eq "$Service43"} | Select-Object MachineName, ServiceName, StartType, Status
} else {}

$ContainsWord = $File | ForEach-Object {$_ -match 'Service44'}
if ($ContainsWord -like $true) {
$Service = $Service44
$Wait = $Wait44
Invoke-Command $State
Get-Service -ComputerName "$Server" | Where-Object {$_.name -eq "$Service44"} | Select-Object MachineName, ServiceName, StartType, Status
} else {}

$ContainsWord = $File | ForEach-Object {$_ -match 'Service45'}
if ($ContainsWord -like $true) {
$Service = $Service45
$Wait = $Wait45
Invoke-Command $State
Get-Service -ComputerName "$Server" | Where-Object {$_.name -eq "$Service45"} | Select-Object MachineName, ServiceName, StartType, Status
} else {}

$ContainsWord = $File | ForEach-Object {$_ -match 'Service46'}
if ($ContainsWord -like $true) {
$Service = $Service46
$Wait = $Wait46
Invoke-Command $State
Get-Service -ComputerName "$Server" | Where-Object {$_.name -eq "$Service46"} | Select-Object MachineName, ServiceName, StartType, Status
} else {}

$ContainsWord = $File | ForEach-Object {$_ -match 'Service47'}
if ($ContainsWord -like $true) {
$Service = $Service47
$Wait = $Wait47
Invoke-Command $State
Get-Service -ComputerName "$Server" | Where-Object {$_.name -eq "$Service47"} | Select-Object MachineName, ServiceName, StartType, Status
} else {}

$ContainsWord = $File | ForEach-Object {$_ -match 'Service48'}
if ($ContainsWord -like $true) {
$Service = $Service48
$Wait = $Wait48
Invoke-Command $State
Get-Service -ComputerName "$Server" | Where-Object {$_.name -eq "$Service48"} | Select-Object MachineName, ServiceName, StartType, Status
} else {}

$ContainsWord = $File | ForEach-Object {$_ -match 'Service49'}
if ($ContainsWord -like $true) {
$Service = $Service49
$Wait = $Wait49
Invoke-Command $State
Get-Service -ComputerName "$Server" | Where-Object {$_.name -eq "$Service49"} | Select-Object MachineName, ServiceName, StartType, Status
} else {}

$ContainsWord = $File | ForEach-Object {$_ -match 'Service50'}
if ($ContainsWord -like $true) {
$Service = $Service50
$Wait = $Wait50
Invoke-Command $State
Get-Service -ComputerName "$Server" | Where-Object {$_.name -eq "$Service50"} | Select-Object MachineName, ServiceName, StartType, Status
} else {}

## wvrtqtqindaacc

$ContainsWord = $File | ForEach-Object {$_ -match 'Service51'}
if ($ContainsWord -like $true) {
$Service = $Service51
$Wait = $Wait51
Invoke-Command $State
Get-Service -ComputerName "$Server" | Where-Object {$_.name -eq "$Service51"} | Select-Object MachineName, ServiceName, StartType, Status
} else {}

$ContainsWord = $File | ForEach-Object {$_ -match 'Service52'}
if ($ContainsWord -like $true) {
$Service = $Service52
$Wait = $Wait52
Invoke-Command $State
Get-Service -ComputerName "$Server" | Where-Object {$_.name -eq "$Service52"} | Select-Object MachineName, ServiceName, StartType, Status
} else {}

$ContainsWord = $File | ForEach-Object {$_ -match 'Service53'}
if ($ContainsWord -like $true) {
$Service = $Service53
$Wait = $Wait53
Invoke-Command $State
Get-Service -ComputerName "$Server" | Where-Object {$_.name -eq "$Service53"} | Select-Object MachineName, ServiceName, StartType, Status
} else {}

$ContainsWord = $File | ForEach-Object {$_ -match 'Service54'}
if ($ContainsWord -like $true) {
$Service = $Service54
$Wait = $Wait54
Invoke-Command $State
Get-Service -ComputerName "$Server" | Where-Object {$_.name -eq "$Service54"} | Select-Object MachineName, ServiceName, StartType, Status
} else {}

$ContainsWord = $File | ForEach-Object {$_ -match 'Service55'}
if ($ContainsWord -like $true) {
$Service = $Service55
$Wait = $Wait55
Invoke-Command $State
Get-Service -ComputerName "$Server" | Where-Object {$_.name -eq "$Service55"} | Select-Object MachineName, ServiceName, StartType, Status
} else {}

$ContainsWord = $File | ForEach-Object {$_ -match 'Service56'}
if ($ContainsWord -like $true) {
$Service = $Service56
$Wait = $Wait56
Invoke-Command $State
Get-Service -ComputerName "$Server" | Where-Object {$_.name -eq "$Service56"} | Select-Object MachineName, ServiceName, StartType, Status
} else {}

$ContainsWord = $File | ForEach-Object {$_ -match 'Service57'}
if ($ContainsWord -like $true) {
$Service = $Service57
$Wait = $Wait57
Invoke-Command $State
Get-Service -ComputerName "$Server" | Where-Object {$_.name -eq "$Service57"} | Select-Object MachineName, ServiceName, StartType, Status
} else {}

$ContainsWord = $File | ForEach-Object {$_ -match 'Service58'}
if ($ContainsWord -like $true) {
$Service = $Service58
$Wait = $Wait58
Invoke-Command $State
Get-Service -ComputerName "$Server" | Where-Object {$_.name -eq "$Service58"} | Select-Object MachineName, ServiceName, StartType, Status
} else {}

$ContainsWord = $File | ForEach-Object {$_ -match 'Service59'}
if ($ContainsWord -like $true) {
$Service = $Service59
$Wait = $Wait59
Invoke-Command $State
Get-Service -ComputerName "$Server" | Where-Object {$_.name -eq "$Service59"} | Select-Object MachineName, ServiceName, StartType, Status
} else {}

$ContainsWord = $File | ForEach-Object {$_ -match 'Service60'}
if ($ContainsWord -like $true) {
$Service = $Service60
$Wait = $Wait60
Invoke-Command $State
Get-Service -ComputerName "$Server" | Where-Object {$_.name -eq "$Service60"} | Select-Object MachineName, ServiceName, StartType, Status
} else {}

$ContainsWord = $File | ForEach-Object {$_ -match 'Service61'}
if ($ContainsWord -like $true) {
$Service = $Service61
$Wait = $Wait61
Invoke-Command $State
Get-Service -ComputerName "$Server" | Where-Object {$_.name -eq "$Service61"} | Select-Object MachineName, ServiceName, StartType, Status
} else {}

$ContainsWord = $File | ForEach-Object {$_ -match 'Service62'}
if ($ContainsWord -like $true) {
$Service = $Service62
$Wait = $Wait62
Invoke-Command $State
Get-Service -ComputerName "$Server" | Where-Object {$_.name -eq "$Service62"} | Select-Object MachineName, ServiceName, StartType, Status
} else {}

$ContainsWord = $File | ForEach-Object {$_ -match 'Service63'}
if ($ContainsWord -like $true) {
$Service = $Service63
$Wait = $Wait63
Invoke-Command $State
Get-Service -ComputerName "$Server" | Where-Object {$_.name -eq "$Service63"} | Select-Object MachineName, ServiceName, StartType, Status
} else {}

$ContainsWord = $File | ForEach-Object {$_ -match 'Service64'}
if ($ContainsWord -like $true) {
$Service = $Service64
$Wait = $Wait64
Invoke-Command $State
Get-Service -ComputerName "$Server" | Where-Object {$_.name -eq "$Service64"} | Select-Object MachineName, ServiceName, StartType, Status
} else {}

$ContainsWord = $File | ForEach-Object {$_ -match 'Service65'}
if ($ContainsWord -like $true) {
$Service = $Service65
$Wait = $Wait65
Invoke-Command $State
Get-Service -ComputerName "$Server" | Where-Object {$_.name -eq "$Service65"} | Select-Object MachineName, ServiceName, StartType, Status
} else {}

$ContainsWord = $File | ForEach-Object {$_ -match 'Service66'}
if ($ContainsWord -like $true) {
$Service = $Service66
$Wait = $Wait66
Invoke-Command $State
Get-Service -ComputerName "$Server" | Where-Object {$_.name -eq "$Service66"} | Select-Object MachineName, ServiceName, StartType, Status
} else {}

$ContainsWord = $File | ForEach-Object {$_ -match 'Service67'}
if ($ContainsWord -like $true) {
$Service = $Service67
$Wait = $Wait67
Invoke-Command $State
Get-Service -ComputerName "$Server" | Where-Object {$_.name -eq "$Service67"} | Select-Object MachineName, ServiceName, StartType, Status
} else {}

$ContainsWord = $File | ForEach-Object {$_ -match 'Service68'}
if ($ContainsWord -like $true) {
$Service = $Service68
$Wait = $Wait68
Invoke-Command $State
Get-Service -ComputerName "$Server" | Where-Object {$_.name -eq "$Service68"} | Select-Object MachineName, ServiceName, StartType, Status
} else {}

$ContainsWord = $File | ForEach-Object {$_ -match 'Service69'}
if ($ContainsWord -like $true) {
$Service = $Service69
$Wait = $Wait69
Invoke-Command $State
Get-Service -ComputerName "$Server" | Where-Object {$_.name -eq "$Service69"} | Select-Object MachineName, ServiceName, StartType, Status
} else {}

$ContainsWord = $File | ForEach-Object {$_ -match 'Service70'}
if ($ContainsWord -like $true) {
$Service = $Service70
$Wait = $Wait70
Invoke-Command $State
Get-Service -ComputerName "$Server" | Where-Object {$_.name -eq "$Service70"} | Select-Object MachineName, ServiceName, StartType, Status
} else {}

## ...

$ContainsWord = $File | ForEach-Object {$_ -match 'Service71'}
if ($ContainsWord -like $true) {
$Service = $Service71
$Wait = $Wait71
Invoke-Command $State
Get-Service -ComputerName "$Server" | Where-Object {$_.name -eq "$Service71"} | Select-Object MachineName, ServiceName, StartType, Status
} else {}

$ContainsWord = $File | ForEach-Object {$_ -match 'Service72'}
if ($ContainsWord -like $true) {
$Service = $Service72
$Wait = $Wait72
Invoke-Command $State
Get-Service -ComputerName "$Server" | Where-Object {$_.name -eq "$Service72"} | Select-Object MachineName, ServiceName, StartType, Status
} else {}

$ContainsWord = $File | ForEach-Object {$_ -match 'Service73'}
if ($ContainsWord -like $true) {
$Service = $Service73
$Wait = $Wait73
Invoke-Command $State
Get-Service -ComputerName "$Server" | Where-Object {$_.name -eq "$Service73"} | Select-Object MachineName, ServiceName, StartType, Status
} else {}

$ContainsWord = $File | ForEach-Object {$_ -match 'Service74'}
if ($ContainsWord -like $true) {
$Service = $Service74
$Wait = $Wait74
Invoke-Command $State
Get-Service -ComputerName "$Server" | Where-Object {$_.name -eq "$Service74"} | Select-Object MachineName, ServiceName, StartType, Status
} else {}

$ContainsWord = $File | ForEach-Object {$_ -match 'Service75'}
if ($ContainsWord -like $true) {
$Service = $Service75
$Wait = $Wait75
Invoke-Command $State
Get-Service -ComputerName "$Server" | Where-Object {$_.name -eq "$Service75"} | Select-Object MachineName, ServiceName, StartType, Status
} else {}

$ContainsWord = $File | ForEach-Object {$_ -match 'Service76'}
if ($ContainsWord -like $true) {
$Service = $Service76
$Wait = $Wait76
Invoke-Command $State
Get-Service -ComputerName "$Server" | Where-Object {$_.name -eq "$Service76"} | Select-Object MachineName, ServiceName, StartType, Status
} else {}

$ContainsWord = $File | ForEach-Object {$_ -match 'Service77'}
if ($ContainsWord -like $true) {
$Service = $Service77
$Wait = $Wait77
Invoke-Command $State
Get-Service -ComputerName "$Server" | Where-Object {$_.name -eq "$Service77"} | Select-Object MachineName, ServiceName, StartType, Status
} else {}

$ContainsWord = $File | ForEach-Object {$_ -match 'Service78'}
if ($ContainsWord -like $true) {
$Service = $Service78
$Wait = $Wait78
Invoke-Command $State
Get-Service -ComputerName "$Server" | Where-Object {$_.name -eq "$Service78"} | Select-Object MachineName, ServiceName, StartType, Status
} else {}

$ContainsWord = $File | ForEach-Object {$_ -match 'Service79'}
if ($ContainsWord -like $true) {
$Service = $Service79
$Wait = $Wait79
Invoke-Command $State
Get-Service -ComputerName "$Server" | Where-Object {$_.name -eq "$Service79"} | Select-Object MachineName, ServiceName, StartType, Status
} else {}

$ContainsWord = $File | ForEach-Object {$_ -match 'Service80'}
if ($ContainsWord -like $true) {
$Service = $Service80
$Wait = $Wait80
Invoke-Command $State
Get-Service -ComputerName "$Server" | Where-Object {$_.name -eq "$Service80"} | Select-Object MachineName, ServiceName, StartType, Status
} else {}

## Elapsed Time print ##
Write-Host "`n3. QServices Script completed!"
$ElapsedTime = $(get-date) - $StartTime
$TotalTime = "{0:HH:mm:ss}" -f ([datetime]$ElapsedTime.Ticks)
Write-Host "`n4. Total runtime on $Server took $TotalTime"

## Stop logging ##
Write-Host ""
Stop-Transcript

## Run Test Script ##
# Invoke-Expression -Command "$Admin\$DesktopFolder\$ScriptFolder\qservices_test.ps1"

## Mail Log ##
# Invoke-Expression -Command "$Admin\$DesktopFolder\$ScriptFolder\qservices_mail.ps1"

## Show Log ##
# Invoke-Expression -Command "$Admin\$DesktopFolder\$ScriptFolder\qservices_files.ps1"

## Return to Menu ##
# Invoke-Expression -Command "$Admin\$DesktopFolder\$ScriptFolder\menu_$Server.ps1"

## End script
