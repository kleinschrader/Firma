# Script zum Installieren, auslesen und einfügen von Geräten unter Windows in Intune
# von Nicolas Csaba Bohocki
# 13.08.2020
# für Windows Powershell
#-----------#Installation des Scripts ----------------------------------------------------


Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force # Package-Provider installieren damit das Script für die Hardware-Hashes ausgeführt werden kann
Install-Script Get-WindowsAutoPilotInfo                              # Instlallieren des Scirpts zum auslesen der Hardware-Hashes

#-----------Auslesen der Hardware-Hashes aus der Powershell -------------------------------


$Hash = get-WindowsAutoPilotInfo #Auslesen des Hardware-Hashes

#------------------#Abfragen der benötigten Informationen zum einfügen der Daten in die .CSV ------------------------------------------------------------------------
$SN  = (Get-WmiObject -Class Win32_BIOS).SerialNumber
$ProductKey = wmic path softwarelicensingservice get OA3xOriginalProductKey
# $UPN = Read-Host("Hier die eigene UPN angeben. Wenn unbekannt, UNBEDINGT unterlassen und erst erfragen.") || "Aufgepasst mit dem Dingens, MS mag da keine falschen Inputs".upper


#New-Item -path ~Documents\Intune . -Name "NewDevice.csv" -ItemType "file" 
#-Value "Device Serial Number,Windows Product ID,Hardware Hash,Group Tag,Assigned User
#        $SN,$ProductKey,$Hash,<optionalGroupTag>,$UPN"

New-Item -path ~/Documents -name "InTune" -ItemType "directory" -ErrorAction SilentlyContinue        
$Number = 0
     $exportObj = New-Object psobject -Property @{"Device Serial number" = $SN;"Windows Product ID" = $ProductKey; "Hardware Hash" =$Hash;"Group Tag" = ""; "Assigned User" = ""}

try {
$exportObj | export-csv -path ~/Documents/InTune/NewDevice$Number.csv -ErrorAction 
}

catch {
    $Number = $Number + 1
}




