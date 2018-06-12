@echo off
FOR /f %%G IN ('powershell get-date -format "{yyyy-MM-dd-HHmmss}"') DO SET _DT=%%G
set _logfile=%USERPROFILE%\dev_tools.log
set _zipfile=%USERPROFILE%\%_DT%.zip
set _pathspecs=%USERPROFILE%\workspace %USERPROFILE%\Documents %USERPROFILE%\Pictures 
set _netlocation=%HOMEDRIVE%

call checkdevtools >%_logfile% 2>&1
call :dirlist %HOMEDRIVE%\install
call :dirlist %USERPROFILE%\opt
call :dirlist %USERPROFILE%\bin

copy "%LOCALAPPDATA%\Google\Chrome\User Data\Default\Bookmarks" %USERPROFILE%\Documents\chrome_bookmarks.json

7z a -tzip -xr!*.exe -xr!*.chm -xr!repository %_zipfile% %_logfile% %USERPROFILE%\.gitconfig %USERPROFILE%\bin %USERPROFILE%\.m2 
7z a -tzip -xr!.* -xr!bin -xr!lib -xr!My* -xr!classes -xr!target -xr!*.exe -xr!*.jar -xr!*.lnk -xr!*.zip -xr!*.log -xr!*.dat %_zipfile% %_pathspecs%
move %_zipfile% %_netlocation%\
start explorer %_netlocation%\
exit /b

:dirlist
dir %1 >>%_logfile%
echo:>>%_logfile%
exit /b
