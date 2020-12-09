Clear-Host

$Server = 'laptop'
$Service = '*'
$Size = '1KB'

$ShareFolder = 'TMP'
$LogFolder = 'ServiceLogs'
$Date = Get-Date -format "yyyy-MM-dd"

$Array = Get-Process $Service -Computername $Server | Where-Object {$_.VirtualMemorySize -gt $Size} `
 | Sort-Object -Property VirtualMemorySize -Descending `
 | Select MachineName,Id,ProcessName,StartTime,@{n="VirtualMemorySize(MB)";e={$_.VirtualMemorySize/1MB}} `
 | Select-Object -first 20

If($Array)
{ 
    Write-Host "`nResults:" -ForegroundColor Yellow
 
    # Display results in console
    $Array | Sort-Object VirtualMemorySize -Descending | Format-Table -AutoSize -Wrap

    # Display results in new window
#    $Array | Out-GridView

    # Save to CSV file
#    $Array | Export-Csv -Path \\$Server\$ShareFolder\$LogFolder\$Server-$Date-memory.csv -NoTypeInformation
}
