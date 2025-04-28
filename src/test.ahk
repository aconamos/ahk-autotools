#SingleInstance, Force
#MaxThreads, 8
#MaxThreadsPerHotkey, 2
#Include, ..\lib\liboverlay_2.ahk


SendMode Input
SetWorkingDir, %A_ScriptDir%

WinID := Overlay_CreateGUI("Handle1")
LeftClickerOverlayID := Overlay_CreateGUI("LeftClickerOverlay", 3, 0, 0xFF0000)
Gui, LeftClickerOverlay: Font, S14 bold
Gui, LeftClickerOverlay: Add, Text,, L
Gui, LeftClickerOverlay: Show, X1880 Y0 W20 H20 NoActivate
RightClickerOverlayID := Overlay_CreateGUI("RightClickerOverlay", 3, 0, 0xFF0000)
Gui, RightClickerOverlay: Font, S14 bold
Gui, RightClickerOverlay: Add, Text,, L
Gui, RightClickerOverlay: Show, X1900 Y0 W20 H20 NoActivate

M::
    vOverlayToggle := !vOverlayToggle
Return

F7::
    ClickerToggle := !ClickerToggle
    If (!ClickerToggle) {
        Gui, LeftClickerOverlay: Color, 0xFF0000
    } Else {
        Gui, LeftClickerOverlay: Color, 0x00FF00
    }
Return

RAlt::
    OverlayToggle := !OverlayToggle
    

    If (OverlayToggle) {
        Overlay_GUIOn("Handle1", 1940, 1000)
    } Else {
        Overlay_GUIOff("Handle1")
    }
Return