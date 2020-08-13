# Script zum Installieren, auslesen und einfügen von Geräten unter Windows in Intune
# von Nicolas Csaba Bohocki
# 13.08.2020
# für Windows Powershell
#-----------#Installation des Scripts ----------------------------------------------------+
"Getting everything started."
Set-ExecutionPolicy Unrestricted -Force -confirm 
"Installing required Packages."
Install-PackageProvider -Name NuGet -Confirm -ErrorAction SilentlyContinue -confirm  # Package-Provider installieren damit das Script für die Hardware-Hashes ausgeführt werden kann
Install-Script Get-WindowsAutoPilotInfo -ErrorAction SilentlyContinue -confirm # Instlallieren des Scirpts zum auslesen der Hardware-Hashes
Import-Module Microsoft.PowerShell.Management -confirm
"All prerequesites met."
#-----------Auslesen der Hardware-Hashes aus der Powershell -------------------------------

"Creating Hardware-Hash."
$Hash = get-WindowsAutoPilotInfo #Auslesen des Hardware-Hashes
"Done."

#------------------#Abfragen der benötigten Informationen zum einfügen der Daten in die .CSV ------------------------------------------------------------------------

"Fetching Serialnuber."
$SN  = (Get-CimInstance -Class Win32_BIOS).SerialNumber
"Done."
"Retrieving Product Key."
$ProductKey = (wmic path softwarelicensingservice get OA3xOriginalProductKey)[2]
"Done."
# $UPN = Read-Host("Hier die eigene UPN angeben. Wenn unbekannt, UNBEDINGT unterlassen und erst erfragen.") || "Aufgepasst mit dem Dingens, MS mag da keine falschen Inputs".upper
#----------------------Schreiben der Werte in eine .csv-Datei-------------------------------------------------------------------------------------------------
$usbdriveGUID = "0002941a-0000-0000-0000-100000000000"
$fullPath = (Get-Volume -Path "\\?\Volume{$usbdriveGUID}\").driveLetter+":\InTune\"   
$exportObj = New-Object psobject -Property @{"Device Serial number" = $SN;"Windows Product ID" = $ProductKey; "Hardware Hash" =$Hash;"Group Tag" = ""; "Assigned User" = ""}
"Creating a .csv File."
$exportObj | export-csv -path ($fullPath + "NewDevice$SN.csv") 
"Csv Created."
"Last few settings to do."
Set-ExecutionPolicy Default -Force -Confirm
"All Done."




