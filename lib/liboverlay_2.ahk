; First are the single-GUI functions.

Setup(GUIHandle) {
	WinID := Overlay_CreateGUI(%GUIHandle%, 3, 0, 0xFF0000)
	Gui, LeftClickerOverlay: Font, S14 bold
	Gui, LeftClickerOverlay: Add, Text,, L
	Gui, LeftClickerOverlay: Show, X1880 Y0 W20 H20 NoActivate
}

Overlay_CreateGUI(GUIHandle, LRM:=16, TBM:=4, BGC:=333333) {  ; LRM: left & right margin, TBM: top & bottom margin

	Gui, %GUIHandle%: +AlwaysOnTop +ToolWindow -Caption +E0x20 ; Click through GUI always on top.
	Gui, %GUIHandle%: Color, %BGC%
	Gui, %GUIHandle%: Margin, %LRM%, %TBM%
	Gui, %GUIHandle%: +LastFound

	OverlayWin := WinExist()
	Return OverlayWin
}

Overlay_GUIOn(GUIHandle, xPos:=100, yPos:=100, width:=100, height:=100) {
	Gui, %GUIHandle%: Show, X%xPos% Y%yPos% W%width% H%height% NoActivate
}

Overlay_GUIOff(GUIHandle) {
	Gui, %GUIHandle%: Hide, NoActivate
}