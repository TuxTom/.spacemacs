@ECHO OFF
SET HOME=
if "%1"=="" GOTO NOBLOCK

C:\Tools\emacs\emacs-24.4\bin\emacsclient.exe -c %*
GOTO DONE

:NOBLOCK
C:\Tools\emacs\emacs-24.4\bin\emacsclient.exe -n -c %*

:DONE