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
#p::Run mspaint
#g::Run E:\GitHub\baks_and_dotfiles\goldendict.ahk
#^s::Run D:\Tool\Snipaste-1.15.3-x64\Snipaste.exe
#^f::Run D:\Tool\FSCapture_Ver.8.8_Chs\FSCapture.exe
#^g::Run "D:\Tool\GoldenDict\GoldenDict.exe"
#^b::Run https://www.baidu.com ; Ctrl+Win+b
#^v::Run "D:\Program Files\Microsoft VS Code\Code.exe"
#^e::Run "D:\Program Files\Everything\Everything.exe"

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