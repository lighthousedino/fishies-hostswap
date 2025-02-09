@echo off
cd /d "%~dp0"
setlocal enabledelayedexpansion

for /f "delims=" %%x in (config.env) do set %%x

restic backup ../server/ --exclude-file="restic-ignore" -vv
pause
