#SingleInstance, Force
#MaxThreads, 8
#MaxThreadsPerHotkey, 2
#Include, ..\lib\liboverlay_2.ahk


SendMode Input
SetWorkingDir, %A_ScriptDir%

LeftClickerOverlayID := Overlay_CreateGUI("LeftClickerOverlay", 3, 0, 0xFF0000)
Gui, LeftClickerOverlay: Font, S14 bold
Gui, LeftClickerOverlay: Add, Text,, L
Gui, LeftClickerOverlay: Show, X1880 Y0 W20 H20 NoActivate
RightClickerOverlayID := Overlay_CreateGUI("RightClickerOverlay", 3, 0, 0xFF0000)
Gui, RightClickerOverlay: Font, S14 bold
Gui, RightClickerOverlay: Add, Text,, L
Gui, RightClickerOverlay: Show, X1900 Y0 W20 H20 NoActivate

F9::
    ExitApp, 0
Return

F8::
    RightClicker := !RightClicker
    If (!RightClicker) {
        Gui, RightClickerOverlay: Color, 0xFF0000
    } Else {
        Gui, RightClickerOverlay: Color, 0x00FF00
    }
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
    If (!LeftClicker) {
        Gui, LeftClickerOverlay: Color, 0xFF0000
    } Else {
        Gui, LeftClickerOverlay: Color, 0x00FF00
    }
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