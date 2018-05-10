@echo off
for /f %%a in ('powershell get-date -uformat %%Y%%m%%d%%H%%M%%S') do set DATETIME=%%a
