#SingleInstance, Force
#MaxThreadsPerHotkey 3

F6::
Toggle := !Toggle
If (!Toggle)
    Send, {w up}
Else
    Send, {w down}