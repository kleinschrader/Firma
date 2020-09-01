# PWSH-CMDlets für die WBB-Clusteranpassung 
# NB
# 25.08.2020
#
# 1 - Organisieren der Aufgaben
# 1) Sammeln der Informationen
# 2) Konfigurieren der Startreihenfolge
#   - DC
#   - SQL Server
#   - Alle anderen
# 3) Konfigurieren des Starts
# 4) Konfigurieren des Stopps

# New-ClusterGroupSet
# Add-ClusterGroupToSet
# Set-ClusterGroupSet
# Get-ClusterGroupSet
# Remove-ClusterGroupSet
# Remove-ClusterGroupFromSet

# Add-ClusterGroupDependency
# Remove-ClusterGroupDependency
# Get-ClusterGroupDependency

# Add-ClusterGroupSetDependency
# Remove-ClusterGroupSetDependency
# Get-ClusterGroupSetDependency

# -----------------------Erstellen der Cluster-----------------------------
$HVCluster = "HyperV-HA.mgmt.kunde.de"                                                              # Der Name des Clusters sowie der Gruppen muss 
New-ClusterGroupSet -CimSession $HVCluster -Name "DomainControllers"                                # entschrechend den Gegebenheiten angepasst
New-ClusterGroupSet -CimSession $HVCluster -Name "SQLServers"                                       # werden, ebenfalls jede einzelne VM oder Server.
New-ClusterGroupSet -CimSession $HVCluster -Name "ExchangeOWA"
New-ClusterGroupSet -CimSession $HVCluster -Name "Firewalls"
#------------------------Leere Gruppen wurden erstellt---------------------
#------------Hinzufügen von Clustergruppen zum Clustergroupset-------------
Add-ClusterGroupToSet -CimSession $HVCluster -Name DomainControllers -Group "Server-DC01"
Add-ClusterGroupToSet -CimSession $HVCluster -Name DomainControllers -Group "Server-DC02"
Add-ClusterGroupToSet -CimSession $HVCluster -Name DomainControllers -Group "Server-DC03"
#-----------------SQLServer------------------------------------------------
Add-ClusterGroupToSet -CimSession $HVCluster -Name SQLServers -Group "Server-SQL01"
Add-ClusterGroupToSet -CimSession $HVCluster -Name SQLServers -Group "Server-SQL02"
#-----------------ExchangeServer-------------------------------------------
Add-ClusterGroupToSet -CimSession $HVCluster -Name ExchangeOWA -Group "Ex-OWA01"
Add-ClusterGroupToSet -CimSession $HVCluster -Name ExchangeOWA -Group "Ex-OWA02"
#-------------------Firewall-----------------------------------------------
Add-ClusterGroupToSet -CimSession $HVCluster -Name Firewalls -Group "Firewall"
#--------------------------------------------------------------------------
# Anschliessend kann überprüft werden, ob alle Groupsets richtig erstellt wurden mithilfe von:
Get-ClusterGroupSet
#------Wenn alles korrekt ist, können Abhängigkeiten gesetzt werden--------
Add-ClusterGroupSetDependency -CimSession $HVCluster -Name Firewalls -Provider ExchangeOWA          # Abhängigkeit von der Firewall vom Exchange setzen
Add-ClusterGroupSetDependency -CimSession $HVCluster -Name ExchangeOWA -Provider SQLServers         # Abhängigkeit vom Exchange vom SQLServer setzen
Add-ClusterGroupSetDependency -CimSession $HVCluster -Name SQLServers -Provider DomainControllers   # Abhängigkeit vom SQLServer vom DC setzen
#--------------------------------------------------------------------------