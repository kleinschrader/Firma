# Script zum Installieren, auslesen und einfügen von Geräten unter Windows in Intune
# von Nicolas Csaba Bohocki
# 13.08.2020
# für Windows Powershell
#-----------#Installation des Scripts ----------------------------------------------------


Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force # Package-Provider installieren damit das Script für die Hardware-Hashes ausgeführt werden kann
Install-Script Get-WindowsAutoPilotInfo                              # Instlallieren des Scirpts zum auslesen der Hardware-Hashes

#-----------Auslesen der Hardware-Hashes aus der Powershell -------------------------------


$Hash = get-WindowsAutoPilotInfo #Auslesen des Hardware-Hashes

#------------------#Abfragen der benötigten Informationen zum einfügen der ------------------------------------------------------------------------
$SN  = (Get-WmiObject -Class Win32_BIOS).SerialNumber
$ProductKey = wmic path softwarelicensingservice get OA3xOriginalProductKey
$AssignedUser = Get-ADUser
$AssignedUser






New-Item -Path . -Name "NewDevice.csv" -ItemType "file" -Value "Device Serial Number,Windows Product ID,Hardware Hash,Group Tag,Assigned User
$SN,$ProductKey,$Hash,<optionalGroupTag>,<optionalAssignedUser>"


