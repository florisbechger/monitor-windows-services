
Clear-Host

Write-Host "Installed Hotfixes:"

Get-HotFix

$stopwatch = [system.diagnostics.stopwatch]::StartNew()
$result = (New-Object -ComObject Microsoft.Update.Session).CreateupdateSearcher().Search("IsInstalled=1").Updates |
  Select-Object LastDeploymentChangeTime, Title, Description, MsrcSeverity 

$result | Out-GridView -Title 'Installed Updates'

$time = $stopwatch.ElapsedMilliseconds

'{0} results in {1:n1} milliseconds' -f $result.Count, $time

