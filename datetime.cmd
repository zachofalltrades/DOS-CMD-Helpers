@echo off
for /f %%a in ('powershell get-date -format "{%1}"') do set DATETIME=%%a
