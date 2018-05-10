@ECHO OFF
REM http://ss64.com/ps/syntax-dateformats.html
FOR /f %%G IN ('powershell get-date -format "{yyyyMMddHHmmss.ffffff.tt.zzz}"') DO SET _DT=%%G
SET _DT.STAMP=%_DT:~0,14%
::SET _DT.YYYY=%_DT:~0,4%
::SET _DT.YY=%_DT:~2,2%
::SET _DT.MONTH=%_DT:~4,2%
::SET _DT.DAY=%_DT:~6,2%
::SET _DT.HOUR=%_DT:~8,2%
::SET _DT.MIN=%_DT:~10,2%
::SET _DT.SEC=%_DT:~12,2%
::SET _DT.MICRO=%_DT:~15,6%
::SET _DT.MILLI=%_DT:~15,3%
::SET _DT.TT=%_DT:~22,2%
::SET _DT.ZZZ=%_DT:~25%
SET _DT.YMD=%_DT:~0,8%
SET _DT.HMS=%_DT:~8,6%
EXIT /b
