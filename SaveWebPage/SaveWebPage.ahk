#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
^j::
;InputBox, StartNumber, Start Number, Please enter a Start number., , 640, 480
IniRead, readStartNumber, SaveWebPage.ini , ConfigSection , StartNumberKey, 1
StartNumber:=readStartNumber
;Loop 10000
Loop
{
Number:=A_Index+StartNumber
Run iexplore.exe http://sine.ni.com/nips/cds/view/modelpopup/p/pcat/%Number%
Sleep, 5000

Send ^s
Sleep, 1000
Send !s
Sleep, 1000
Send !y
Sleep, 5000
Send ^w
Sleep, 1000
writeStartNumber=%Number%
IniWrite, %writeStartNumber%, SaveWebPage.ini, ConfigSection , StartNumberKey
}
return