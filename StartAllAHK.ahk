#NoEnv
SetWorkingDir, %A_ScriptDir%  ; 设置工作目录为当前脚本所在目录

AutoHotkeyPath := "C:\Program Files\AutoHotkey\v1.1.37.02\AutoHotkeyU64.exe"  ; 指定 AutoHotkey 可执行文件路径

Loop, %A_ScriptDir%\*.ahk  ; 遍历当前文件夹的所有 AHK 文件
{
    if (A_LoopFileName != A_ScriptName)  ; 避免重复启动自身
    {
        Run, "%AutoHotkeyPath%" "%A_LoopFileFullPath%"  ; 用指定的 AutoHotkey 运行 AHK 脚本
    }
}
MsgBox, 所有 AHK 脚本已启动！
