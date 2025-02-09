@echo off
cd /d "%~dp0"

for /f "usebackq tokens=1,* delims==" %%A in ("config.env") do (
    echo %%A | findstr /r "^\s*#">nul
    if errorlevel 1 (
        set "%%A=%%B"
    )
)

restic restore latest --target .. --overwrite if-changed ^
    --delete --include "/server/**" --exclude-file="restic-ignore" -vv
pause
