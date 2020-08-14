#------------Installieren der benötigten Packages----------------------
"Installieren der bentötigten Pakete"
"Paket 1 von 4"
Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force
"Fertig"
"Paket 2 von 4"
Install-Module AzureAD -Force
"Fertig"
"Paket 3 von 4"
Install-Module WindowsAutopilotIntune -Force
"Fertig"
"Paket 4 von  4"
Install-Module Microsoft.Graph.Intune -Force
"Alle Pakete installiert" 
#------------Verbinden mit InTune--------------------------------------
"Es wird eine Verbindung zu InTune aufgebaut."
$UPN = Read-Host -Prompt "Bitte geben sie ihre UPN ein."
$AComputerName = HOSTNAME.EXE
Get-WindowsAutoPilotInfo.ps1 -AssignedUser "$UPN" -Append -Online -AddToGroup "SG MDM Test Geräte" -AssignedComputerName "$AComputername" -Assign