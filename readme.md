# Standalone PowerShell Template

## Description

This is an example template. It has a batch script for downloading the latest release version of PowerShell from GitHub, and a batch script to run a PowerShell script with that version of PowerShell.

## Reason behind creation

I've seen a few environments where upgrading PowerShell isn't an option for one reason or another. This gives the option to not have to upgrade PowerShell and yet still use the latest version of PowerShell. Allowing you to run PowerShell scripts with thier own packaged version of PowerShell. From my testing .Net 5.0 isn't required as the PowerShell zip from Github comes with everything needed to run it.

## Requirements

* PowerShell 2.0 or greater
* Server 2008 or greater
* A little bit of Batch and PowerShell knowledge to get a PowerShell script to run

## Run a PowerShell script with PowerShell 7 with out installing PowerShell 7

1. Copy the files in this repository into a folder
2. Navigate to that folder
3. Double click on `DownloadPowerShell.bat` or run `DownloadPowerShell.ps1` in a PowerShell(version 5.1 or less) session
4. Wait for PowerShell to download and extract into the `PowerShell\` folder
5. Double click on `RunExample.bat`
6. You should see the output of `$PSVersionTable`

## How to use in production

1. Do the steps above from 1 to 4
2. Edit and Rename `RunExample.bat` and `Example.ps1` as needed
3. Delete `PowerShell.zip` and `DownloadPowerShell.bat` and/or `DownloadPowerShell.ps1`
4. Zip your `bat` and `ps1` files, and the `PowerShell` folder
5. Move your zip file to production
6. Extract and run your `bat` file
