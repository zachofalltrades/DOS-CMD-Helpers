@ECHO OFF
SETLOCAL
SET "alpha="&FOR /f "delims=0123456789" %%a IN ("%~1") DO SET alpha=%%a
IF DEFINED alpha EXIT /B 1
EXIT /B 0
