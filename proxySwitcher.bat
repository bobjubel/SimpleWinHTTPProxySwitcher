@ECHO OFF
CLS
ECHO 1.WinHTTP Proxy ON
ECHO 2.WinHTTP Proxy OFF
ECHO 3.WinHTTP Proxy Status
ECHO 4.Close BAT and reset Proxy
ECHO.

:REPEAT
CHOICE /C 1234 /M "What do you want to do?: "

:: Note - list ERRORLEVELS in decreasing order
IF ERRORLEVEL 4 GOTO END
IF ERRORLEVEL 3 GOTO ProxySTATUS
IF ERRORLEVEL 2 GOTO ProxyOFF
IF ERRORLEVEL 1 GOTO ProxyON

:ProxyON
netsh winhttp set proxy ENTER-PROXY-HERE
GOTO REPEAT

:ProxyOFF
netsh winhttp reset proxy
GOTO REPEAT

:ProxySTATUS
netsh winhttp show proxy
GOTO REPEAT

:END
netsh winhttp reset proxy
