# Standalone PowerShell Example

## Requirements

* PowerShell 2.0 or greater
* Server 2008 or greater
* A little bit of Batch and PowerShell knowledge to get a PowerShell script to run

## Run a PowerShell script with PowerShell 7 with out installing PowerShell 7

1. Copy the files in this repository into a folder
2. Navigate to that folder
3. Double click on `DownloadPowerShell.bat`
4. Wait for PowerShell to download and extract into the `PowerShell\` folder
5. Double click on `RunExample.bat`
6. You should see the output of `$PSVersionTable`

## How to use in production

1. Do the steps above from 1 to 4
2. Edit and Rename `RunExample.bat` and `Example.ps1` as needed
3. Delete `PowerShell.zip` and `DownloadPowerShell.bat`
4. Zip your `bat`, `ps1`, and the `PowerShell` files and folders
5. Move you zip file to production
6. Extract and run you `bat` file
