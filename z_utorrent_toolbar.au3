;#NoTrayIcon
#pragma compile(Out,             z_utorrent_toolbar.exe)
#pragma compile(x64,             False)
#pragma compile(UPX,             False)
#pragma compile(Compatibility,   win7)
#pragma compile(ExecLevel,       asInvoker) ;highestavailable/requireAdministrator

;#pragma compile(Icon,           mfc100_16931.ico)
#pragma compile(FileDescription, Various fixes)
#pragma compile(LegalCopyright,  wut?)
#pragma compile(OrignalFilename, z_utorrent_toolbar.exe)
#pragma compile(FileVersion,     1.0.3.0)
;==========================================================
;AutoItSetOption("TrayIconDebug",   1)
;AutoItSetOption("MustDeclareVars", 1)
;==========================================================
#include <WindowsConstants.au3>
#include <GuiConstants.au3>
#include <MsgBoxConstants.au3>
#include <WinAPISysWin.au3>
;==========================================================

While 1
	Fix_uTorrent_Toolbar_width()
	
	Sleep(50)
WEnd

;==========================================================

; Display full toolbar without dropdow
Func Fix_uTorrent_Toolbar_width()
	Local Const $AppWin_Class  = "[CLASS:µTorrent4823DF041B09]"
	Local Const $Toolbar_Class = "[CLASS:ToolbarWindow32; INSTANCE:2]"

	If WinActive($AppWin_Class, "") Then
		Sleep(100)

		Local $Toolbar = ControlGetHandle($AppWin_Class, "", $Toolbar_Class)
		If $Toolbar Then
			Local $aPos = ControlGetPos($AppWin_Class, "", $Toolbar_Class)
			If $aPos[2] < 250 Then
				ControlMove($AppWin_Class, "", $Toolbar_Class, $aPos[0], $aPos[1], 299)
			EndIf
		EndIf
	EndIf
EndFunc

;==========================================================
Func Terminate()
	Exit 0
EndFunc
;==========================================================