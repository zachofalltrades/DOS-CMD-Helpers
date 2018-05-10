@echo off
call datetime.cmd
net user /domain %USERNAME%>%USERPROFILE%\%USERNAME%-%DATETIME%.log
