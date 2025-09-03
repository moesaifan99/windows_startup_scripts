@echo off
:: Full path to Git Bash
set "GIT_BASH=C:\Program Files\Git\bin\bash.exe"

:: Absolute path to your run.sh
set "SCRIPT_PATH=C:\Users\Moesa\Documents\IPTVPlayer\IPTV\run.sh"

:: Run VBScript to launch Git Bash hidden (runs run.sh)
cscript //nologo "%~dp0run_ip_tv_hidden.vbs"

:: Change to working directory
cd /d "C:\Users\Moesa\Documents\IPTVPlayer\IPTV"

:: Run zdaemon.py (hidden in background)
start "" python "zdaemon.py"

:: Run ztv_remote_/app.py (hidden in background)
start "" python "ztv_remote_\app.py"
