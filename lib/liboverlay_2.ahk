; First are the single-GUI functions.

Overlay_CreateGUI(GUIHandle, LRM:=16, TBM:=4, BGC:=333333) {  ; LRM: left & right margin, TBM: top & bottom margin

	Gui, %GUIHandle%: +AlwaysOnTop +ToolWindow -Caption +E0x20 ; Click through GUI always on top.
	Gui, %GUIHandle%: Color, %BGC%
	Gui, %GUIHandle%: Margin, %LRM%, %TBM%
	Gui, %GUIHandle%: +LastFound
	WinSet, Transparent, 180

	OverlayWin := WinExist()
	Return OverlayWin
}

Overlay_GUIOn(GUIHandle, xPos:=100, yPos:=100) {
	Gui, %GUIHandle%: Show, X%xPos%, Y%yPos%, NoActivate
}

Overlay_GUIOff(GUIHandle) {
	Gui, %GUIHandle%: Hide, NoActivate
}