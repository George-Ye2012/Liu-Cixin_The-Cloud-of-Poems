@echo off
title PoemCloud · Launching...
cd /d "%~dp0"

echo.
echo     *** PoemCloud ***
echo.

:: ---- Check Node.js ----
where node >nul 2>nul
if %errorlevel% neq 0 (
    echo   [X] Node.js not found
    echo   Install from https://nodejs.org/
    pause
    exit /b 1
)
echo   [1/3] Node.js: OK

:: ---- Kill old server on port 8080 ----
powershell -Command "try { $c=Get-NetTCPConnection -LocalPort 8080 -ErrorAction Stop; Stop-Process -Id $c.OwningProcess -Force } catch { }" >nul 2>&1

:: ---- Start server in new window ----
echo   [2/3] Starting server...
start "PoemCloud Server" node server.js

:: ---- Wait for server ----
echo   [3/3] Waiting for server...
set n=0
:loop
ping -n 2 127.0.0.1 >nul
set /a n+=1
powershell -Command "try {$r=Invoke-WebRequest 'http://127.0.0.1:8080/' -UseBasicParsing -TimeoutSec 2; exit 0} catch {exit 1}" >nul 2>&1
if %errorlevel% equ 0 goto done
if %n% lss 10 goto loop

echo   [X] Timeout: port 8080 not responding
pause
exit /b 1

:done
start "" http://127.0.0.1:8080/%E8%AF%97%E4%BA%91.html
echo   [OK] http://127.0.0.1:8080/%E8%AF%97%E4%BA%91.html
echo   Close server window to stop. Press any key...
pause >nul
