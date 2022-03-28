#SingleInstance, Force
#MaxThreads, 8
#MaxThreadsPerHotkey, 2
#Include, ..\lib\liboverlay_2.ahk


SendMode Input
SetWorkingDir, %A_ScriptDir%

WinID := Overlay_CreateGUI("AIDS")

M::
    vOverlayToggle := !vOverlayToggle
Return

RAlt::
    OverlayToggle := !OverlayToggle
    

    If (OverlayToggle) {
        Overlay_GUIOn("AIDS", 1940, 1000)
    } Else {
        Overlay_GUIOff("AIDS")
    }
Return