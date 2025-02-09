@echo off
cd /d "%~dp0"
setlocal enabledelayedexpansion

for /f "usebackq tokens=1,* delims==" %%A in ("config.env") do (
    echo %%A | findstr /r "^\s*#">nul
    if errorlevel 1 (
        set "%%A=%%B"
    )
)

restic backup ../server/ --exclude-file="restic-ignore" -vv
pause
