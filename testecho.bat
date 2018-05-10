@echo off
rem setlocal DisbaleExtensions
echo echo Failure in "%%~0" > testecho_temp.bat
set "emptyVar="
set "var=\..\testecho_temp.bat"
set "questionMark=/?"
set "msgEmptyLine=###### The next line should be empty"
set "msgEnd=###### END OF CURRENT TEST ######"

call :one
call :two
call :three
echo > echo
call :one
call :two
call :three
if exist echo del echo

setlocal Enabledelayedexpansion
call :d-one
call :d-two
call :d-three
echo > echo
call :d-one
call :d-two
call :d-three
if exist echo del echo


if exist testecho_temp.bat del testecho_temp.bat
exit /b

:one
echo ###### Test echo(
echo %msgEmptyLine%
echo(
echo %msgEmptyLine%
echo(%emptyVar%
echo ###### The next three lines should contain sensible text, followed by a blank line
echo(%var:~1,3%
echo(%var%
echo(%questionMark%
echo(
echo %msgEnd%
exit /b

:two
echo ###### Test echo.
echo %msgEmptyLine%
echo.
echo %msgEmptyLine%
echo.%emptyVar%
echo ###### The next three lines should contain sensible text, followed by a blank line
echo.%var:~1,3%
echo.%var%
echo.%questionMark%
echo.
echo %msgEnd%
exit /b

:three
echo ###### Test echo:
echo %msgEmptyLine%
echo:
echo %msgEmptyLine%
echo:%emptyVar%
echo ###### The next three lines should contain sensible text, followed by a blank line
echo:%var:~1,3%
echo:%var%
echo:%questionMark%
echo:
echo %msgEnd%
exit /b

:d-one
echo ###### Test echo(
echo %msgEmptyLine%
echo(
echo %msgEmptyLine%
echo(!emptyVar!
echo ###### The next three lines should contain sensible text, followed by a blank line
echo(!var:~1,3!
echo(!var!
echo(!questionMark!
echo(
echo %msgEnd%
exit /b

:d-two
echo ###### Test echo.
echo %msgEmptyLine%
echo.
echo %msgEmptyLine%
echo.!emptyVar!
echo ###### The next three lines should contain sensible text, followed by a blank line
echo.!var:~1,3!
echo.!var!
echo.!questionMark!
echo.
echo %msgEnd%
exit /b

:d-three
echo ###### Test echo:
echo %msgEmptyLine%
echo:
echo %msgEmptyLine%
echo:!emptyVar!
echo ###### The next three lines should contain sensible text, followed by a blank line
echo:!var:~1,3!
echo:!var!
echo:!questionMark!
echo:
echo %msgEnd%
exit /b
