#Requires AutoHotkey v2.0

; Toggle resolution between 1920x1080 and 2880x1620 using NirCmd
; Hotkey: Ctrl + Win + R
; Path to NirCmd executable - adjust if needed
; nircmdPath := "C:\Tools\nircmd\nircmd.exe"

; ; Ctrl + Win + R hotkey
; ^#r:: {
;     currentW := A_ScreenWidth
;     currentH := A_ScreenHeight

;     if (currentW = 1920 && currentH = 1080) {
;         Run(nircmdPath . " setdisplay 2880 1620 32 240")
;         ShowTooltip("Switched to 2880x1620 @ 240Hz")
;     } else {
;         Run(nircmdPath . " setdisplay 1920 1080 32 240")
;         ShowTooltip("Switched to 1920x1080 @ 240Hz")
;     }
; }

; ShowTooltip(text) {
;     TrayTip(text, "Resolution Toggle", "IconI Mute") ; Info icon, no sound
; }


; Auto Game Resolution Toggle Script
; This script automatically toggles the screen resolution when specific games are running.
; It uses NirCmd to change the resolution and checks for running processes.

; --- SETTINGS ---
; Path to NirCmd executable - update to your actual path
nircmdPath := "C:\Tools\nircmd\nircmd.exe"

; List of game executable filenames to monitor
gameList := ["GoWR.exe", "GoW.exe", "RDR2.exe", "witcher3.exe", "b1.exe", "GTA5_Enhanced.exe"]  ; <-- Replace with your game EXEs

; Resolutions
gameRes := [2880, 1620, 32, 240]
defaultRes := [1920, 1080, 32, 240]

SetResolution(res) {
    global nircmdPath
    RunWait(Format('"{1}" setdisplay {2} {3} {4} {5}', nircmdPath, res[1], res[2], res[3], res[4]))
}

IsGameRunning(gameExe) {
    for process in ComObjGet("winmgmts:").ExecQuery("Select * from Win32_Process")
        if (StrLower(process.Name) = StrLower(gameExe))
            return true
    return false
}

Loop {
    for gameExe in gameList {
        if IsGameRunning(gameExe) {
            SetResolution(gameRes)
            ; Wait until game closes
            while IsGameRunning(gameExe)
                Sleep(1500)
            SetResolution(defaultRes)
        }
    }
    Sleep(3000)
}