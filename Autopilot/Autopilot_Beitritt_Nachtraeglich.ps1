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
"Verbindung zu MS-Graph aufbauen"
Connect-MSGraph
"Erfolgreich"
#------------Erstellen einer JSON-FILE für nachträglichen Zugang-------
"Erstellen einer APConfig.json"
Get-AutopilotProfile | ConvertTo-AutopilotConfigurationJSON | Out-File "~\Documents\InTune\AutopilotConfigurationFile.json" -Encoding ascii
"Abgeschlossen"