#------------Installieren der benötigten Packages----------------------
Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force
Install-Module AzureAD -Force
Install-Module WindowsAutopilotIntune -Force
Install-Module Microsoft.Graph.Intune -Force
#------------Verbinden mit InTune--------------------------------------
Connect-MSGraph
#------------Erstellen einer JSON-FILE für nachträglichen Zugang-------
$Number = 0
Get-AutopilotProfile | ConvertTo-AutopilotConfigurationJSON | while($True){
    try {
        Out-File "~/Documents/InTune/AP-Profile/Profil$Number.json" -Encoding ascii
        break
    }
    do {
        $Number = $Number + 1
    }
}
