#SingleInstance, Force
#MaxThreadsPerHotkey 3

F7::
Toggle := !Toggle
Loop
{
	If (!Toggle)
		Break
	Click, Left
	Sleep 10
}