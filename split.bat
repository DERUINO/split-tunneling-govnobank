@echo off
setlocal enableextensions 

set /p interface_ip=<interface_ip.txt

if [%interface_ip%]==[] (
    echo "can't get interface ip, please, fill interface_ip.txt"
    pause
    exit
)

for /F "tokens=2 delims=," %%P in ('
    tasklist /SVC /FI "imagename eq Telegram.exe" /FO CSV /NH
') do (
    taskkill /PID %%P% /F
    "ForceBindIP64.exe" %interface_ip% "C:\Users\flash\AppData\Roaming\Telegram Desktop\Telegram.exe"
)

for /F "tokens=2 delims=," %%P in ('
    tasklist /SVC /FI "imagename eq vkteams.exe" /FO CSV /NH
') do (
    taskkill /PID %%P% /F
    "ForceBindIP64.exe" %interface_ip% "C:\Users\flash\AppData\Local\Programs\VK Teams\vkteams.exe"
)

for /F "tokens=2 delims=," %%P in ('
    tasklist /SVC /FI "imagename eq lync.exe" /FO CSV /NH
') do (
    taskkill /PID %%P% /F
    "ForceBindIP64.exe" %interface_ip% "C:\Program Files\Microsoft Office\Office16\lync.exe"
)

echo "OK"
pause
