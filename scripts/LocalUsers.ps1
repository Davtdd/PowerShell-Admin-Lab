Write-Host "===== UTILISATEURS LOCAUX =====" -ForegroundColor Cyan

Get-LocalUser |
    Select-Object Name, Enabled, LastLogon |
    Format-Table -AutoSize