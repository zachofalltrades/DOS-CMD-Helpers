@ECHO OFF

CALL :testloop datetime_wmic 50
CALL :testloop datetime_ps 50
EXIT /b

:testloop
ECHO BEGIN %1 %2 times at: %TIME%
FOR /L %%a IN (1,1,%2) DO CALL :test %1
ECHO END %1 %2 times at: %TIME%
SET _DT
EXIT /b

:test
CALL %1
EXIT /b