#NoEnv
SetWorkingDir, %A_ScriptDir%
Process, Priority,, High

AutoHotkeyPath := "C:\Program Files\AutoHotkey\v1.1.37.02\AutoHotkeyU64.exe"
DetectHiddenWindows, On  ; 启用检测隐藏窗口

Loop, %A_ScriptDir%\*.ahk
{
    if (A_LoopFileName = A_ScriptName)
        continue
    
    scriptPath := A_LoopFileFullPath
    
    ; 精确查找旧进程
    WinGet, ahkIDs, List, % "ahk_class AutoHotkey ahk_exe AutoHotkeyU64.exe"
    Loop, %ahkIDs%
    {
        hwnd := ahkIDs%A_Index%
        WinGetTitle, winTitle, ahk_id %hwnd%
        if InStr(winTitle, scriptPath)
        {
            WinGet, pid, PID, ahk_id %hwnd%
            Process, Close, %pid%
            WinWaitClose, ahk_id %hwnd%,, 1
        }
    }
    
    ; 强制启动新实例
    Run, "%AutoHotkeyPath%" /force "%scriptPath%",, UseErrorLevel
    if ErrorLevel
        failedList .= A_LoopFileName "`n"
}

if failedList
    MsgBox, 以下脚本启动失败：`n%failedList%
else
    MsgBox, 所有脚本已启动完成！