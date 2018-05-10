@ECHO OFF
REM %1 environment variable to SET
REM %2 property file
REM %3 property name (optional)
REM %4 default value (optional)
IF NOT [%4]==[] SET %1=%4
SETLOCAL
SET "PROP_FILE=%2"
SET "PROP_NAME=%3"
SET "PROP_VAL=%4"
IF NOT EXIST "%PROP_FILE%" EXIT /b 1
IF [%PROP_NAME%]==[] SET PROP_NAME=%1
FOR /f "tokens=1,2 delims==" %%a IN ('find "%PROP_NAME%" %PROP_FILE%') DO CALL :CHECK %%a %%b
ENDLOCAL & CALL SET "%1=%PROP_VAL%"
EXIT /B
:CHECK
IF [%PROP_NAME%]==[%1] SET "PROP_VAL=%2"
EXIT /B

