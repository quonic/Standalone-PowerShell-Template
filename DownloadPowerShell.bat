@echo off
rem Create PowerShell Folder
if exist .\PowerShell\ (
    echo PowerShell Folder Already exists
) else (
    echo Creating PowerShell Folder
    mkdir .\PowerShell
)
rem Download PowerShell from https://github.com/PowerShell/PowerShell/releases/latest
if exist .\PowerShell.zip (
    echo PowerShell.zip found, skipping download
) else (
    echo PowerShell.zip not found, downloading PowerShell.zip
    rem Get the bit type of the processor
    reg Query "HKLM\Hardware\Description\System\CentralProcessor\0" | find /i "x86" > NUL && set OS=32BIT || set OS=64BIT
    rem Download the 32bit version or 64bit version of PowerShell
    if %OS%==32BIT c:\Windows\System32\windowspowershell\v1.0\powershell.exe -Command "& { $uri = $((Invoke-WebRequest -UseBasicParsing -Uri 'https://github.com/PowerShell/PowerShell/releases/latest').Links.href | Where-Object { $_ -like '*releases*win-x86.zip' }); Invoke-WebRequest -Uri $('https://github.com'+$uri) -OutFile '.\PowerShell.zip' }"
    if %OS%==64BIT c:\Windows\System32\windowspowershell\v1.0\powershell.exe -Command "& { $uri = $((Invoke-WebRequest -UseBasicParsing -Uri 'https://github.com/PowerShell/PowerShell/releases/latest').Links.href | Where-Object { $_ -like '*releases*win-x64.zip' }); Invoke-WebRequest -Uri $('https://github.com'+$uri) -OutFile '.\PowerShell.zip' }"
)
rem Extract the Downloaded Powershell Zip
if exist .\PowerShell\pwsh.exe (
    echo PowerShell already extracted
) else (
    echo Extracting contents of PowerShell.zip to .\PowerShell\
    c:\Windows\System32\windowspowershell\v1.0\powershell.exe -Command "& { Add-Type -AssemblyName System.IO.Compression.FileSystem; [System.IO.Compression.ZipFile]::ExtractToDirectory('.\PowerShell.zip', '.\PowerShell') }"
    echo Done extracting PowerShell.zip to .\PowerShell\
)
