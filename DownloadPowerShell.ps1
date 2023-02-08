#Requires -Version 2.0

Write-Output "Create PowerShell Folder"

if ($(Test-Path -Path ".\PowerShell\")) {
    Write-Output "PowerShell Folder Already exists"
}
else {
    Write-Output "Creating PowerShell Folder"
    New-Item -Path ".\PowerShell" -ItemType Directory
}

Write-Output "Download PowerShell from https://github.com/PowerShell/PowerShell/releases/latest"

if ($(Test-Path -Path ".\PowerShell.zip")) {
    Write-Output "PowerShell.zip found, skipping download"
}
else {
    Write-Output "PowerShell.zip not found, downloading PowerShell.zip"
    Write-Output "Get the bit type of the processor"
    $OS = if ($env:PROCESSOR_ARCHITECTURE -like "AMD64") { "x64" } else { "x86" }
    Write-Output "Download the 32bit version or 64bit version of PowerShell"
    $uri = $((Invoke-WebRequest -UseBasicParsing -Uri 'https://github.com/PowerShell/PowerShell/releases/latest').Links.href |
        Where-Object { $_ -like "*releases*win-$OS.zip" })
    Invoke-WebRequest -Uri $('https://github.com' + $uri) -OutFile '.\PowerShell.zip'
}

Write-Output "Extract the Downloaded Powershell Zip"

if ($(Test-Path -Path ".\PowerShell\pwsh.exe")) {
    Write-Output "PowerShell already extracted"
}
else {
    Write-Output "Extracting contents of PowerShell.zip to .\PowerShell\"
    Add-Type -AssemblyName System.IO.Compression.FileSystem
    [System.IO.Compression.ZipFile]::ExtractToDirectory('.\PowerShell.zip', '.\PowerShell')
    Write-Output "Done extracting PowerShell.zip to .\PowerShell\"
}
