; AutoHotkey script to modify short mouse clicks into 150ms presses
#NoEnv
#InstallMouseHook
SendMode, Input
SetBatchLines, -1

macroEnabled := true

F10::
    macroEnabled := !macroEnabled
    SoundBeep, % macroEnabled ? 750 : 500, 150
return

$LButton::
    if (!macroEnabled) {
        SendInput, {Blind}{LButton down}
        KeyWait, LButton
        SendInput, {Blind}{LButton up}
        return
    }
    start := A_TickCount
    SendInput, {Blind}{LButton down}
    KeyWait, LButton
    elapsed := A_TickCount - start
    if (elapsed < 150)
        Sleep, 150 - elapsed
    SendInput, {Blind}{LButton up}
return

$RButton::
    if (!macroEnabled) {
        SendInput, {Blind}{RButton down}
        KeyWait, RButton
        SendInput, {Blind}{RButton up}
        return
    }
    start := A_TickCount
    SendInput, {Blind}{RButton down}
    KeyWait, RButton
    elapsed := A_TickCount - start
    if (elapsed < 150)
        Sleep, 150 - elapsed
    SendInput, {Blind}{RButton up}
return
