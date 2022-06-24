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

AutoItSetOption ( "MouseCoordMode", 0)	;0 = relative coords to the active window
Opt("SendKeyDelay",20)

HotKeySet("{ESC}", "MyTerminate")

Func MyTerminate()
  MsgBox($MB_SYSTEMMODAL + $MB_ICONWARNING, "Warning", "Esc pressed, will stop testing.")
  Exit
EndFunc

;==========================================================================================================
;discription: startup Sagi-ISC
;
;variable: n/a
;
;==========================================================================================================

	Local $ACaseTotal = 2000
	;Local $BCaseTotal = 105
	;Local $CCaseTotal = 105

	Local $result
	Local $index
	Local $fileName

	Local $windowName = "Sagittarius - Interactive Switch Controller"
	Local $resultPath = "C:\Sagi-ISC_AutoIt\AutoItResult\"
	Local $expectPath = "C:\Sagi-ISC_AutoIt\ExpectResult\"
	Local $sLogPath = "C:\Sagi-ISC_AutoIt\Result.log"

	;flow starts here
	Local $i
	For	$i=1 to $ACaseTotal step 1
		$fileName = "A" & $i
		SagiISCCompare($fileName)
	Next

	;Local $j
	;For	$j=1 to $BCaseTotal step 1
	;	$fileName = "B" & $j
	;	SagiISCCompare($fileName)
	;Next

	;Local $k
	;For	$k=1 to $CCaseTotal step 1
	;	$fileName = "C" & $k
	;	SagiISCCompare($fileName)
	;Next

Func SagiISCCompare($strCaseName)

	;copy pre-created sagi-ISC.txt to folder
   ;FileCopy("C:\Sagi-ISC_AutoIt\TxtGenerator\TxtOutput\" & $strCaseName &"\sagi-isc.txt", "C:\Program Files (x86)\STAr\Sagittarius", $FC_OVERWRITE)
   ;Sleep(2500)

   $result = Run("C:\Program Files (x86)\STAr\Sagittarius\Components\Sagi_ISC.exe")

   Sleep(15000)

   If NOT WinActivate($windowName) Then WinActivate($windowName)
   $result = WinWaitActive($windowName,"",15)

   Sleep(6000)

	;move mouse to empty space
    MouseMove(900,60)

   ;_ScreenCapture_CaptureWnd("C:\Sagi-ISC_AutoIt\AutoItResult\"& $strCaseName &".png", $result,0,0,-1,-1,False)


	Sleep(1000)

#cs
   ;MsgBox($MB_OK, "Compare Result", $resultPath & $strCaseName & ".png")
   ;MsgBox($MB_OK, "Compare Result", $expectPath & $strCaseName & ".png")
   Local $CompareResult = CompareImage($resultPath & $strCaseName & ".png", $expectPath & $strCaseName & ".png")

   ;MsgBox($MB_OK, "Compare Result", $CompareResult)
   If $CompareResult = TRUE Then
	  _FileWriteLog ( $sLogPath, "Case:" & $strCaseName & ": Pass" )
   Else
	  _FileWriteLog ( $sLogPath, "Case:" & $strCaseName & ": Fail" )
   EndIf
#ce

   ;Close Sagi-ISC
   If NOT WinActivate($windowName) Then WinActivate($windowName)
   MouseMove(1860,60)
   MouseClick("left")
   Sleep(500)
   ControlClick("Sagittarius - Assist", "", "Button1")
   Sleep(10000)

EndFunc

 Func CompareImage($strFileName1, $strFileName2)
   _GDIPlus_Startup()
   ;$fname1=FileOpenDialog("First image","","All images(*.bmp;*.jpg;*.png;)")
   ;If $fname1="" Then Exit
   ;$fname2=FileOpenDialog("Second image image","","All images(*.bmp;*.jpg;*.png;)")
   ;If $fname2="" Then Exit
   $bm1 = _GDIPlus_ImageLoadFromFile($strFileName1)
   $bm2 = _GDIPlus_ImageLoadFromFile($strFileName2)

   ;MsgBox(0, "bm1==bm2", CompareBitmaps($bm1, $bm2))
   Local $result = CompareBitmaps($bm1, $bm2)
   _GDIPlus_ImageDispose($bm1)
   _GDIPlus_ImageDispose($bm2)
   _GDIPlus_Shutdown()

   ;MsgBox($MB_SYSTEMMODAL + $MB_ICONWARNING, "Info", $result)
   return $result
EndFunc

Func CompareBitmaps($bm1, $bm2)

    $Bm1W = _GDIPlus_ImageGetWidth($bm1)
    $Bm1H = _GDIPlus_ImageGetHeight($bm1)
    $BitmapData1 = _GDIPlus_BitmapLockBits($bm1, 0, 0, $Bm1W, $Bm1H, $GDIP_ILMREAD, $GDIP_PXF32RGB)
    $Stride = DllStructGetData($BitmapData1, "Stride")
    $Scan0 = DllStructGetData($BitmapData1, "Scan0")

    $ptr1 = $Scan0
    $size1 = ($Bm1H - 1) * $Stride + ($Bm1W - 1) * 4


    $Bm2W = _GDIPlus_ImageGetWidth($bm2)
    $Bm2H = _GDIPlus_ImageGetHeight($bm2)
    $BitmapData2 = _GDIPlus_BitmapLockBits($bm2, 0, 0, $Bm2W, $Bm2H, $GDIP_ILMREAD, $GDIP_PXF32RGB)
    $Stride = DllStructGetData($BitmapData2, "Stride")
    $Scan0 = DllStructGetData($BitmapData2, "Scan0")

    $ptr2 = $Scan0
    $size2 = ($Bm2H - 1) * $Stride + ($Bm2W - 1) * 4

    $smallest = $size1
    If $size2 < $smallest Then $smallest = $size2
    $call = DllCall("msvcrt.dll", "int:cdecl", "memcmp", "ptr", $ptr1, "ptr", $ptr2, "int", $smallest)



    _GDIPlus_BitmapUnlockBits($bm1, $BitmapData1)
    _GDIPlus_BitmapUnlockBits($bm2, $BitmapData2)

    Return ($call[0]=0)


EndFunc  ;==>CompareBitmaps
