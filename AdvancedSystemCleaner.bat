@echo off
color 0a
title Advanced System Cleaning Utility
:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )
:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
    "%temp%\getadmin.vbs"
    exit /B
:gotAdmin
    if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )
    pushd "%CD%"
    CD /D "%~dp0"
:--------------------------------------

echo ===================================================
echo        ADVANCED SYSTEM CLEANING UTILITY
echo ===================================================
echo.
echo This utility will perform comprehensive system maintenance
echo to improve performance and free up disk space.
echo.
echo OPTIONS:
echo [1] Run Quick Clean (Basic temp files only)
echo [2] Run Standard Clean (Recommended)
echo [3] Run Deep Clean (Most thorough - takes longer)
echo [4] Exit
echo.
set /p choice=Enter your choice (1-4): 

if "%choice%"=="4" exit
if "%choice%"=="1" goto QuickClean
if "%choice%"=="2" goto StandardClean
if "%choice%"=="3" goto DeepClean
goto Start

:CreateLogFile
echo ===================================================>> %USERPROFILE%\Desktop\CleaningLog.txt
echo        SYSTEM CLEANING LOG - %date% %time%>> %USERPROFILE%\Desktop\CleaningLog.txt
echo ===================================================>> %USERPROFILE%\Desktop\CleaningLog.txt
echo.>> %USERPROFILE%\Desktop\CleaningLog.txt
goto :eof

:QuickClean
call :CreateLogFile
echo Running Quick Clean...
echo Running Quick Clean...>> %USERPROFILE%\Desktop\CleaningLog.txt

echo.
echo [Step 1/3] Removing temporary files...
echo [Step 1/3] Removing temporary files...>> %USERPROFILE%\Desktop\CleaningLog.txt

REM Clean Windows Temp
del /s /f /q C:\Windows\Temp\*.*
echo - Windows Temp files removed>> %USERPROFILE%\Desktop\CleaningLog.txt

REM Clean User Temp
del /s /f /q %temp%\*.*
echo - User Temp files removed>> %USERPROFILE%\Desktop\CleaningLog.txt

echo.
echo [Step 2/3] Flushing DNS cache...
echo [Step 2/3] Flushing DNS cache...>> %USERPROFILE%\Desktop\CleaningLog.txt
ipconfig /flushdns
echo - DNS cache flushed>> %USERPROFILE%\Desktop\CleaningLog.txt

echo.
echo [Step 3/3] Cleaning browser caches...
echo [Step 3/3] Cleaning browser caches...>> %USERPROFILE%\Desktop\CleaningLog.txt

REM Chrome Cache (if exists)
if exist "%LOCALAPPDATA%\Google\Chrome\User Data\Default\Cache" (
    del /s /f /q "%LOCALAPPDATA%\Google\Chrome\User Data\Default\Cache\*.*"
    echo - Chrome cache cleaned>> %USERPROFILE%\Desktop\CleaningLog.txt
)

REM Edge Cache (if exists)
if exist "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Cache" (
    del /s /f /q "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Cache\*.*"
    echo - Edge cache cleaned>> %USERPROFILE%\Desktop\CleaningLog.txt
)

goto Completed

:StandardClean
call :CreateLogFile
echo Running Standard Clean...
echo Running Standard Clean...>> %USERPROFILE%\Desktop\CleaningLog.txt

echo.
echo [Step 1/6] Removing temporary files...
echo [Step 1/6] Removing temporary files...>> %USERPROFILE%\Desktop\CleaningLog.txt

REM Clean Windows Temp
del /s /f /q C:\Windows\Temp\*.*
rmdir /s /q C:\Windows\Temp
mkdir C:\Windows\Temp
echo - Windows Temp files removed>> %USERPROFILE%\Desktop\CleaningLog.txt

REM Clean User Temp
del /s /f /q %temp%\*.*
rmdir /s /q %temp%
mkdir %temp%
echo - User Temp files removed>> %USERPROFILE%\Desktop\CleaningLog.txt

