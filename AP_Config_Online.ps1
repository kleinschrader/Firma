
$UPN = Read-Host -Prompt "Please insert your UPN"
$AComputerName = HOSTNAME.EXE
Get-WindowsAutoPilotInfo.ps1 -AssignedUser "$UPN" -Append -Online -AddToGroup "SG MDM Test Geräte" -AssignedComputerName "$AComputername" -Assign