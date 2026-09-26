# PowerShell Admin Lab

Projet personnel d'automatisation de tâches d'administration Windows avec PowerShell.

## Objectifs

- Collecter les informations système
- Lister les utilisateurs locaux
- Contrôler certains éléments de configuration
- Vérifier l'espace disque
- Vérifier l'état de services Windows
- Générer automatiquement un rapport système

## Technologies

- PowerShell
- Windows
- CIM / WMI
- Services Windows
- Gestion des utilisateurs locaux

## Utilisation

Lancer PowerShell puis exécuter :

```powershell
.\scripts\Get-SystemInfo.ps1
.\scripts\Get-LocalUsers.ps1
.\scripts\Check-SystemConfig.ps1
.\scripts\Generate-AdminReport.ps1