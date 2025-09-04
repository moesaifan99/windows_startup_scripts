@echo off
:: =========================
:: Config
:: =========================
set "BASE_DIR=C:\Users\Moesa\Documents\IPTVPlayer"
set "IPTV_DIR=%BASE_DIR%\IPTV"
set "LOG_DIR=%BASE_DIR%\logs"

set "VENV_PY=%BASE_DIR%\venv\Scripts\python.exe"
set "BASH_EXE=C:\Program Files\Git\bin\bash.exe"

:: =========================
:: Create log folders
:: =========================
if not exist "%LOG_DIR%\runsh" mkdir "%LOG_DIR%\runsh"
if not exist "%LOG_DIR%\zdaemon" mkdir "%LOG_DIR%\zdaemon"
if not exist "%LOG_DIR%\ztv_remote_app" mkdir "%LOG_DIR%\ztv_remote_app"

:: =========================
:: Run scripts hidden with logging
:: =========================
:: /B -> run without creating new window
:: /MIN -> start minimized (hidden)
start "" /B "%BASH_EXE%" --login -i "%IPTV_DIR%\run.sh" --port 9989 > "%LOG_DIR%\runsh\STDOUT.log" 2>&1
start "" /B "%VENV_PY%" -u "%IPTV_DIR%\zdaemon.py" > "%LOG_DIR%\zdaemon\STDOUT.log" 2>&1
start "" /B "%VENV_PY%" -u "%IPTV_DIR%\ztv_remote_\app.py" > "%LOG_DIR%\ztv_remote_app\STDOUT.log" 2>&1

echo All scripts started in background. Logs are in %LOG_DIR%
exit
