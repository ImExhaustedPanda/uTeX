#Requires AutoHotkey v2.0

; ========== GLOBAL SETTINGS ==========

Global LaTeXMode := true			; Set LaTeX Mode Off to default by setting LaTeXMode := off
Global CapsLockToggle := false			; Tracks toggle state of Caps Lock (via double press)
Global CapsLockActive := false			; Sets CapsLock default state
Global HoldThreshold := 300			; Long-press threshold in milliseconds

; ========== LATEX MODE TOGGLE (Shift + CapsLock) ==========

TraySetIcon(A_ScriptDir . "\uTeXModeOn.ico")	; Set initial tray icon

ShowNotification(Text) {  ; Display temporary notifications (1 second duration)
    ToolTip(Text)
    SetTimer(ToolTip, -1000)
}

+CapsLock::{  ; Toggle LaTeX mode
    Global LaTeXMode
    LaTeXMode := !LaTeXMode
    TraySetIcon(LaTeXMode ? (A_ScriptDir . "\uTeXModeOn.ico") : (A_ScriptDir . "\uTeXModeOff.ico"))
    ShowNotification(LaTeXMode ? "LaTeX Mode On" : "LaTeX Mode Off")
}

; ========== DOUBLE TAP CAPSLOCK TO TOGGLE CAPSLOCK (Hold is a modifier) ==========

CapsLock::{  ; Double-tap CapsLock within HoldThreshold to toggle its state
    KeyWait('CapsLock')
    if (A_TimeSinceThisHotkey < HoldThreshold)
    and KeyWait('CapsLock', 'D T0.' HoldThreshold)
    and (A_PriorKey = 'CapsLock')
        SetCapsLockState !GetKeyState('CapsLock', 'T')
}

*CapsLock::Send '{Blind}{vk07}'  ; Remap CapsLock to 'dead key' for use as modifier

; ========== HOTKEYS ACTIVE IN LATEX MODE ==========

#HotIf LaTeXMode

; ========== FUNCTION: HANDLE SHORT VS LONG PRESS ==========

PressInput(Input, LongPress, ShortPress) {
    If GetKeyState("Shift") {				; Shift + Input → LongPress
        SendInput("{Raw}" LongPress)
        Return
    }
    PressTime := A_TickCount
    SendInput("{Raw}" ShortPress)			; Send "ShortPress"
    KeyWait(Input)
    If (A_TickCount - PressTime > HoldThreshold) {	; If long press then
        Loop(StrLen(ShortPress))
            Send("{BS}")				; Erase "ShortPress"
        SendInput("{Raw}" LongPress)			; Send "LongPress"
		Return
    }
	Return
}

; ========== NUMBER ROW REMAPPING ==========

*$1::PressInput("1", "1", "!")
*$2::PressInput("2", "2", "`"")
*$3::PressInput("3", "3", "£")
*$4::PressInput("4", "4", "$")
*$5::PressInput("5", "5", "%")
*$6::PressInput("6", "6", "^")
*$7::PressInput("7", "7", "&")
*$8::PressInput("8", "8", "*")
*$9::PressInput("9", "9", "(")
*$0::PressInput("0", "0", ")")
*$-::PressInput("-", "_", "-")
*$=::PressInput("=", "+", "=")
*$[::PressInput("[", "[", "{")
*$]::PressInput("]", "]", "}")
*$`;::PressInput("`;", ":", "`;")
*$'::PressInput("'", "@", "'")
*$#::PressInput("#", "~", "#")
*$,::PressInput(",", "<", ",")
*$.::PressInput(".", ">", ".")
*$/::PressInput("/", "?", "/")
*$\::PressInput("\", "|", "\")

; ========== SPECIAL HANDLING FOR BACKTICK (`) CODE BLOCKS ==========

*$`::{  ; Shift + ` → ¬ | Short press → ` | Long press → ```
    If GetKeyState("Shift") { ; Shift + ` → ¬
        SendInput("{Raw}¬")
        Return
    }
    PressTime := A_TickCount
    SendInput("{Raw}``")  ; Send `
    KeyWait("``")
    If (A_TickCount - PressTime > HoldThreshold) {
        SendInput("{Raw}````")  ; Send `` (` `` → ```)
		Return
	}
	Return
}

; ========== MATH SYMBOL SHORTCUTS (Alt + symbol) ==========

*$!,::SendInput("{Raw}\leq")  ; , → \leq
*$!.::SendInput("{Raw}\geq")
*$!-::SendInput("{Raw}\in")
*$!/::SendInput("{Raw}\frac{}{}")
*$!=::SendInput("{Raw}\implies")
*$!9::SendInput("{Raw}\left(")
*$!0::SendInput("{Raw}\right)")
*$![::SendInput("{Raw}\left[")
*$!]::SendInput("{Raw}\right]")

; ========== GREEK LETTER INPUT (CapsLock + letter) ==========

#HotIf LaTeXMode && GetKeyState("CapsLock", "P") && !GetKeyState("Alt", "P")

*$a::PressInput("a", "\Alpha", "\alpha")
*$b::PressInput("b", "\Beta", "\beta")
*$d::PressInput("d", "\Delta", "\delta")
*$e::PressInput("e", "\Epsilon", "\epsilon")
*$g::PressInput("g", "\Gamma", "\gamma")
*$l::PressInput("l", "\Lambda", "\lambda")
*$m::PressInput("m", "\Mu", "\mu")
*$n::PressInput("n", "\Nu", "\nu")
*$p::PressInput("p", "\Pi", "\pi")
*$r::PressInput("r", "\Rho", "\rho")
*$s::PressInput("s", "\Sigma", "\sigma")
*$t::PressInput("t", "\Theta", "\theta")
*$y::PressInput("y", "\Psi", "\psi")
*$u::PressInput("u", "\Phi", "\phi")
*$w::PressInput("w", "\Omega", "\omega")
*$x::PressInput("x", "\Chi", "\chi")
*$h::PressInput("h", "\Eta", "\eta")
*$z::PressInput("z", "\Zeta", "\zeta")
*$i::PressInput("i", "\mathbf{\hat{i}}", "\mathbf{\hat{i}}")
*$j::PressInput("j", "\mathbf{\hat{j}}", "\mathbf{\hat{j}}")
*$k::PressInput("k", "\kappa", "\mathbf{\hat{k}}")

; ========== TRIG + MATH SYMBOLS (Alt + CapsLock + letter) ==========

#HotIf LaTeXMode && GetKeyState("CapsLock", "P") && GetKeyState("Alt", "P")

*$s::PressInput("s", "\cos", "\sin")
*$t::PressInput("t", "\sec", "\tan")
*$a::PressInput("a", "\arccos", "\arcsin")
*$r::PressInput("r", "\csc", "\arctan")
*$v::PressInput("v", "\underline{}", "\vec{}")
*$d::PressInput("d", "\ddot{}", "\dot{}")
*$m::PressInput("m", "\times", "\cdot")
*$c::PressInput("c", "\int \, dx", "\frac{d}{dx}")

#HotIf
