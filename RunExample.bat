@echo off
echo ==== Running Example.ps1 With pwsh.exe found under .\PowerShell\ ====
.\PowerShell\pwsh.exe -WorkingDirectory .\ -NoExit -NoProfile -NoLogo -File .\Example.ps1
