@echo off
cd /d "%~dp0"
setlocal enabledelayedexpansion

for /f "tokens=1,* delims==" %%A in ('findstr /R "^export " config.env') do (
    set "%%A=%%B"
)

restic backup ../server/ --exclude-file="restic-ignore" -vv
pause
