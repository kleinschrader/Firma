#------------Installieren der benötigten Packages----------------------
"Installieren der bentötigten Pakete"
"Paket 1 von 5"
Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force
"Fertig"
"Paket 2 von 5"
Install-Module AzureAD -Force
"Fertig"
"Paket 3 von 5"
Install-Module WindowsAutopilotIntune -Force
"Fertig"
"Paket 4 von 5"
Install-Module Microsoft.Graph.Intune -Force
"Fertig"
"Paket 5 von 5"
Install-Script Get-WindowsAutoPilotInfo -Force
"Alle Pakete installiert" 
#------------Verbinden mit InTune--------------------------------------
"Es wird eine Verbindung zu InTune aufgebaut."
# $UPN = Read-Host -Prompt "Bitte geben sie ihre UPN ein."
$AComputerName = HOSTNAME.EXE
Get-WindowsAutoPilotInfo.ps1 -AssignedUser "" -Append -Online -AddToGroup "SG MDM Test Geräte" -AssignedComputerName "$AComputername" -Assign