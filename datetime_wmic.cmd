@ECHO OFF
REM http://ss64.com/ps/syntax-dateformats.html
::FOR /f %%G IN ('powershell get-date -format "{yyyyMMddHHmmss.ffffff.tt.zzz}"') DO SET _DT=%%G
FOR /f %%G IN ('wmic os get localdatetime ^|find "."') DO CALL SET _DT=%%G
SET _DT.STAMP=%_DT:~0,14%
SET _DT.Y4=%_DT:~0,4%
SET _DT.Y2=%_DT:~2,2%
SET _DT.MO=%_DT:~4,2%
SET _DT.DD=%_DT:~6,2%
SET _DT.HH=%_DT:~8,2%
SET _DT.MN=%_DT:~10,2%
SET _DT.SS=%_DT:~12,2%
SET _DT.FS=%_DT:~15,6%
SET _DT.TT=%_DT:~22,2%
SET _DT.ZZ=%_DT:~25%
SET _DT.YMD=%_DT:~0,8%
SET _DT.HMS=%_DT:~8,6%
SET _DT.ISO8601=%_DT.Y4%-%_DT.MO%-%_DT.DD%T%_DT.HH%:%_DT.MN%:%_DT.SS%
SET _DT.STAMP=%_DT:~0,14%
EXIT /b
