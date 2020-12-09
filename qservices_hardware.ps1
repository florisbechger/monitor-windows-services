
<#
.NOTES
    Author: Floris Bechger, Technisch Applicatie Beheerder Planning
	E-mail: floris.bechger@gvb.nl; floris.bechger@gmail.com
    Last Edit: 2020-11-06
    Version 1.0 - initial release of Quintiq Service Script
#>

## Find Hardware on Servers and print out results in text file

## Elevate privileges ##
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }

## Load and Store Folder Variables ##
. .\qservices_variables.ps1
Write-Host "$Admin $Domain $ShareFolder $DesktopFolder $ScriptFolder $LogFolder $Date $Time $StartTime"

## Start logging ##
Start-Transcript -Path $Admin\$DesktopFolder\$ScriptFolder\$LogFolder\$Server-$Date-hardware.log -Append

Write-Host "`n==== Hardware Summary on Server: '$Server' ===="

Write-Host "`nComputerName:"(get-wmiobject win32_computersystem).Name
Write-Host "ProcessorName:"(get-wmiobject win32_processor).Name
Write-Host "ProcessorCores:"(get-wmiobject win32_computersystem).NumberOfLogicalProcessors
Write-Host "CurrentClockSpeed:"(get-wmiobject win32_processor).CurrentClockSpeed
Write-Host "MaxClockSpeed:"(get-wmiobject win32_processor).MaxClockSpeed
Write-Host "TotalPhysicalMemory:"(get-wmiobject Win32_ComputerSystem).TotalPhysicalMemory
Write-Host "FreePhysicalMemory:"(get-wmiobject Win32_OperatingSystem).FreePhysicalMemory
Write-Host "LogicalDisk:"(get-wmiobject Win32_LogicalDisk).Size

$Hardware = Get-WmiObject -Class Win32_ComputerSystem -ComputerName $Server
$CPU = Get-WmiObject -Class Win32_Processor -ComputerName $Server
$OS = Get-WmiObject -Class Win32_OperatingSystem -ComputerName $Server
# $PhysicalMemory = Get-WmiObject -class "win32_physicalmemory" -namespace "root\CIMV2" -ComputerName $Server
$PhysicalMemory = Get-WmiObject -Class CIM_PhysicalMemory -ComputerName $Server
$Disk = Get-WmiObject -Class Win32_LogicalDisk -ComputerName $Server
# $BitLocker = Get-BitLockerVolume -ComputerName $Server
Try {
    $BitLocker = Get-BitLockerVolume -ComputerName $Server -ErrorAction Stop
}
Catch {
	Write-Host ""
    Write-Warning "BitLocker disabled"
	Write-Host ""
}

Write-Host "`n==== Detailed Properties on Server: '$Server' ===="

Write-Host "`nHardware:"
$Hardware | Format-Table DNSHostName,Domain,SystemType,Manufacturer,SystemFamily,Model,NumberOfLogicalProcessors,HypervisorPresent,Status

Write-Host "`nCPU:"
$CPU | Format-Table DeviceID,CurrentVoltage,CurrentClockSpeed,MaxClockSpeed,L2CacheSize,L3CacheSize,ErrorCleared,ErrorDescription,LastErrorCode,Status

Write-Host "`nOS:"
$OS | Format-Table OSArchitecture,BuildType,BuildNumber,Version,SerialNumber,@{n="TotalMemorySize(GB)";e={$_.TotalVisibleMemorySize/1MB}},@{n="FreeMemorySize(GB)";e={$_.FreePhysicalMemory/1MB}}

Write-Host "`nMemory:"
$PhysicalMemory | Format-Table Tag,BankLabel,@{n="Capacity(GB)";e={$_.Capacity/1GB}},DeviceLocator,Manufacturer,PartNumber,SerialNumber,Speed,ConfiguredClockSpeed,ConfiguredVoltage

Write-Host "`nDisk:"
$Disk | Format-Table Name,VolumeName,Description,FileSystem,@{n="DiskSize(GB)";e={$_.Size/1GB}},@{n="FreeSpace(GB)";e={$_.FreeSpace/1GB}},Quotas*

Write-Host "`nEncrypted Disk (BitLocker):"
$BitLocker | Format-Table ComputerName, MountPoint, EncryptionMethod, AutoUnlockEnabled, AutoUnlockKeyStored, MetadataVersion, VolumeStatus, ProtectionStatus, LockStatus

## Stop logging ##
Write-Host ""
Stop-Transcript

<#
$ComputerInfo = Get-ComputerInfo | Select WindowsInstallDateFromRegistry, OsInstallDate, OsUptime, BiosVersion, CsProcessors, CsNumberOfProcessors, CsNumberOfLogicalProcessors, OsProductType, OsArchitecture, OsName, CsSystemSKUNumber, OsProductSuites, OsNumberOfProcesses, OsSerialNumber, `
OsSuites, OsStatus, OsDataExecutionPreventionSupportPolicy, OsDataExecutionPreventionAvailable

Write-Host "`nComputerInfo:"
$ComputerInfo | Format-Table WindowsInstallDateFromRegistry, OsInstallDate, OsUptime, BiosVersion, CsProcessors, CsNumberOfProcessors, CsNumberOfLogicalProcessors, OsProductType, OsArchitecture, OsName, CsSystemSKUNumber, OsProductSuites, OsNumberOfProcesses, OsSerialNumber, `
OsSuites, OsStatus, OsDataExecutionPreventionSupportPolicy, OsDataExecutionPreventionAvailable
#>

## Return to Menu ##
# Invoke-Expression -Command "$Admin\$DesktopFolder\$ScriptFolder\menu_$Server.ps1"

## End script

