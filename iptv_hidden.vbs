Set WshShell = CreateObject("WScript.Shell")
Set fso = CreateObject("Scripting.FileSystemObject")

' =========================
' Config
' =========================
BASE_DIR = "C:\Users\Moesa\Documents\IPTVPlayer"
IPTV_DIR = BASE_DIR & "\IPTV"
LOG_DIR = BASE_DIR & "\logs"

VENV_PY = BASE_DIR & "\venv\Scripts\python.exe"
BASH_EXE = "C:\Program Files\Git\bin\bash.exe"

' =========================
' Create log folders
' =========================
If Not fso.FolderExists(LOG_DIR & "\runsh") Then fso.CreateFolder(LOG_DIR & "\runsh")
If Not fso.FolderExists(LOG_DIR & "\zdaemon") Then fso.CreateFolder(LOG_DIR & "\zdaemon")
If Not fso.FolderExists(LOG_DIR & "\ztv_remote_app") Then fso.CreateFolder(LOG_DIR & "\ztv_remote_app")

' =========================
' Helper to run command hidden with log
' =========================
Sub RunHidden(cmd, logfile)
    ' Fix quoting for paths with spaces
    quotedCmd = "cmd /c """ & cmd & """ > """ & logfile & """ 2>&1"
    WshShell.Run quotedCmd, 0, False
End Sub

' =========================
' Run run.sh hidden
' =========================
RunHidden """" & BASH_EXE & """ --login -i """ & IPTV_DIR & "\run.sh"" --port 9989", LOG_DIR & "\runsh\STDOUT.log"

' =========================
' Run zdaemon.py hidden
' =========================
RunHidden """" & VENV_PY & """ -u """ & IPTV_DIR & "\zdaemon.py""", LOG_DIR & "\zdaemon\STDOUT.log"

' =========================
' Run ztv_remote_\app.py hidden
' =========================
RunHidden """" & VENV_PY & """ -u """ & IPTV_DIR & "\ztv_remote_\app.py""", LOG_DIR & "\ztv_remote_app\STDOUT.log"
