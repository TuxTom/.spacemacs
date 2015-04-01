strName = "C:\Tools\emacs\emacs-24.4\bin\emacsclientw.exe -na C:\Tools\emacs\emacs-24.4\bin\runemacs.exe"

strArgs = ""
If WScript.Arguments.Count > 0 Then
    For i = 0 To WScript.Arguments.Count - 1
        strArgs = strArgs & " " & WScript.Arguments.Item(i)
    Next
End If

Set wshShell = CreateObject( "WScript.Shell" )
Set wshSystemEnv = wshShell.Environment( "PROCESS" )

wshSystemEnv.Remove( "HOME" )
wshShell.Run strName & strArgs, 0

Set wshSystemEnv = Nothing
Set wshShell = Nothing