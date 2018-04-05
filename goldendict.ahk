; #IfWinExist ahk_exe GoldenDict.exe    ;判断goldendict是否打开
Alt::Suspend  ;暂停/启用脚本
~LButton::

CoordMode, Mouse, Screen
SetKeyDelay -1, 10
MouseGetPos, x1, y1
KeyWait, LButton
MouseGetPos, x2, y2
if (x1-x2>30 or x2-x1>30) {   ;判断鼠标点住左键后移动范围,防误触
oldClipboard := Clipboard    ;赋值鼠标原始剪贴板内容
	gosub, Copy     ;执行第19行的Copy标签
}
else if (A_priorHotKey = "~LButton" and A_TimeSincePriorHotkey < 450){    ;双击鼠标左键
oldClipboard := Clipboard    
	gosub, Copy 
}
return

Copy:
Send ^c   ;发送ctrl+c 复制所选内容到剪贴板
Sleep 200
MouseGetPos, ,,win
        SetTitleMatchMode, 2
        if(WinActive("Chrome") != win and WinActive("Firefox") != win and WinActive("Anki") != win and WinActive("编辑当前") != win and WinActive("浏览器") != win){    ;判断当前所处的软件窗口
	;	Clipboard := oldClipboard   
		  return
		}
        
 len := strlen(clipboard)    ;剪贴板字符数
    index := 1               
    loop    ;循环剪贴板里的每个字符
    { 
        code := asc( substr(clipboard, index, 1) ) ;获得ascii码
        if(code > 122 or code < 20 or code >= 33 and code <= 38 or code >= 40 and code <= 44 or code >=46 and code<=64 or code >=91 and code<=96 or code >=123 and code <= 126)   ;判断剪贴板里是否包含中文/数字/特殊字符
        {
	;	Clipboard := oldClipboard    ;恢复原始剪贴板内容
		return             ;终止执行
        }else if(len>18 or len <3){    ;判断句子或三字母以下的单词
	;	  Clipboard := oldClipboard      
		 return
		}
        ++index
		 if(index > len)
            break
    }
Send ^{c 2}  ;发送全局的 ctrl+shift+c  ,请在goldendict中设置翻译剪切板的热键为 Ctrl+Shift+C
; Clipboard := oldClipboard  ;恢复原始剪贴板内容;如果希望默认复制所翻译的内容,可删除此行
return
; #IfWinExist
