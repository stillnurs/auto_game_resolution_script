#Requires AutoHotkey v2.0

; Auto toggle resolution between 1920x1080 and 2880x1620 using NirCmd
; Hotkey: Ctrl + Win + R
; Path to NirCmd executable - adjust if needed
nircmdPath := "C:\Tools\nircmd\nircmd.exe"

; Ctrl + Win + R hotkey
^#r:: {
    currentW := A_ScreenWidth
    currentH := A_ScreenHeight

    if (currentW = 1920 && currentH = 1080) {
        Run(nircmdPath . " setdisplay 2880 1620 32 240")
        ShowTooltip("Switched to 2880x1620 @ 240Hz")
    } else {
        Run(nircmdPath . " setdisplay 1920 1080 32 240")
        ShowTooltip("Switched to 1920x1080 @ 240Hz")
    }
}

ShowTooltip(text) {
    TrayTip(text, "Resolution Toggle", "IconI Mute") ; Info icon, no sound
}
