Write-Host "===== CONTRÔLE DE CONFIGURATION =====" -ForegroundColor Cyan


$Firewall = Get-NetFirewallProfile

Write-Host "`n--- Pare-feu Windows ---"

foreach ($Profile in $Firewall) {
    Write-Host "$($Profile.Name) : $($Profile.Enabled)"
}

# Vérification du service Windows Update
$UpdateService = Get-Service -Name wuauserv

Write-Host "`n--- Windows Update ---"
Write-Host "Service : $($UpdateService.Status)"

# Vérification de l'espace disque
$Disk = Get-CimInstance Win32_LogicalDisk -Filter "DeviceID='C:'"

$FreeSpace = [math]::Round($Disk.FreeSpace / 1GB, 2)
$TotalSpace = [math]::Round($Disk.Size / 1GB, 2)

Write-Host "`n--- Disque C: ---"
Write-Host "Espace total : $TotalSpace Go"
Write-Host "Espace libre : $FreeSpace Go"

if ($FreeSpace -lt 20) {
    Write-Warning "Espace disque faible !"
}
else {
    Write-Host "Espace disque suffisant."
}