#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.5
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------
; Script Start - Add your code below here
#include <MsgBoxConstants.au3>
#include <AutoItConstants.au3>
#Include <ScreenCapture.au3>
#include <Clipboard.au3>
;#Include <function_general.au3>
#Include <File.au3>

#RequireAdmin


#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#Region ### START Koda GUI section ### Form=
$Form1 = GUICreate("Sagi ISC_OfflineModuleCombinationTest_V0.2", 501, 158, 192, 124)
$Button1 = GUICtrlCreateButton("ISC_UserControl", 40, 40, 131, 73)
$Button2 = GUICtrlCreateButton("ISC_Congfig", 240, 40, 145, 73)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###
Func MyTerminate()
	  MsgBox($MB_SYSTEMMODAL + $MB_ICONWARNING, "Warning", "Esc pressed, will stop testing.")
	  Exit
EndFunc

Local $ACaseTotal = 105
Local $BCaseTotal = 105

Local $CCaseTotal = 105
Local $DCaseTotal = 105
Local $result
Local $index
Local $fileName

Local $windowName = "Sagittarius - Interactive Switch Controller"
Local $resultPath = "C:\Sagi-ISC_AutoIt\AutoItResult\"
Local $expectPath = "C:\Sagi-ISC_AutoIt\ExpectResult\"
Local $sLogPath = "C:\Sagi-ISC_AutoIt\Result.log"



While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		 Case $Button1
			AutoItSetOption ( "MouseCoordMode", 0)	;0 = relative coords to the active window
			Opt("SendKeyDelay",20)

			HotKeySet("{ESC}", "MyTerminate")



			;==========================================================================================================
			;discription: startup Sagi-ISC
			;
			;variable: n/a
			;
			;==========================================================================================================

				
				;flow starts here
				Local $i
				For	$i=1 to $ACaseTotal step 1
					$fileName = "A" & $i
					SagiISCCompare($fileName)
				Next

				Local $j
				For	$j=1 to $BCaseTotal step 1
					$fileName = "B" & $j
					SagiISCCompare($fileName)
				Next

				Local $k
				For	$k=1 to $CCaseTotal step 1
					$fileName = "C" & $k
					SagiISCCompare($fileName)
				 Next

				 Local $g
				For	$g=1 to $DCaseTotal step 1
					$fileName = "D" & $g
					SagiISCCompare($fileName)
				Next

			

			

		 Case $Button2
			
			AutoItSetOption ( "MouseCoordMode", 0)	;0 = relative coords to the active window
			Opt("SendKeyDelay",20)

			HotKeySet("{ESC}", "MyTerminate")
				Local $i
				For	$i=1 to $ACaseTotal step 1
					$fileName = "A" & $i
					SagiISCCompare_Config($fileName)
				Next

				Local $j
				For	$j=1 to $BCaseTotal step 1
					$fileName = "B" & $j
					SagiISCCompare_Config($fileName)
				Next

				Local $k
				For	$k=1 to $CCaseTotal step 1
					$fileName = "C" & $k
					SagiISCCompare_Config($fileName)
				 Next

				 Local $g
				For	$g=1 to $DCaseTotal step 1
					$fileName = "D" & $g
					SagiISCCompare_Config($fileName)
				Next


			

	EndSwitch
WEnd


Func SagiISCCompare($strCaseName)

		;copy pre-created sagi-ISC.txt to folder
	   FileCopy("C:\Sagi-ISC_AutoIt\TxtGenerator\TxtOutput\" & $strCaseName &"\sagi-isc.txt", "C:\Program Files (x86)\STAr\Sagittarius", $FC_OVERWRITE)
	   Sleep(2500)

	   $result = Run("\Sagi-ISC_AutoIt\Start.bat")

	   Sleep(10000)

	   If NOT WinActivate($windowName) Then WinActivate($windowName)
	   $result = WinWaitActive($windowName,"",15)

	   Sleep(6000)

		;move mouse to empty space
		MouseMove(900,60)

	   _ScreenCapture_CaptureWnd("C:\Sagi-ISC_AutoIt\AutoItResult\"& $strCaseName &".png", $result,0,0,-1,-1,False)


		Sleep(1000)

	   ;Close Sagi-ISC
	   If NOT WinActivate($windowName) Then WinActivate($windowName)
	   MouseMove(1860,60)
	   MouseClick("left")
	   Sleep(500)
	   ControlClick("Sagittarius - Assist", "", "Button1")
	   Sleep(10000)

EndFunc

Func SagiISCCompare_Config($strCaseName)

		;copy pre-created sagi-ISC.txt to folder
	   FileCopy("C:\Sagi-ISC_AutoIt\TxtGenerator\TxtOutput\" & $strCaseName &"\sagi-isc.txt", "C:\Program Files (x86)\STAr\Sagittarius", $FC_OVERWRITE)
	   Sleep(2500)

	   $result = Run("\Sagi-ISC_AutoIt\Start.bat")

	   Sleep(10000)

	   If NOT WinActivate($windowName) Then WinActivate($windowName)
	   $result = WinWaitActive($windowName,"",15)

	   Sleep(6000)

		;move mouse to empty space
		MouseMove(900,60)
		Sleep(1000)
		MouseMove(460,60)
		Sleep(500)
		MouseClick("left")
		Sleep(1000)
	   _ScreenCapture_CaptureWnd("C:\Sagi-ISC_AutoIt\AutoItResult\"& $strCaseName &"_Config.png", $result,0,0,-1,-1,False)


		Sleep(1000)

	   ;Close Sagi-ISC
	   If NOT WinActivate($windowName) Then WinActivate($windowName)
	   MouseMove(1860,60)
	   MouseClick("left")
	   Sleep(500)
	   ControlClick("Sagittarius - Assist", "", "Button1")
	   Sleep(10000)

EndFunc
