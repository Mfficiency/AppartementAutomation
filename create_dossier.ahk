; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.
{
    ; ^ | Ctrl
    ; + | Shift
    ; ! | Alt
    ; # | Windowskey
    ; S | Pause
    ; Z | afsluiten
    
}
{ ; =================   ==================
    
        ; init
        st = 300
        templfolder:="text"
        templfile:="text"
        basefold:="text"
        appname:="text"
        appfullname:="text"
        
        ; get data from dox
        FileReadLine, templfolder, data.txt, 1
        FileReadLine, templfile, data.txt, 2
        FileReadLine, basefold, data.txt, 3
        FileReadLine, appname, appnaam.txt, 1
        FileReadLine, appfullname, appnaam.txt, 2
        
        
        ; prep data for use
        newfold := StrReplace(appname, A_Space, "_")
        newfoldpath = %basefold%%newfold%
        wordfilepath = %basefold%\!_Words\%appname%.docx
        pdffilepath= %newfoldpath%\01_Lettre_Candidats.pdf ; here is the generic name chosen
                
        ; create folder
        ; FileCreateDir, %newfoldpath%
        FileCopyDir, %templfolder%, %newfoldpath%
        
        Sleep, %st%
        ; Word cycle
        {
            
            ; start word
            Word := ComObjCreate("Word.Application")
            Word.Visible := True 
            Word.Documents.Add(templfile)

            ; wait a little
            Sleep, %st%
            Sleep, %st%
            WinActivate, ahk_class OpusApp
            WinWaitActive, ahk_class OpusApp
            Sleep, %st%
            Sleep, %st%

            ; go to title
            send, {Alt}
            Sleep, %st%
            send, f
            Sleep, %st%
            send, i
            Sleep, %st%
            send, s
            Sleep, %st%
            send, 1
            Sleep, %st%

            ; fill title
            send, %appfullname%
            Sleep, %st%
            Sleep, %st%
            send, {Enter}

            ; go back and wait
            Sleep, %st%
            send, {Esc}
            Sleep, %st%
            Sleep, %st%
            Sleep, %st%

            ; save & close document
            word.ActiveDocument.SaveAs2(pdffilepath, 17)
            word.ActiveDocument.SaveAs(wordfilepath)
            
            Sleep, %st%
            Sleep, %st%
            Sleep, %st%
            WinClose, ahk_class OpusApp
        }		
        
        ; Make zipfile
        {

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
    
    