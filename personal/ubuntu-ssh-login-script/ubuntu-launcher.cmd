@echo off

REM Must Add VirtualBox to PATH manually first: C:\Program Files\Oracle\VirtualBox

REM Set the name of your virtual machine
set vmName="ubuntu-desktop" 

REM Check the VM's current state
VBoxManage showvminfo %vmName% | findstr /C:"running (since" > nul

if %errorlevel% == 1 (
  REM VM is not running - start it
  echo VM was not running. Starting VM...
  VBoxManage startvm %vmName% --type headless 2>NUL

  echo Please be patient while the VM boots up. Try running the script again in a few minutes.
) else (
  REM VM is already running
  echo VM is already on. Proceeding with SSH connection...
)

ssh 10.0.0.21

@echo on



