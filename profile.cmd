@echo off
gpresult /user %username% /r >%userprofile%\gpo_%username%.txt
