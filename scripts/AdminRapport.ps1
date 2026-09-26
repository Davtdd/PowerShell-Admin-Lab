$ReportPath = ".\reports\system-report.txt"

Write-Host "Génération du rapport..." -ForegroundColor Cyan

$Computer = Get-CimInstance Win32_ComputerSystem
$OS = Get-CimInstance Win32_OperatingSystem
$Disk = Get-CimInstance Win32_LogicalDisk -Filter "DeviceID='C:'"

$Report = @"

========================================
        RAPPORT ADMINISTRATION
========================================

Date :
$(Get-Date)

POSTE
----------------------------------------
Nom             : $($Computer.Name)
Utilisateur     : $($Computer.UserName)
Système         : $($OS.Caption)
Version         : $($OS.Version)
Architecture    : $($OS.OSArchitecture)
RAM             : $([math]::Round($Computer.TotalPhysicalMemory / 1GB, 2)) Go
Dernier démarrage : $($OS.LastBootUpTime)

DISQUE C:
----------------------------------------
Taille totale   : $([math]::Round($Disk.Size / 1GB, 2)) Go
Espace libre    : $([math]::Round($Disk.FreeSpace / 1GB, 2)) Go

UTILISATEURS LOCAUX
----------------------------------------
$(Get-LocalUser | Select-Object Name, Enabled | Out-String)

SERVICES
----------------------------------------
Windows Update : $((Get-Service wuauserv).Status)

========================================
Fin du rapport
========================================
"@

$Report | Out-File -FilePath $ReportPath -Encoding UTF8

Write-Host "Rapport généré : $ReportPath" -ForegroundColor Green