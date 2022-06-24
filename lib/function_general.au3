#include-once
#Include <File.au3>
#include <GuiTreeView.au3>
#Include <ScreenCapture.au3>
#Include <GuiEdit.au3>
#include <GUIListBox.au3>
#include <GuiConstantsEx.au3>
#Include <GuiListView.au3>
#include <Date.au3>

Global $au3Name
Global $imageName
Global $imagePath
Global $logPath

;=================================================================
;discription: screen shot of the current widnow when called.
;
;
;variable: n/a
;
;=================================================================
Func printScreen($count)
    ;FileDelete("D:\*.tmp")
	Local $hBmp, $timestamp,$GetTimeStructure, $LocalTimeString , $LocalTimeString2
	;Sleep(500)
	$hBmp = _ScreenCapture_Capture ("")
	$GetTimeStructure = _Date_Time_GetLocalTime ( )
    $LocalTimeString   = _Date_Time_SystemTimeToDateTimeStr($GetTimeStructure)
	$LocalTimeString2 = StringReplace($LocalTimeString, "/", ".")
	$timestamp = StringReplace($LocalTimeString2, ":", ".")

   Switch $count
    Case 1
       _ScreenCapture_SaveImage ($imagePath & "\" & $au3Name & "_HC_snapshot" & $imageName & ".png", $hBmp)
	   $imageName = $imageName + 1
    Case 2
        _ScreenCapture_SaveImage ($imagePath & "\" & $au3Name & "_SC_snapshot_" & $imageName & ".png", $hBmp)
	   $imageName = $imageName + 1
    Case 3
        _ScreenCapture_SaveImage ($imagePath & "\" & $au3Name & "_Pref_snapshot" & $imageName & ".png", $hBmp)
	   $imageName = $imageName + 1
	 Case 4
        _ScreenCapture_SaveImage ($imagePath & "\" & $au3Name & "_Pref_PS_snapshot" & $imageName & ".png", $hBmp)
	   $imageName = $imageName + 1
     Case 5
        _ScreenCapture_SaveImage ($imagePath & "\" & $au3Name & "_Pref_SS_snapshot" & $imageName & ".png", $hBmp)
	   $imageName = $imageName + 1
     Case 6
        _ScreenCapture_SaveImage ($imagePath & "\" & $au3Name & "_Pref_AB_snapshot" & $imageName & ".png", $hBmp)
	   $imageName = $imageName + 1
     Case 7
        _ScreenCapture_SaveImage ($imagePath & "\" & $au3Name & "_Pref_DS_snapshot" & $imageName & ".png", $hBmp)
	   $imageName = $imageName + 1
     Case 8
        _ScreenCapture_SaveImage ($imagePath & "\" & $au3Name & "_VE_snapshot" & $imageName & ".png", $hBmp)
	   $imageName = $imageName + 1
     Case 9
        _ScreenCapture_SaveImage ($imagePath & "\" & $au3Name & "_AE_snapshot" & $imageName & ".png", $hBmp)
	   $imageName = $imageName + 1
	 Case 10
        _ScreenCapture_SaveImage ($imagePath & "\" & $au3Name & "_TE_snapshot" & $imageName & ".png", $hBmp)
	   $imageName = $imageName + 1
     Case 11
        _ScreenCapture_SaveImage ($imagePath & "\" & $au3Name & "_GE_snapshot" & $imageName & ".png", $hBmp)
	   $imageName = $imageName + 1
     Case 12
        _ScreenCapture_SaveImage ($imagePath & "\" & $au3Name & "_PE_snapshot" & $imageName & ".png", $hBmp)
	   $imageName = $imageName + 1
     Case 13
        _ScreenCapture_SaveImage ($imagePath & "\" & $au3Name & "_PC_snapshot" & $imageName & ".png", $hBmp)
	   $imageName = $imageName + 1
     Case 14
        _ScreenCapture_SaveImage ($imagePath & "\" & $au3Name & "_MC_snapshot" & $imageName & ".png", $hBmp)
	   $imageName = $imageName + 1
	 Case 15
        _ScreenCapture_SaveImage ($imagePath & "\" & $au3Name & "_EN_snapshot" & $imageName & ".png", $hBmp)
	   $imageName = $imageName + 1
     Case 16
        _ScreenCapture_SaveImage ($imagePath & "\" & $au3Name & "_LE_snapshot" & $imageName & ".png", $hBmp)
	   $imageName = $imageName + 1
     Case 17
        _ScreenCapture_SaveImage ($imagePath & "\" & $au3Name & "_WE_snapshot" & $imageName & ".png", $hBmp)
	   $imageName = $imageName + 1
     Case 18
        _ScreenCapture_SaveImage ($imagePath & "\" & $au3Name & "_RE_snapshot" & $imageName & ".png", $hBmp)
	   $imageName = $imageName + 1
     Case 19
        _ScreenCapture_SaveImage ($imagePath & "\" & $au3Name & "_AM_snapshot" & $imageName & ".png", $hBmp)
	   $imageName = $imageName + 1
	 Case 20
        _ScreenCapture_SaveImage ($imagePath & "\" & $au3Name & "_ICT_snapshot" & $imageName & ".png", $hBmp)
	   $imageName = $imageName + 1
     Case 21
        _ScreenCapture_SaveImage ($imagePath & "\" & $au3Name & "_Flash_snapshot" & $imageName & ".png", $hBmp)
	   $imageName = $imageName + 1
     Case 22
        _ScreenCapture_SaveImage ($imagePath & "\" & $au3Name & "_MTM_snapshot" & $imageName & ".png", $hBmp)
	   $imageName = $imageName + 1
     Case 23
        _ScreenCapture_SaveImage ($imagePath & "\" & $au3Name & "_RP_snapshot" & $imageName & ".png", $hBmp)
	   $imageName = $imageName + 1
     Case 24
        _ScreenCapture_SaveImage ($imagePath & "\" & $au3Name & "_Graph_snapshot" & $imageName & ".png", $hBmp)
	   $imageName = $imageName + 1
	 Case 25
        _ScreenCapture_SaveImage ($imagePath & "\" & $au3Name & "_WA_snapshot" & $imageName & ".png", $hBmp)
	   $imageName = $imageName + 1
     Case 26
        _ScreenCapture_SaveImage ($imagePath & "\" & $au3Name & "_Pref_LOS_snapshot" & $imageName & ".png", $hBmp)
	   $imageName = $imageName + 1
     Case 27
        _ScreenCapture_SaveImage ($imagePath & "\" & $au3Name & "_Pref_GPIB_snapshot" & $imageName & ".png", $hBmp)
	   $imageName = $imageName + 1
     Case 28
        _ScreenCapture_SaveImage ($imagePath & "\" & $au3Name & "_VNACAL_snapshot" & $imageName & ".png", $hBmp)
	   $imageName = $imageName + 1
     Case 29
        _ScreenCapture_SaveImage ($imagePath & "\" & $au3Name & "_ShutDown_snapshot" & $imageName & ".png", $hBmp)
	   $imageName = $imageName + 1
     Case 30
        _ScreenCapture_SaveImage ($imagePath & "\" & $au3Name & "_MA_snapshot" & $imageName & ".png", $hBmp)
	   $imageName = $imageName + 1
     Case 31
        _ScreenCapture_SaveImage ($imagePath & "\" & $au3Name & "_SysCAL_snapshot" & $imageName & ".png", $hBmp)
	   $imageName = $imageName + 1
     Case 32
        _ScreenCapture_SaveImage ($imagePath & "\" & $au3Name & "_Pref_POS_snapshot" & $imageName & ".png", $hBmp)
	   $imageName = $imageName + 1
   EndSwitch


EndFunc


;=================================================================
;discription: check if sagittarius is started up.
;			  check if hw configuration is opened
;				if not, check if control panel exist
;					if not, then Sagittarius is not open
;			  return 1 if started
;			  return 0 if not started
;
;variable: n/a
;
;=================================================================
Func checkStartup()

	;check if hwconfig is opened
	waitForWin("Sagittarius - Hardware Detection and Configuration","5")
	sleep(500)
	If ControlCommand("Sagittarius - Hardware Detection and Configuration","","SysTreeView321","IsVisible") = 1 Then
		;already startup and and hwconfig window
			;MsgBox(0,".","Sagittarius - Hardware Detection and Configuration is opened.")
		Return 1;
	ElseIf waitForWin ("STAr Sagittarius - Control Panel","5") = 1 Then
		;already startup but at control panel, go to hwconfig window
		;MsgBox(0,".","STAr Sagittarius - Control Panel is opened.")
		If ControlCommand("STAr Sagittarius - Control Panel","","AfxWnd70d21","IsVisible") = 1 Then
			clickButton("STAr Sagittarius - Control Panel","AfxWnd70d21")
		Else
		;	_FileWriteLog( $logPath & "\" & $au3Name & ".txt", $au3Name & @TAB & "STAr Sagittarius - Control Panel, cinfiguration button is disabled." & @TAB & "FAIL")

		EndIf

		Return 1;

	EndIf

	Return 0

EndFunc


;==========================================================================================================
;discription: startup sagittarius and log in as admin
;			  after sagitarrius is started, check if [Initailize] button exist(to verify startup pass)
;
;variable: n/a
;
;==========================================================================================================
Func StartupLogin()

	LocaL $result
	Local $index

	$result = Run("C:\Program Files\STAr\Sagittarius\Components\SagiUI.exe")

	waitForWin("Sagittarius Login","15")

	; enter user name
	ControlSend("Sagittarius Login", "", "Edit1", "admin")
	;enter password
	ControlSend("Sagittarius Login", "", "Edit2", "1234")
	;click [OK]
	ControlClick("Sagittarius Login", "", "Button1")


	waitForWin("Sagittarius Startup","15")

	$index = 0
	While $index < 30
		waitForWin("Sagittarius - Hardware Detection and Configuration","15")

		$result = ControlCommand("Sagittarius - Hardware Detection and Configuration", "", "Button10", "IsVisible")
		If $result = 1 Then
			Sleep(500)
			$index = 62
		Else
			$index = $index + 1
			Sleep(500)

		EndIf

		if $index = 61 Then
			;_FileWriteLog( $logPath & "\" & $au3Name & ".txt", $au3Name & @TAB & "window not found" & @TAB & "FAIL")

		EndIf
	WEnd

EndFunc


;===============================================================
;description: clicks a button if its visible and enabled
;			  return 1 if click is done
;			  return 0 if button is invisible or disabled and can not click
;
;variables: $winName: name of window of button
;           $ID: name of button
;
;===============================================================
Func clickButton($winName,$ID)

	Local $result
	Local $pos

	if  ControlCommand($winName,"", $ID, 'IsVisible') = 1 Then

		if ControlCommand($winName,"", $ID, 'IsEnabled') = 1 Then
			$pos = ControlGetPos ($winName,"", $ID)
			;MsgBox(0,".",$pos[0]+$pos[2]/2 & "," & $pos[1]+$pos[3]/2)
			;ControlClick($winName, "", $ID)
			Opt("MouseCoordMode", 2)
			MouseMove($pos[0]+$pos[2]/2 , $pos[1]+$pos[3]/2)
			MouseClick("left")
			Opt("MouseCoordMode", 0)
			return 1
		Else
			;_FileWriteLog( $logPath & "\" & $au3Name & ".txt", $au3Name & @TAB & $winName & "->" & $ID & " is visible but disabled, can not click button." & @TAB & "FAIL")
			return 0
		EndIf

	Else
		;_FileWriteLog( $logPath & "\" & $au3Name & ".txt", $au3Name & @TAB & $winName & "->" & $ID & " is not visible, can not click button." & @TAB & "FAIL")
		return 0
	EndIf
EndFunc


;==========================================================
;description: wait for window to appear
;			  return 1 if window is found
;			  return 0 if timeout and window is not found
;
;variables: $ windowName: name of window to find
;			$time to wait before timeout
;
;==========================================================
Func waitForWin($windowName, $time)

	Local $result


	If NOT WinActivate($windowName) Then WinActivate($windowName)
	$result = WinWaitActive($windowName,"",$time)
	If $result = 0 Then
	  _FileWriteLog( $logPath & "\" & $au3Name & ".txt", $windowName & @TAB & "window: " & $windowName & " NOT found, timeout = " & $time & @TAB  &"FAIL")
	  return 0

	Else
        _FileWriteLog( $logPath & "\" & $au3Name & ".txt", $windowName & @TAB & "window:" & $windowName & " found" & @TAB  &"PASS")
		return 1


	EndIf

EndFunc


Func changeEditBoxValue($winName, $id, $value)

	Local $length
	Local $hwnd

	clickButton($winName, $id)
	$hwnd = ControlGetHandle($winName,"",$id)
	$length = _GUICtrlEdit_GetTextLen($hwnd)

	;MsgBox(0,"",$length)

	For $i=0 to $length Step 1
		send("{BACKSPACE}")
	Next

	send($value)

EndFunc


;==========================================================
;description: Find filename on open dialog
;			  return 1 if window is found
;			  return 0 if timeout and window is not found
;
;variables: $windowName: Open dialog
;           $SystemList: list name
;           $number: Array number
;           $FileName: name of file to find
;==========================================================
Func OpenFile($windowName, $SystemList, $number, $FileName)

    Local $hwnd
	Local $result
	Local $count
	Local $i

	$hwnd = ControlGetHandle($windowName,"",$SystemList)

	;debug
	If StringCompare($hwnd, "") = 0 Then
	   ;MsgBox(0,".","fail to find list!!!!")
	EndIf

	$count = _GUICtrlListView_GetItemCount($hwnd)
	sleep(500)

   ;Click on TestChips list
   for $i=0 to $count-1 step 1
		$result = _GUICtrlListView_GetItemTextArray($hwnd,$i)
	    if StringCompare($result[$number], $FileName) = 0 Then
			_GUICtrlListView_ClickItem($hwnd, $i,"left",TRUE)
			ExitLoop
		EndIf
      ;MsgBox(0,".","countname" ,$count)
   Next

    If $i = $count Then
		;not found
		_FileWriteLog( $logPath & "\" & $au3Name & ".txt", $au3Name & @TAB & "Can't find file" & @TAB & "FAIL")
		Exit
	EndIf
 EndFunc

 ;=====================================================================
;description: create tester if tester#n dose not exist in tester tree
;
;variables: $WindowsName: Open Windows name
;           $SysetmList
;			$number:Array[$number:]
;			$algoName: select name
;=====================================================================


;Func findAlgoInAlgoList($WindowsName,$SysetmList,$number,$algoName)

   ;Local $hwnd
	;Local $index
	;Local $result
	;Local $count
	;Local $i
	;$hwnd = ControlGetHandle($WindowsName,"",$SysetmList)
	;$count = _GUICtrlListView_GetItemCount($hwnd)
	;sleep(500)

   ;for $i=0 to $count-1 step 1
		;$result = _GUICtrlListView_GetItemTextArray($hwnd,$i)
		;if StringCompare($result[$number], $algoName) = 0 Then
			;_GUICtrlListView_ClickItem($hwnd, $i,"left",TRUE)
			;ExitLoop
		;EndIf
      ;MsgBox(0,".","countname" ,$count)
   ;Next


   ;If $i = $count Then
		;not found
		;MsgBox(0,".","fail!!!!")
		;Exit


	;EndIf

;EndFunc
