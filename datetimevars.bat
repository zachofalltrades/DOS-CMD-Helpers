@echo off
set "WT=%TIME%"
set "DT=%DATE%"
set date.Y4=%DT:~10,4%
set date.YY=%DT:~12,2%
set date.MM=%DT:~4,2%
set date.DD=%DT:~7,2%
set date.DW=%DT:~0,3%
set time.HH=%WT:~0,2%
set time.MM=%WT:~3,2%
set time.SS=%WT:~6,2%
set time.CC=%WT:~9,2%
set time.AP=PM
If /I %time.HH% LSS 10 (
   Set time.HH=0%time.HH:~1,1%
)
If /I %time.HH% LSS 12 (
   Set time.AP=AM
   Set time.12=%time.HH%
)  Else (
   Set /a time.12=%time.HH%-12
)
If /I %time.MM% LSS 10 (
   Set time.MM=0%time.MM:~1,1%
)
If /I %time.SS% LSS 10 (
   Set time.SS=0%time.SS:~1,1%
)
If /I %time.12% lss 10 (
   Set time.12=0%time.12%
)
