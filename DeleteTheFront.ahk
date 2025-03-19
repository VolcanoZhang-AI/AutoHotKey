#NoTrayIcon

!Right::        ; Alt + → 跳到行尾
    Send, {End}
return

!Backspace::    ; Alt + Backspace 删除到行首
    Send, +{Home}   ; 选中从光标位置到行首
    Send, {Del}     ; 删除选中内容
return