# Récupération des informations système
$Computer = Get-CimInstance Win32_ComputerSystem
$OS = Get-CimInstance Win32_OperatingSystem

Write-Host "===== INFORMATIONS SYSTÈME =====" -ForegroundColor Cyan

Write-Host "Nom du poste       : $($Computer.Name)"
Write-Host "Utilisateur        : $($Computer.UserName)"
Write-Host "Système            : $($OS.Caption)"
Write-Host "Version            : $($OS.Version)"
Write-Host "Mémoire RAM        : $([math]::Round($Computer.TotalPhysicalMemory / 1GB, 2)) Go"
Write-Host "Architecture       : $($OS.OSArchitecture)"
Write-Host "Dernier démarrage  : $($OS.LastBootUpTime)"