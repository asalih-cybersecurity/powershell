#Check Desktop Needed Files
$files = Get-ChildItem -Path C:\Users\Public\Desktop
$files.Count
foreach ($file in $files) 
{ 
if ($file.name -clike "*Drives*")
{ Write-Host $file.Name "...Installed" -ForegroundColor Red -BackgroundColor White }

Else { if ($file.name -like "*Epson*")
{ Write-Host $file.Name "...Installed" -ForegroundColor Red -BackgroundColor White }

Else { if ($file.name -ccontains "*Chrome*")
{ Write-Host $file.Name "...Installed" -ForegroundColor Red -BackgroundColor White }
else  {Write-Host "kk"}
}}}