REM Clean Prefetch
del /s /f /q C:\Windows\Prefetch\*.*
echo - Prefetch files removed>> %USERPROFILE%\Desktop\CleaningLog.txt

echo.
echo [Step 2/6] Emptying Recycle Bin...
echo [Step 2/6] Emptying Recycle Bin...>> %USERPROFILE%\Desktop\CleaningLog.txt
rd /s /q %systemdrive%\$Recycle.Bin
echo - Recycle Bin emptied>> %USERPROFILE%\Desktop\CleaningLog.txt

echo.
echo [Step 3/6] Cleaning Windows Update cache...
echo [Step 3/6] Cleaning Windows Update cache...>> %USERPROFILE%\Desktop\CleaningLog.txt
net stop wuauserv
del /s /f /q C:\Windows\SoftwareDistribution\*.*
net start wuauserv
echo - Windows Update cache cleaned>> %USERPROFILE%\Desktop\CleaningLog.txt

echo.
echo [Step 4/6] Flushing DNS and resetting network...
echo [Step 4/6] Flushing DNS and resetting network...>> %USERPROFILE%\Desktop\CleaningLog.txt
ipconfig /flushdns
netsh winsock reset
echo - DNS cache flushed>> %USERPROFILE%\Desktop\CleaningLog.txt
echo - Winsock reset>> %USERPROFILE%\Desktop\CleaningLog.txt

echo.
echo [Step 5/6] Cleaning browser caches...
echo [Step 5/6] Cleaning browser caches...>> %USERPROFILE%\Desktop\CleaningLog.txt

REM Chrome Cache (if exists)
if exist "%LOCALAPPDATA%\Google\Chrome\User Data\Default\Cache" (
    del /s /f /q "%LOCALAPPDATA%\Google\Chrome\User Data\Default\Cache\*.*"
    echo - Chrome cache cleaned>> %USERPROFILE%\Desktop\CleaningLog.txt
)

REM Edge Cache (if exists)
if exist "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Cache" (
    del /s /f /q "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Cache\*.*"
    echo - Edge cache cleaned>> %USERPROFILE%\Desktop\CleaningLog.txt
)

REM Firefox Cache (if exists)
if exist "%LOCALAPPDATA%\Mozilla\Firefox\Profiles" (
    del /s /f /q "%LOCALAPPDATA%\Mozilla\Firefox\Profiles\*\cache2\*.*"
    echo - Firefox cache cleaned>> %USERPROFILE%\Desktop\CleaningLog.txt
)

echo.
echo [Step 6/6] Running Disk Cleanup utility...
echo [Step 6/6] Running Disk Cleanup utility...>> %USERPROFILE%\Desktop\CleaningLog.txt
cleanmgr /sagerun:1
echo - Disk Cleanup utility executed>> %USERPROFILE%\Desktop\CleaningLog.txt

goto Completed

:DeepClean
call :CreateLogFile
echo Running Deep Clean...
echo Running Deep Clean...>> %USERPROFILE%\Desktop\CleaningLog.txt

echo.
echo [Step 1/10] Removing temporary files...
echo [Step 1/10] Removing temporary files...>> %USERPROFILE%\Desktop\CleaningLog.txt

REM Clean Windows Temp
del /s /f /q C:\Windows\Temp\*.*
rmdir /s /q C:\Windows\Temp
mkdir C:\Windows\Temp
echo - Windows Temp files removed>> %USERPROFILE%\Desktop\CleaningLog.txt

REM Clean User Temp
del /s /f /q %temp%\*.*
rmdir /s /q %temp%
mkdir %temp%
echo - User Temp files removed>> %USERPROFILE%\Desktop\CleaningLog.txt

REM Clean Prefetch
del /s /f /q C:\Windows\Prefetch\*.*
echo - Prefetch files removed>> %USERPROFILE%\Desktop\CleaningLog.txt

