@echo off
if "%1"=="reenter" goto :reenter
call datetime.cmd
set DOCMD=%1 %2 %3 %4 %5 %6 %7 %8 %9
set BASEDIR=%USERPROFILE%\repos
set logfile=%USERPROFILE%\multi_%datetime%.log

call %0 reenter | tee -a %logfile%
goto :eof
:reenter

call :gen
call :jars
call :wars
goto :done


:all
call :poms
call :gen
call :platform
call :apps
exit /b
:gen
call :generated
exit /b
:platform
call :jars
call :wars
exit /b
:apps
call :biz
exit /b


:poms
call :BUILDPRJ xxxxx
exit /b
:generated
call :BUILDPRJ yyyyyyyyy
call :BUILDPRJ zzzzzzzzz
exit /b
:jars
call :BUILDPRJ aaaaaaaa
call :BUILDPRJ bbbbbb
exit /b
:wars
call :BUILDPRJ ccccccccc
call :BUILDPRJ ddddddddddd
exit /b
:biz
call :BUILDPRJ eeeeeeee
call :BUILDPRJ fffffffffff
exit /b


:BUILDPRJ
title %DOCMD%  -  %1
cd %BASEDIR%\%1 
call datetime.cmd
echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
echo BEGIN  %datetime%               %1      
echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
SET X=SUCCESS
call %DOCMD% 
IF ERRORLEVEL 1 SET X=FAILURE
call datetime.cmd
echo ------------------------------------------------------
echo END:   %datetime%    %X%    %1          
echo ------------------------------------------------------
echo.
echo.
IF "%X%"=="FAILURE" PAUSE
echo.
exit /b

:done
notepad %logfile%
goto :eof
