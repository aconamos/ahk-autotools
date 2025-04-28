; First are the single-GUI functions.

Overlay_CreateGUI(LRM:=16, TBM:=4) {  ; LRM: left & right margin, TBM: top & bottom margin
	BGC = 333333

	Gui, 1: +AlwaysOnTop +ToolWindow -Caption +E0x20 ; Click through GUI always on top.
	Gui, 1: Color, %BGC%
	Gui, 1: Margin, %LRM%, %TBM%
	Gui, 1: +LastFound
	WinSet, Transparent, 180

	OverlayWin := WinExist()
	Return OverlayWin
}


Overlay_CreateRow(fontSize, textToShow) {
	TextFont := "Trebuchet MS Bold"
	; set some text colors to be chosen randomly, just for fun
	FGColorsList := ["AA8888", "88AA88", "8888AA", "AAAA88", "AA88AA", "88AAAA"]
	Random, randint, 1, % FGColorsList.MaxIndex()
	FGC := FGColorsList[randint]

	Gui, 1: Font, S%fontSize%, %TextFont%
	Gui, 1: Add, Text, xm y+0 center, %textToShow%
	Gui, 1: Add, Text, xp-3 yp-3 center c%FGC% BackgroundTrans, %textToShow%

	GuiControlGet, thisCtrl, hwnd, %textToShow%
	Return thisCtrl
}


; Set width of all gui controls to widest control
Overlay_UniformCtrlWidths() {
	CtrlWidth := 0  ; set variable to hold widest control found so far
	Gui, 1: +LastFound
	WinGet, cList, ControlListHwnd  ; get list of controls for the gui

	; Loop through once to find the widest button
	Loop, Parse, cList, "`n"
	{
		GuiControlGet, thisCtrl, Pos, %A_LoopField%
		If (thisCtrlW > CtrlWidth) {
			CtrlWidth := thisCtrlW + 5
		}
	}

	; Loop through second time to set all buttons to same width
	Loop, Parse, cList, "`n"
	{
		GuiControl, Move, %A_LoopField%, w%CtrlWidth%
	}
}

Overlay_GUIOn() {
	Gui, 1: Show, NoActivate
}

Overlay_GUIOff() {
	Gui, 1: Destroy
}

; show the final gui with both text controls (set some reasonable default values for size)
Overlay_ShowGUI(showTime:=1000) {
	Overlay_GUIOn()
	Sleep %showTime%
	Overlay_GUIOff()
}

; From here down are the dual-GUI functions.

Overlay_CreateGUI2(LRM:=16, TBM:=4) {  ; LRM: left & right margin, TBM: top & bottom margin
	BGC = 333333

	Gui, 1: +AlwaysOnTop +ToolWindow -Caption +E0x20 ; Click through GUI always on top.
	Gui, 1: Color, %BGC%
	Gui, 1: Margin, %LRM%, %TBM%
	Gui, 1: +LastFound
	WinSet, Transparent, 180

	Gui, 2: +AlwaysOnTop +ToolWindow -Caption +E0x20 ; Click through GUI always on top.
	Gui, 2: Color, %BGC%
	Gui, 2: Margin, %LRM%, %TBM%
	Gui, 2: +LastFound
	WinSet, Transcolor, %BGC%

	TextLayer := WinExist()
	Return TextLayer
}


Overlay_CreateRow2(fontSize, textToShow) {
	TextFont := "Trebuchet MS Bold"
	; set some text colors to be chosen randomly, just for fun
	FGColorsList := ["AA8888", "88AA88", "8888AA", "AAAA88", "AA88AA", "88AAAA"]
	Random, randint, 1, % FGColorsList.MaxIndex()
	FGC := FGColorsList[randint]

	Gui, 1: Font, S%fontSize%, %TextFont%
	Gui, 1: Add, Text, xm y+0 center cBlack BackgroundTrans, %textToShow%

	Gui, 2: Font, S%fontSize%, %TextFont%
	Gui, 2: Add, Text, xm y+0 center c%FGC% BackgroundTrans, %textToShow%

	GuiControlGet, thisCtrl, hwnd, %textToShow%
	Return thisCtrl
}


; Set width of all gui controls to widest control
Overlay_UniformCtrlWidths2() {
	Loop, 2  ; loop through both GUIs
	{
		CtrlWidth := 0  ; set variable to hold widest control found so far
		Gui, %A_Index%: +LastFound
		WinGet, cList, ControlListHwnd  ; get list of controls for the gui

		; Loop through once to find the widest button
		Loop, Parse, cList, "`n"
		{
			GuiControlGet, thisCtrl, Pos, %A_LoopField%
			If (thisCtrlW > CtrlWidth) {
				CtrlWidth := thisCtrlW + 5
			}
		}

		; Loop through second time to set all buttons to same width
		Loop, Parse, cList, "`n"
		{
			GuiControl, Move, %A_LoopField%, w%CtrlWidth%
		}
	}
}


; show the final gui with both text controls (set some reasonable default values for size)
Overlay_ShowGUI2(showTime:=1000) {
	Gui, 1: Show, NoActivate

	; get coordinates of Gui 1 so Gui 2 can be positioned slightly off to create a drop shadow
	; Gui 1 is the drop shadow while Gui 2 has the opaque, colorful text
	Gui, 1: +LastFound
	WinGetPos, G1X, G1Y, G1W, G1H
	NextX := G1X - 3
	NextY := G1Y - 3
	Gui, 2: Show, x%NextX% y%NextY% NoActivate

	Sleep %showTime%

	Gui, 1: Destroy
	Gui, 2: Destroy
}
