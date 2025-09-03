Set WshShell = CreateObject("WScript.Shell")
WshShell.CurrentDirectory = "C:\Users\Moesa\Documents\IPTVPlayer\IPTV"
WshShell.Run """C:\Program Files\Git\bin\bash.exe"" --login -i ""C:\Users\Moesa\Documents\IPTVPlayer\IPTV\run.sh --port 9989""", 0, False
