
Clear-Host

$MachineName = "laptop"
Get-Service -Name "Win*" | Where-Object {$_.Status -eq "Running"} | Select MachineName,ServiceName,Name,DisplayName,StartType,Status | Sort-Object status