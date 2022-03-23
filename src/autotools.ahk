#SingleInstance, Force
#MaxThreadsPerHotkey 3

SendMode Input
SetWorkingDir, %A_ScriptDir%

F7::
ClickerToggle := !ClickerToggle
Loop
{
	If (!ClickerToggle)
		Break
	Click, Left
	Sleep 10
}

F6::
WalkerToggle := !WalkerToggle
If (!WalkerToggle)
    Send, {w up}
Else
    Send, {w down}