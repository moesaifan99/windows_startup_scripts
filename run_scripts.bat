@echo off
cd "C:\Users\Moesa\Documents\stonks\testing_stocks"

:: Open first VS Code window in the Trading_Dashboard folder
:: start "" cmd /c start "" "C:\Users\Moesa\AppData\Local\Programs\Microsoft VS Code\Code.exe" "C:\Users\Moesa\Documents\stonks\testing_stocks"

:: Open second VS Code window in the folder containing moe.py
:: start "" cmd /c start "" "C:\Users\Moesa\AppData\Local\Programs\Microsoft VS Code\Code.exe" "C:\Users\Moesa\Documents\Official_Trading_Platform\trading_strat"

:: Wait a few seconds to ensure VS Code windows are fully opened
echo Waiting for VS Code to stabilize...
timeout /t 5 >nul

:: Run Python scripts inside PowerShell windows, minimizing or normalizing them for side-by-side arrangement
:: start powershell -NoExit -Command "cd 'C:\Users\Moesa\Documents\stonks\testing_stocks'; .\.venv\Scripts\Activate.ps1; python Trading_Dashboard\app.py" -WindowStyle Normal
start powershell -NoExit -Command "cd 'C:\Users\Moesa\Documents\Official_Trading_Platform\trading_strat'; .\venv\Scripts\Activate.ps1; python testing\app.py"

:: Prevent the batch script from closing immediately after execution
pause
