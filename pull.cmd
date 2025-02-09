@echo off
cd /d "%~dp0"

for /f "delims=" %%x in (config.env) do set %%x

restic restore latest --target .. --overwrite if-changed ^
    --delete --include "/server/**" --exclude-file="restic-ignore" -vv
pause