echo.
echo [Step 2/10] Emptying Recycle Bin...
echo [Step 2/10] Emptying Recycle Bin...>> %USERPROFILE%\Desktop\CleaningLog.txt
rd /s /q %systemdrive%\$Recycle.Bin
echo - Recycle Bin emptied>> %USERPROFILE%\Desktop\CleaningLog.txt

echo.
echo [Step 3/10] Cleaning Windows Update cache...
echo [Step 3/10] Cleaning Windows Update cache...>> %USERPROFILE%\Desktop\CleaningLog.txt
net stop wuauserv
del /s /f /q C:\Windows\SoftwareDistribution\*.*
net start wuauserv
echo - Windows Update cache cleaned>> %USERPROFILE%\Desktop\CleaningLog.txt

echo.
echo [Step 4/10] Cleaning Event Logs...
echo [Step 4/10] Cleaning Event Logs...>> %USERPROFILE%\Desktop\CleaningLog.txt
for /F "tokens=*" %%G in ('wevtutil el') do (wevtutil cl "%%G")
echo - Event logs cleared>> %USERPROFILE%\Desktop\CleaningLog.txt

echo.
echo [Step 5/10] Cleaning Font Cache...
echo [Step 5/10] Cleaning Font Cache...>> %USERPROFILE%\Desktop\CleaningLog.txt
net stop fontcache
del /f /s /q %windir%\ServiceProfiles\LocalService\AppData\Local\FontCache\*.*
del /f /s /q %windir%\ServiceProfiles\LocalService\AppData\Local\FontCache-System\*.*
net start fontcache
echo - Font cache cleaned>> %USERPROFILE%\Desktop\CleaningLog.txt

echo.
echo [Step 6/10] Cleaning Thumbnail Cache...
echo [Step 6/10] Cleaning Thumbnail Cache...>> %USERPROFILE%\Desktop\CleaningLog.txt
del /f /s /q %userprofile%\AppData\Local\Microsoft\Windows\Explorer\thumbcache_*.db
echo - Thumbnail cache cleaned>> %USERPROFILE%\Desktop\CleaningLog.txt

echo.
echo [Step 7/10] Flushing DNS and resetting network...
echo [Step 7/10] Flushing DNS and resetting network...>> %USERPROFILE%\Desktop\CleaningLog.txt
ipconfig /flushdns
ipconfig /release
ipconfig /renew
netsh winsock reset
netsh int ip reset
echo - DNS cache flushed>> %USERPROFILE%\Desktop\CleaningLog.txt
echo - IP configuration reset>> %USERPROFILE%\Desktop\CleaningLog.txt
echo - Winsock reset>> %USERPROFILE%\Desktop\CleaningLog.txt
echo - TCP/IP stack reset>> %USERPROFILE%\Desktop\CleaningLog.txt

echo.
echo [Step 8/10] Cleaning browser caches...
echo [Step 8/10] Cleaning browser caches...>> %USERPROFILE%\Desktop\CleaningLog.txt

REM Chrome Cache (if exists)
if exist "%LOCALAPPDATA%\Google\Chrome\User Data\Default\Cache" (
    del /s /f /q "%LOCALAPPDATA%\Google\Chrome\User Data\Default\Cache\*.*"
    del /s /f /q "%LOCALAPPDATA%\Google\Chrome\User Data\Default\Code Cache\*.*"
    echo - Chrome cache cleaned>> %USERPROFILE%\Desktop\CleaningLog.txt
)

REM Edge Cache (if exists)
if exist "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Cache" (
    del /s /f /q "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Cache\*.*"
    del /s /f /q "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Code Cache\*.*"
    echo - Edge cache cleaned>> %USERPROFILE%\Desktop\CleaningLog.txt
)

REM Firefox Cache (if exists)
if exist "%LOCALAPPDATA%\Mozilla\Firefox\Profiles" (
    del /s /f /q "%LOCALAPPDATA%\Mozilla\Firefox\Profiles\*\cache2\*.*"
    echo - Firefox cache cleaned>> %USERPROFILE%\Desktop\CleaningLog.txt
)

