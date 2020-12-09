Clear-Host

$Server = 'laptop'

Write-Host ""
Write-Host "==== Summary on Server: '$Server' ===="

Write-Host ""
Write-Host "ComputerName:"
(get-wmiobject win32_computersystem).Name
Write-Host "ProcessorName:"
(get-wmiobject win32_processor).Name
Write-Host "CurrentClockSpeed (GHz):"
(get-wmiobject win32_processor).CurrentClockSpeed
Write-Host "MaxClockSpeed (GHz):"
(get-wmiobject win32_processor).MaxClockSpeed
Write-Host "TotalPhysicalMemory (GB):"
(get-wmiobject Win32_ComputerSystem).TotalPhysicalMemory / 1GB
Write-Host "FreePhysicalMemory (GB):"
(get-wmiobject Win32_OperatingSystem).FreePhysicalMemory / 1MB
Write-Host "LogicalDisk (GB):"
(get-wmiobject Win32_LogicalDisk).Size / 1GB
Write-Host ""

$Hardware = Get-WmiObject -Class Win32_ComputerSystem -ComputerName $Server
$CPU = Get-WmiObject -Class Win32_Processor -ComputerName $Server
$OS = Get-WmiObject -Class Win32_OperatingSystem -ComputerName $Server
# $PhysicalMemory = Get-WmiObject -class "win32_physicalmemory" -namespace "root\CIMV2" -ComputerName $Server
$PhysicalMemory = Get-WmiObject -Class CIM_PhysicalMemory -ComputerName $Server
$Disk = Get-WmiObject -Class Win32_LogicalDisk -ComputerName $Server

Write-Host "==== Detailed Properties on Server: '$Server' ===="
Write-Host ""

Write-Host "Hardware:"
$Hardware | Format-Table DNSHostName,Domain,SystemType,Manufacturer,SystemFamily,Model,NumberOfLogicalProcessors,HypervisorPresent,Status

Write-Host "CPU:"
$CPU | Format-Table DeviceID,CurrentVoltage,CurrentClockSpeed,MaxClockSpeed,L2CacheSize,L3CacheSize,ErrorCleared,ErrorDescription,LastErrorCode,Status

Write-Host "OS:"
$OS | Format-Table OSArchitecture,BuildType,BuildNumber,Version,SerialNumber,@{n="TotalMemorySize(GB)";e={$_.TotalVisibleMemorySize/1MB}},@{n="FreeMemorySize(GB)";e={$_.FreePhysicalMemory/1MB}}

Write-Host "Memory:"
$PhysicalMemory | Format-Table Tag,BankLabel,@{n="Capacity(GB)";e={$_.Capacity/1GB}},DeviceLocator,Manufacturer,PartNumber,SerialNumber,Speed,ConfiguredClockSpeed,ConfiguredVoltage

Write-Host "Disk:"
$Disk | Format-Table Name,VolumeName,Description,FileSystem,@{n="DiskSize(GB)";e={$_.Size/1GB}},@{n="FreeSpace(GB)";e={$_.FreeSpace/1GB}},Quotas*

<#

# To get a list of installed software:
$Installed = Get-WmiObject -Class Win32_Product -ComputerName $Server

 On Windows Server 2003, Windows Vista, and newer operating systems,
   querying Win32_Product will trigger Windows Installer to perform
   a consistency check to verify the health of the application.
   This consistency check could cause a repair installation to occur.

# "Programs:"
# $Installed | Format-Table Name,Vendor,Version,Caption

# Alternatives:

# Get-WmiObject -Class Win32_ComputerSystem -ComputerName $Server | Format-Table DNSHostName,Domain,SystemType,Manufacturer,SystemFamily,Model,NumberOfLogicalProcessors,HypervisorPresent,Status
# Get-WmiObject -Class Win32_Processor -ComputerName $Server | Format-Table DeviceID,CurrentVoltage,MaxClockSpeed,L2CacheSize,L3CacheSize,ErrorCleared,ErrorDescription,LastErrorCode,Status
# Get-WmiObject -Class CIM_PhysicalMemory -ComputerName $Server | Format-Table BankLabel,Capacity,Speed,DeviceLocator,Manufacturer,PartNumber,SerialNumber,ConfiguredClockSpeed,ConfiguredVoltage # HotSwappable
# Get-WmiObject -Class Win32_LogicalDisk -Filter "DriveType=3" -ComputerName $Server | Format-Table Name,VolumeName,Description,FileSystem,Quotas*,Size,FreeSpace
# Get-WmiObject -Class Win32_OperatingSystem -ComputerName $Server | Format-Table OSArchitecture,BuildType,BuildNumber,Version,SerialNumber,TotalVisibleMemorySize,FreePhysicalMemory # ServicePackMajorVersion,ServicePackMinorVersion

#>