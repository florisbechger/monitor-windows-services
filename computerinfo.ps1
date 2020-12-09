
Write-Host ""
Write-Host "ComputerName:"
(get-wmiobject win32_computersystem).Name
Write-Host ""
Write-Host "ProcessorName:"
(get-wmiobject win32_processor).Name
Write-Host ""
Write-Host "CurrentClockSpeed:"
(get-wmiobject win32_processor).CurrentClockSpeed
Write-Host ""
Write-Host "MaxClockSpeed:"
(get-wmiobject win32_processor).MaxClockSpeed
Write-Host ""
Write-Host "TotalPhysicalMemory:"
(get-wmiobject Win32_ComputerSystem).TotalPhysicalMemory / 1GB
Write-Host ""
Write-Host "FreePhysicalMemory:"
(get-wmiobject Win32_OperatingSystem).FreePhysicalMemory / 1MB
Write-Host ""