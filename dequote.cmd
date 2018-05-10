@ECHO OFF
FOR /f "delims=" %%A IN ('ECHO %%%1%%') DO SET %1=%%~A
