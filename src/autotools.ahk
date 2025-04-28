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
Gui, RightClickerOverlay: Add, Text,, R
Gui, RightClickerOverlay: Show, X1900 Y0 W20 H20 NoActivate
WalkerOverlayID := Overlay_CreateGUI("WalkerOverlay", 3, 0, 0xFF0000)
Gui, WalkerOverlay: Font, S14 bold
Gui, WalkerOverlay: Add, Text,, W
Gui, WalkerOverlay: Show, X1850 Y0 W30 H20 NoActivate
WalkerOverlayID := Overlay_CreateGUI("AAFKOverlay", 3, 0, 0xFF0000)
Gui, AAFKOverlay: Font, S14 bold
Gui, AAFKOverlay: Add, Text,, AFK
Gui, AAFKOverlay: Show, X1800 Y0 W50 H20 NoActivate


F9::
    ExitApp, 0
Return

RAlt::
    OverlayToggle := !OverlayToggle
    If (OverlayToggle) {
        Gui, LeftClickerOverlay: Hide
        Gui, RightClickerOverlay:  Hide
        Gui, WalkerOverlay: Hide
        Gui, AAFKOverlay: Hide
    } Else {
        Gui, LeftClickerOverlay: Show, NoActivate
        Gui, RightClickerOverlay: Show, NoActivate
        Gui, WalkerOverlay: Show, NoActivate
        Gui, AAFKOverlay: Show, NoActivate
    }
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

    If (!WalkerToggle) {
        Gui, WalkerOverlay: Color, 0xFF0000
        Send, {w up}
    } Else {
        Gui, WalkerOverlay: Color, 0x00FF00
        Send, {w down}
    }
Return

F5::
    AAFKToggle := !AAFKToggle
    If (!AAFKToggle) {
        Gui, AAFKOverlay: Color, 0xFF0000
    } Else {
        Gui, AAFKOverlay: Color, 0x00FF00
    }
    Loop 
    {
        If (!AAFKToggle)
            Break
        Send, {w down}
        Sleep, 1500
        Send, {w up}
        Sleep, 1500
        Send, {s down}
        Sleep, 1500
        Send, {s up}
        Sleep, 15000
    }
Return