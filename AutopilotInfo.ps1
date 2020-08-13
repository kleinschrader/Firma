# Script zum Installieren, auslesen und einfügen von Geräten unter Windows in Intune
# von Nicolas Csaba Bohocki
# 13.08.2020
# für Windows Powershell
#------------------------------------------------------------------------------------------
#Installation des Scripts 
# 
Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force #Package-Provider installieren damit das Script für die Hardware-Hashes ausgeführt werden kann
Install-Script Get-WindowsAutoPilotInfo           # Instlallieren des Scirpts zum auslesen der Hardware-Hashes                 