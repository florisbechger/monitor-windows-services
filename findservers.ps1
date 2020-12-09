# Get-ADDomainController -Filter 'HostName -like "server" -and Enabled -eq "True"'
# Get-ADComputer -Filter 'Name -like "*acc*" -or Name -like "*prd*" -and Enabled -eq "True"'

# Specific servers:
Get-ADComputer -Filter 'OperatingSystem -like "*Server*" -and Name -like "*" -and Name -like "*prd*" -and Enabled -eq "True"' `
 -Properties Name,IPv4Address,OperatingSystem |
Sort-Object -Property Name,Operatingsystem,IPv4Address |
Select-Object -Property Name,IPv4Address,OperatingSystem

# All servers:
Get-ADComputer -Filter 'OperatingSystem -like "*Server*" -and Enabled -eq "True"' `
 -Properties Name,IPv4Address,OperatingSystem |
Sort-Object -Property Name,Operatingsystem,IPv4Address |
Select-Object -Property Name,IPv4Address,OperatingSystem

# All Domaincontrollers:
Get-ADComputer -Filter 'primarygroupid -eq "516"' `
 -Properties Name,IPv4Address,OperatingSystem |
Sort-Object -Property Name,Operatingsystem,IPv4Address |
Select-Object -Property Name,IPv4Address,OperatingSystem

# All MemberServers:
Get-ADComputer -Filter 'OperatingSystem -like "*Server*" -and enabled -eq "True" -and primarygroupid -ne "516"' `
 -Properties Name,IPv4Address,OperatingSystem |
Sort-Object -Property Name,Operatingsystem,IPv4Address |
Select-Object -Property Name,IPv4Address,OperatingSystem

# Source: https://sid-500.com/2019/07/30/