echo.
echo [Step 9/10] Cleaning Windows Defender cache...
echo [Step 9/10] Cleaning Windows Defender cache...>> %USERPROFILE%\Desktop\CleaningLog.txt
if exist "C:\ProgramData\Microsoft\Windows Defender\Scans\History\" (
    rmdir /s /q "C:\ProgramData\Microsoft\Windows Defender\Scans\History\"
    echo - Windows Defender cache cleaned>> %USERPROFILE%\Desktop\CleaningLog.txt
)

echo.
echo [Step 10/10] Running advanced Disk Cleanup and system optimization...
echo [Step 10/10] Running advanced Disk Cleanup and system optimization...>> %USERPROFILE%\Desktop\CleaningLog.txt

REM Set up and run Disk Cleanup with all options
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Active Setup Temp Folders" /v StateFlags0001 /t REG_DWORD /d 2 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\BranchCache" /v StateFlags0001 /t REG_DWORD /d 2 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Downloaded Program Files" /v StateFlags0001 /t REG_DWORD /d 2 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Internet Cache Files" /v StateFlags0001 /t REG_DWORD /d 2 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Memory Dump Files" /v StateFlags0001 /t REG_DWORD /d 2 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Old ChkDsk Files" /v StateFlags0001 /t REG_DWORD /d 2 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Previous Installations" /v StateFlags0001 /t REG_DWORD /d 2 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Recycle Bin" /v StateFlags0001 /t REG_DWORD /d 2 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Service Pack Cleanup" /v StateFlags0001 /t REG_DWORD /d 2 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Setup Log Files" /v StateFlags0001 /t REG_DWORD /d 2 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\System error memory dump files" /v StateFlags0001 /t REG_DWORD /d 2 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\System error minidump files" /v StateFlags0001 /t REG_DWORD /d 2 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Temporary Files" /v StateFlags0001 /t REG_DWORD /d 2 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Temporary Setup Files" /v StateFlags0001 /t REG_DWORD /d 2 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Thumbnail Cache" /v StateFlags0001 /t REG_DWORD /d 2 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Update Cleanup" /v StateFlags0001 /t REG_DWORD /d 2 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Upgrade Discarded Files" /v StateFlags0001 /t REG_DWORD /d 2 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\User file versions" /v StateFlags0001 /t REG_DWORD /d 2 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Windows Defender" /v StateFlags0001 /t REG_DWORD /d 2 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Windows Error Reporting Archive Files" /v StateFlags0001 /t REG_DWORD /d 2 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Windows Error Reporting Queue Files" /v StateFlags0001 /t REG_DWORD /d 2 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Windows Error Reporting System Archive Files" /v StateFlags0001 /t REG_DWORD /d 2 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Windows Error Reporting System Queue Files" /v StateFlags0001 /t REG_DWORD /d 2 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Windows ESD installation files" /v StateFlags0001 /t REG_DWORD /d 2 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Windows Upgrade Log Files" /v StateFlags0001 /t REG_DWORD /d 2 /f

cleanmgr /sagerun:1
echo - Advanced Disk Cleanup completed>> %USERPROFILE%\Desktop\CleaningLog.txt

REM Run system file checker
echo Running System File Checker to repair system files...>> %USERPROFILE%\Desktop\CleaningLog.txt
sfc /scannow
echo - System File Checker completed>> %USERPROFILE%\Desktop\CleaningLog.txt

REM Defragment system drive
echo Running disk defragmentation...>> %USERPROFILE%\Desktop\CleaningLog.txt
defrag %systemdrive% /U /V
echo - Disk defragmentation completed>> %USERPROFILE%\Desktop\CleaningLog.txt

goto Completed

:Completed
echo.
echo ===================================================
echo Cleaning process completed successfully!
echo ===================================================
echo.
echo A detailed log has been saved to your Desktop as CleaningLog.txt
echo.
echo System Status:
echo - Temporary files removed
echo - System caches cleared
echo - DNS cache reset
echo - IP configuration refreshed (if needed)
echo.
echo Press any key to exit...
pause > nul
exit