;================
; 其他快捷键可以直接到帮助文档chm中搜索引key list查看即可了
;AHK常用快捷键：
; # 号代表 Win 键；
; ! 号代表 Alt 键；
; ^ 号代表 Ctrl 键；
; + 号代表 shift 键；
; :: 号(两个英文冒号)起分隔作用；
; run，非常常用 的 AHK 命令之一;
; ; 号代表 注释后面一行内容；
; < > 号 用于指定左侧/右侧按键；


;=============
;快速运行程序
#c::Run calc ; Win+z
#n::Run notepad ; Win+n
#^b::Run https://www.baidu.com ; Ctrl+Win+b



;===========
;快速打出常用语
::/gmail::wyzh97@gmail.com

;===============
;快速取色
^#c::
MouseGetPos, mouseX, mouseY
; 获得鼠标所在坐标，把鼠标的 X 坐标赋值给变量 mouseX ，同理 mouseY
PixelGetColor, color, %mouseX%, %mouseY%, RGB
; 调用 PixelGetColor 函数，获得鼠标所在坐标的 RGB 值，并赋值给 color
StringRight color,color,6
; 截取 color（第二个 color）右边的6个字符，因为获得的值是这样的：#RRGGBB，一般我们只需要 RRGGBB 部分。把截取到的值再赋给 color（第一个 color）。
clipboard = %color%
; 把 color 的值发送到剪贴板
return


;==============
;GoldenDict 划译插件[AHK]
;version 0.9
;allor@sian.cn
;2018-01-08
;GUI及其他功能完善有待日后空闲
;========使用说明========
;设置goldendict剪切板取词快捷键：Ctrl+Ctrl+C
;pause键 启用/停用 脚本
;鼠标拖选、双击选词翻译

;原作者：https://weibo.com/1928931362/Dcdvnphx7?type=comment#_rnd1522542132744
;修订版本作者：https://www.pdawiki.com/forum/forum.php?mod=viewthread&tid=23696&extra=&page=1

; #IfWinExist ahk_exe GoldenDict.exe    ;判断goldendict是否打开
Pause::Suspend  ;暂停/启用脚本
~LButton::

CoordMode, Mouse, Screen
SetKeyDelay -1, 10
MouseGetPos, x1, y1
KeyWait, LButton
MouseGetPos, x2, y2
if (x1-x2>30 or x2-x1>30) {   ;判断鼠标点住左键后移动范围,防误触
oldClipboard := Clipboard    ;赋值鼠标原始剪贴板内容
	gosub, Copy     ;执行Copy标签
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
Send ^^c  ;发送全局的 ctrl+shift+c  ,请在goldendict中设置翻译剪切板的热键为 Ctrl+Shift+C
Clipboard := oldClipboard  ;恢复原始剪贴板内容;如果希望默认复制所翻译的内容,可删除此行
return
; #IfWinExist
