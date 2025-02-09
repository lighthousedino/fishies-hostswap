@echo off
cd /d "%~dp0"

for /f "tokens=1,* delims==" %%A in ('findstr /R "^export " config.env') do (
    set "%%A=%%B"
)

restic restore latest --target .. --overwrite if-changed ^
    --delete --include "/server/**" --exclude-file="restic-ignore" -vv
pause
