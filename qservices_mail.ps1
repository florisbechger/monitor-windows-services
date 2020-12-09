
<#
.NOTES
    Author: Floris Bechger, Technisch Applicatie Beheerder Planning
	E-mail: floris.bechger@gvb.nl; floris.bechger@gmail.com
    Last Edit: 2020-11-06
    Version 1.0 - initial release of Quintiq Service Script
#>

## Email status QInda-Services on Servers

## Elevate privileges ##
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }

## Load and Store Folder Variables ##
. .\qservices_variables.ps1
Write-Host "$Admin $Domain $ShareFolder $DesktopFolder $ScriptFolder $LogFolder $Date $Time $StartTime"

## Mail variables ##

# $Domain = "gvbcmd"
# $SMTPPort = "587"
$From = "noreply@gvb.nl"
$To = "floris.bechger@gvb.nl","marco.vangink@gvb.com"
# $Cc = 
# $Bcc = "planning@gvb.nl"
# $ReplyTo = "floris.bechger@gvb.nl"
$Subject = "TEST: New Logfile: $Server-$Date-*"
$Body = "TEST: Hello Administrator, you have received a new logfile. Please review the attached document. If there is no attachment, please consult your local administrator. Kind regards, Administrator"
$SMTPServer = "smtprelay.gvb.nl"
# $Attachment = "$Admin\$DesktopFolder\$ScriptFolder\$LogFolder\$Server-$Date-*.log"
# $Priority = "High"

## Mail script ##

Send-MailMessage -From $From -to $To `
-Subject $Subject -Body $Body -Priority $Priority `
-SmtpServer $SMTPServer -UseSsl `
# -Credential (Get-Credential)

## End script
