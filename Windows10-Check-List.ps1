Write-host "****************************************************" -ForegroundColor Red -BackgroundColor White
Write-host "****************************************************" -ForegroundColor Red -BackgroundColor White
Write-host "********************Tested on: *********************" -ForegroundColor Red -BackgroundColor White
Get-date -DisplayHint DateTime
Write-Host "`n Local Printers:****" -ForegroundColor Red -BackgroundColor White
Get-Printer -Name "*Konica*" | Format-Table
Write-Host "`n Microsoft Office:****" -ForegroundColor Red -BackgroundColor White
$A = Get-ItemProperty HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\* |  ? {$_.displayname -like "*Word*"} #| Select-Object Displayname 
if ($A.DisplayName -like "*Word*")
{
$A.DisplayName
}
else
{
Write-Host "Office is Not Installed in this Machine!"
}
\\