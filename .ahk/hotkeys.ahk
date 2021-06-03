#NoEnv
#Warn
SendMode Input

EnvGet, HomeDir, USERPROFILE
SetWorkingDir %HomeDir%

RunApp(command, asAdmin := false, activateProg := "") {
    if asAdmin {
        Run *RunAs %command%,,,OutputPID
    } else {
        Run %command%,,,OutputPID
    }
    if (activateProg <> "") {
        WinWait, ahk_exe %activateProg%
        WinActivate, ahk_exe %activateProg%
    } else {
        WinWait, ahk_pid %OutputPID%
        WinActivate, ahk_pid %OutputPID%
    }
}
RunOrActivate(command, prog, asAdmin := false) {
    if WinExist("ahk_exe " . prog)
        WinActivate
    else
        RunApp(command, asAdmin, prog)
}

; load script corresponding to computer name if it exists
ComputerScript = %A_ScriptDir%\%A_ComputerName%.ahk
if FileExist(ComputerScript) {
    Run "autohotkey.exe" %ComputerScript%
}

; shortcuts
#c::RunOrActivate("wt.exe", "WindowsTerminal.exe")
#^c::RunApp("wt.exe", true, "WindowsTerminal.exe")
#v::RunApp("C:\Program Files\Vim\vim82\gvim.exe")
#k::RunApp("C:\Program Files (x86)\Koffee\koffee.exe")
#^k::RunApp("C:\Program Files (x86)\Koffee\koffee.exe", true)
#!k::WinActivate, ahk_exe Koffee.exe
#[::Run, "nircmd.exe" setdefaultsounddevice "Headset" 1
#]::Run, "nircmd.exe" setdefaultsounddevice "Headphones" 1
#\::Run, "nircmd.exe" setdefaultsounddevice "Speakers" 1

; keyboard alternate keys
!Media_Play_Pause::Send, {Media_Stop}
^Media_Play_Pause::Send, {Media_Stop}
Break::AppsKey ; alternate context menu key

RelaunchLogitech() {
    Process, Close, LCore.exe
    RunApp("C:\Program Files\Logitech Gaming Software\LCore.exe")
}
XButton1::RelaunchLogitech()

