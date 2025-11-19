$action = New-ScheduledTaskAction -Execute powershell.exe -Argument "-ExecutionPolicy Bypass -File C:\Scripts\MyScript.ps1"
$principal = New-ScheduledTaskPrincipal -UserId NT AUTHORITY\SYSTEM -LogonType ServiceAccount -RunLevel Highest

# Create the trigger with repetition settings
$trigger = New-ScheduledTaskTrigger -AtStartup -RepetitionInterval (New-TimeSpan -Minutes 5) -RepetitionDuration ([TimeSpan]::MaxValue)

Register-ScheduledTask -Telemetry_PROG -Action $action -Principal $principal -Trigger $trigger -Description "kyle was here"
Remove-Item -Path "C:\Path\To\Your\File.txt" -Force
