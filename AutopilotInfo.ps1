# Script zum Installieren, auslesen und einfügen von Geräten unter Windows in Intune
# von Nicolas Csaba Bohocki
# 13.08.2020
# für Windows Powershell
#-----------#Installation des Scripts ----------------------------------------------------

Install-PackageProvider -Name NuGet -Confirm -ErrorAction SilentlyContinue  # Package-Provider installieren damit das Script für die Hardware-Hashes ausgeführt werden kann
Install-Script Get-WindowsAutoPilotInfo -ErrorAction SilentlyContinue       # Instlallieren des Scirpts zum auslesen der Hardware-Hashes
Import-Module Microsoft.PowerShell.Management

#-----------Auslesen der Hardware-Hashes aus der Powershell -------------------------------


$Hash = get-WindowsAutoPilotInfo -ErrorAction SilentlyContinue #Auslesen des Hardware-Hashes

#------------------#Abfragen der benötigten Informationen zum einfügen der Daten in die .CSV ------------------------------------------------------------------------
$SN  = (Get-CimInstance -Class Win32_BIOS).SerialNumber
$ProductKey = wmic path softwarelicensingservice get OA3xOriginalProductKey
# $UPN = Read-Host("Hier die eigene UPN angeben. Wenn unbekannt, UNBEDINGT unterlassen und erst erfragen.") || "Aufgepasst mit dem Dingens, MS mag da keine falschen Inputs".upper


#New-Item -path ~Documents\Intune . -Name "NewDevice.csv" -ItemType "file" 
#-Value "Device Serial Number,Windows Product ID,Hardware Hash,Group Tag,Assigned User
#        $SN,$ProductKey,$Hash,<optionalGroupTag>,$UPN"

$usbdriveGUID = "0002941a-0000-0000-0000-100000000000"

$fullPath = (Get-Volume -Path "\\?\Volume{$usbdriveGUID}\").driveLetter+":\InTune\"   
$exportObj = New-Object psobject -Property @{"Device Serial number" = $SN;"Windows Product ID" = $ProductKey; "Hardware Hash" =$Hash;"Group Tag" = ""; "Assigned User" = ""}
$exportObj | export-csv -path ($fullPath + "NewDevice$SN.csv") 




