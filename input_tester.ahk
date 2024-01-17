#Requires AutoHotkey v2.0
MsgBox(A_Args.Length )
for n, param in A_Args
    {
        MsgBox("Parameter " n " is " param ".")
    }