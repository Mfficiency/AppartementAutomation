; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
{
; ^ | Ctrl
; + | Shift
; ! | Alt
; # | Windowskey
; S | Pause
; Z | afsluiten

}
{  ; =================   ==================
	#c::
	st = 300
	{
		Sleep, %st%
		send, Hello
		
	}		
		
		
	ExitApp
	;return
			
}

	
{ ;  ==== win H | Show controls ====

  #h::

MsgBox, | ctrl F1 - Flow | win H - Help | ctrl alt S - Pause | ctrl alt Z - afsluiten |

  Return

}
{ ; ==== ctrl alt B | bee boo boop ====
  ^!b::
	sleep, 100
	SoundBeep, 450, 150
	SoundBeep, 300, 200
	SoundBeep, 250, 200
	
  Return
}

^!s:: 	MsgBox, Pauze
	Pause

^!z:: ExitApp

