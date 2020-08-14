Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force
Install-Module AzureAD -Force
Install-Module WindowsAutopilotIntune -Force
Install-Module Microsoft.Graph.Intune -Force
$UPN = Read-Host -Prompt "Please insert your UPN"
$AComputerName = HOSTNAME.EXE
Get-WindowsAutoPilotInfo.ps1 -AssignedUser "$UPN" -Append -Online -AddToGroup "SG MDM Test Geräte" -AssignedComputerName "$AComputername" -Assign
