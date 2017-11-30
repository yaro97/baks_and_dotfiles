"先运行'curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
"然后在nvim中执行':PlugnInstall'
"参考：https://github.com/junegunn/vim-plug
"设置alias vi="vim" 

" < C-w z >来关闭任何preview window

set paste "系统剪贴板可以复制到vim(p)
set nu "显示行号
syntax on    "开启语法高亮
"colorscheme ron  "设置默认颜色主题
"colorscheme slate  "设置默认颜色主题
"colorscheme desert  "设置默认颜色主题
set mouse=v "不行的话请输入这条命令,或者尝试通过shift可以操作鼠标"
set nowrap    "设置不折行"
set pastetoggle=<F3> "防止粘贴式缩进,粘贴前按f3,粘贴后再按f3
set ignorecase " 设置默认进行大小写不敏感查找
set smartcase  "如果有一个大写字母，则切换到大小写敏感查找
set ts=4  "ts是tab的意思
set sw=4 "缩ability进大小为4
set expandtab autoindent "将有所tab转换为空格,并在换行时自动缩进
set showmatch    "显示匹配的括号"
set scrolloff=3        "距离顶部和底部5行"
set laststatus=2    "命令行为两行"
set encoding=utf-8 "文件编码"
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936 "下面两行可以解决文件乱"
set termencoding=utf-8
set clipboard=unnamed "允许vim使用系统剪贴板"
set backspace=2
set mouse=a        "启用鼠标"
set selection=exclusive
set selectmode=mouse,key
set matchtime=5
set ignorecase        "忽略大小写"
set incsearch
set hlsearch        "高亮搜索项"
set noexpandtab        "不允许扩展table"
set whichwrap+=<,>,h,l
set autoread
set cursorline        "突出显示当前行"

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
call plug#begin('~/.vim/plugged')
" Make sure you use single quotes

"状态栏增强插件,比powerline轻量
Plug 'vim-airline/vim-airline' 

Plug 'scrooloose/nerdtree'
"F2开启和关闭树"
map <F2> :NERDTreeToggle<CR>
let NERDTreeChDirMode=1
""显示书签"
let NERDTreeShowBookmarks=1
"设置忽略文件类型"
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
""窗口大小"
let NERDTreeWinSize=25

"缩进指示线
Plug 'Yggdroot/indentLine' 
let g:indentLine_char='┆'
let g:indentLine_enabled = 1

"语法检查,超越syntasitc"
"Plug 'w0rp/ale' 

"注释,使用:'<leader> c space' ,其中<leader>默认时'\'
"Plug 'scrooloose/nerdcommenter'   
" 4\cc注释当前行下面4行,4\cu取消注释; \ca 修改注释方式(如python#后有没有空格);\cm 为多行注释

"使用方法:<Ctrl-y> 后松开再按逗号
"Plug 'mattn/emmet-vim' 
"参考:https://www.zfanw.com/blog/zencoding-vim-tutorial-chinese.html#_Emmetvim-3

" Markdown 插件如下两个:
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
let g:vim_markdown_folding_disabled = 1 "禁用折叠

" Initialize plugin system
call plug#end()

