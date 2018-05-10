@ECHO OFF
REM http://ss64.com/ps/syntax-dateformats.html
SETLOCAL 
SET "_format=yyyyMMddHHmmss.ffffff.tt.zzz"
SET "_varname=DATETIME"
IF NOT "%~1"=="" SET "_format=%~1"
IF NOT "%~2"=="" SET "_varname=%~2"
FOR /f %%G IN ('powershell get-date -format "{%_format%}"') DO SET _DT=%%G
ENDLOCAL & SET "%_varname%=%_DT%"
