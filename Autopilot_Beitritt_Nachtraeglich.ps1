#------------Installieren der benötigten Packages----------------------
Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -ErrorAction Continue -
Install-Module AzureAD -ErrorAction Continue
Install-Module WindowsAutopilotIntune -ErrorAction Continue
Install-Module Microsoft.Graph.Intune -ErrorAction Continue
#------------Verbinden mit InTune--------------------------------------
Connect-MSGraph
#------------Erstellen einer JSON-FILE für nachträglichen Zugang-------
Get-AutopilotProfile | ConvertTo-AutopilotConfigurationJSON | Out-File "AutopilotConfigurationFile.js" -Encoding ascii