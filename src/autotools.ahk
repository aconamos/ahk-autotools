#SingleInstance, Force
#MaxThreads, 8
#MaxThreadsPerHotkey, 2
#Include, ..\lib\liboverlay.ahk


SendMode Input
SetWorkingDir, %A_ScriptDir%


F9::
    ExitApp, 0
Return

F8::
    RightClicker := !RightClicker
    Loop 
    {
        If (!RightClicker)
            Break
        Click, Left
        Sleep, 10
    }
Return

F7::
    LeftClicker := !LeftClicker
    Loop
    {
        If (!LeftClicker)
            Break
        Click, Left
        Sleep, 10
    }
Return

F6::
    WalkerToggle := !WalkerToggle
    If (!WalkerToggle)
        Send, {w up}
    Else
        Send, {w down}
Return