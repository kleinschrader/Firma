md c:\HWID
Set-Location c:\HWID
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Unrestricted -Force
Install-Script -Name Get-WindowsAutopilotInfo -Force
$env:Path += ";C:\Program Files\WindowsPowerShell\Scripts"
Get-WindowsAutopilotInfo.ps1 -OutputFile AutopilotHWID.csv

#Soll wohl funktionieren, bin ich aber selber noch gespannt drauf. Werd das mal in ner VM ausprobieren.