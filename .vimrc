"""""""""""""""""""""""""""""""""""
" 系统平台
"""""""""""""""""""""""""""""""""""
" call: if MySys() == 'windows'
"       elseif MySys() == 'linux'
"""""""""""""""""""""""""""""""""""
function! MySys()
  if has("win32")
    return "windows"
  else
    return "linux"
  endif
endfunction


"""""""""""""""""""""""""""
" 使用Vundle来管理vim插件
"""""""""""""""""""""""""""
" Vundle常用指令
" :BundleList 列出已经安装的插件
" :BundleInstall 安装所有配置文件中的插件
" :BundleInstall! 更新所有插件
" :BundleSearch 搜索插件
" :BundleClean! 根据配置文件删除插件

" 启用vundle
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

""" 需要安装的插件 三种格式
"" 格式1：Github上其他用户的仓库（非vim-scripts账户里的仓库，所以要加Github用户名）
Bundle 'gmarik/vundle'
Bundle 'scrooloose/nerdcommenter'
"" 格式2：vim-scripts里面的仓库，直接打仓库名即可。
Bundle 'taglist.vim'
Bundle 'bufexplorer.zip'
Bundle 'winmanager'
Bundle 'genutils'
Bundle 'lookupfile'
Bundle 'Pydiction'
Bundle 'The-NERD-tree'
Bundle 'NERD_Tree-and-ack'
Bundle 'minibufexpl.vim'
" 自动补全
Bundle 'snipMate'
" 插入模式下编辑模式切换->切换输入法
Bundle 'fcitx.vim'
" python语法高亮
Bundle 'python.vim'
"" 格式3：非Github的Git仓库
Bundle 'git://vim-latex.git.sourceforge.net/gitroot/vim-latex/vim-latex'

" 添加文件类型检测(关闭: filetype off)
filetype plugin indent on


" 使用vim自己的键盘模式
set nocompatible
" mapleader指定<leader>, 默认为\
let mapleader = ","
" 制定快捷键',ee'打开.vimrc
map <silent> <leader>ee :e ~/.vimrc<cr>
" .vimrc编辑保存后自动加载
autocmd! bufwritepost .vimrc source ~/.vimrc

" 希望在session文件中不保存当前路径
" 而是希望session文件所在的目录自动成为当前工作目录
set sessionoptions-=curdir
set sessionoptions+=sesdir
" 希望会话文件可以同时被windows版本的vim和UNIX版本的vim共同使用
" slash：把文件名中的'\'替换为'/'
" unix：把会话文件的换行符保存成unix格式
set sessionoptions+=slash
set sessionoptions+=unix


"""""""""""""""""""""""""""
" 显示相关
"""""""""""""""""""""""""""
" 修改光标形状
" For Konsole in KDE4
" Vim进入插入模式，它将发送't_SI'转义序列
" Vim离开插入模式，发送't_EI'
"let &t_SI = "\]50;CursorShape=1\x7"
"let &t_EI = "\]50;CursorShape=0\x7"
" For Gnome Terminal
if has("autocmd")
	au InsertEnter * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape ibeam"
	au InsertLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block"
endif

" 高亮光标所在行
set cul
" 启动的时候不显示那个援助乌干达儿童的提示
set shortmess=atI
" 不要图形按钮
set go=
" 设置背景主题
color desert	" night
color ron
" 设置字体
"set guifont=Courier_New:h10:cANSI
" 用浅色高亮当前行
autocmd InsertEnter * se cul
" 显示标尺
set ruler
" 输入的命令显示出来，看的清楚些
set showcmd
" 允许backspace和光标键跨越行边界(不建议)
"set whichwrap+=<,>,h,l
" 光标移动到buffer的顶部和底部时保持3行距离
set scrolloff=3
"状态行显示的内容
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
" 启动显示状态行(1),总是显示状态行(2)
set laststatus=2
" 允许折叠
" zR打开所有折叠
" zo打开当前折叠
"set foldenable
" 关闭折叠
set foldlevelstart=99
" 按语法折叠
"set foldmethod=syntax
"去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限
set nocompatible
" 自动缩进
set autoindent
" 为C程序提供自动缩进
set smartindent
set cindent
" Tab键的宽度
set tabstop=4
" 统一缩进为4
set softtabstop=4
set shiftwidth=4
" 不要用空格代替制表符
set noexpandtab
" 在行和段开始处使用制表符
set smarttab
" 显示行号 :set number
" 关闭显示 :set number!
set number
" 历史记录数
set history=1000
" 搜索逐字符高亮
set hlsearch
set incsearch
" 把时间strftime()的语言格式设置为en
if MySys() == "linux"
	:language time en_US.utf8
endif
" 总是显示状态行
set cmdheight=2
" 侦测文件类型
filetype on
" 载入文件类型插件
filetype plugin on
" 为特定文件类型载入相关缩进文件
filetype indent on
" 保存全局变量
set viminfo+=!
" 带有如下符号的单词不要被换行分割
set iskeyword+=_,$,@,%,#,-

" markdown配置
au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn}   set filetype=mkd
au BufRead,BufNewFile *.{go}   set filetype=go
au BufRead,BufNewFile *.{html} set filetype=html
" rkdown to HTML
nmap md :!~/.vim/markdown.pl % > %.html <CR><CR>
" 打开html文件,但需添加路径
" nmap fi :!google-chrome %.html & <CR>


"""""""""""""""""""
" 新文件标题
"""""""""""""""""""
" 新建.c,.h,.sh,.java文件，自动插入文件头
" 打开html文件,但需添加路径
" 打开html文件,但需添加路径
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java,*.py,*.pl,*.md,*.html exec ":call SetTitle()"
" 定义函数SetTitle，自动插入文件头
func! SetTitle()
	" 如果文件类型为.sh文件
	if &filetype == 'sh'
		call setline(1, "\#!/usr/bin/env sh")
		call append(line("."), "\#########################################################################")
		call append(line(".")+1, "\# File Name: ".expand("%"))
		call append(line(".")+2, "\# Author: jphome")
		call append(line(".")+3, "\# mail: jphome98@gmail.com")
		call append(line(".")+4, "\# Created Time: ".strftime("%c"))
		call append(line(".")+5, "\#########################################################################")
		call append(line(".")+6, "")
		call append(line(".")+7, "")
	elseif &filetype == 'perl'
		call setline(1, "\#!/usr/bin/env perl -w")
		call append(line("."),"\#########################################################################")
		call append(line(".")+1, "\# File Name: ".expand("%"))
		call append(line(".")+2, "\# Author: jphome")
		call append(line(".")+3, "\# mail: jphome98@gmail.com")
		call append(line(".")+4, "\# Created Time: ".strftime("%c"))
		call append(line(".")+5, "\#########################################################################")
		call append(line(".")+6, "use strict;")
		call append(line(".")+7, "use warnings;")
		call append(line(".")+8, "")
		call append(line(".")+9, "")
    elseif &filetype == 'python'
        call setline(1,"#!/usr/bin/env python")
        call append(line("."), "# -*- coding=utf-8 -*-")
		call append(line(".")+1, "\#########################################################################")
		call append(line(".")+2, "\# File Name: ".expand("%"))
		call append(line(".")+3, "\# Author: jphome")
		call append(line(".")+4, "\# mail: jphome98@gmail.com")
		call append(line(".")+5, "\# Created Time: ".strftime("%c"))
		call append(line(".")+6, "\#########################################################################")
		call append(line(".")+7, "")
		call append(line(".")+8, "")
    elseif &filetype == 'mkd'
        call setline(1,"---")
        call append(line("."), "title: ")
		call append(line(".")+1, "date: '".strftime("%Y-%m-%d %H:%M:%S")."'")
		call append(line(".")+2, "permalink: ")
		call append(line(".")+3, "description: ")
		call append(line(".")+4, "categories: ")
		call append(line(".")+5, "- ")
		call append(line(".")+6, "- ")
		call append(line(".")+7, "")
		call append(line(".")+8, "tags: ")
		call append(line(".")+9, "- ")
		call append(line(".")+10, "---")
		call append(line(".")+11, "")
		call append(line(".")+12, "")
	elseif &filetype == 'html'
		call setline(1,"<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">")
		call append(line("."), "<html xmlns=\"http://www.w3.org/1999/xhtml\" xml:lang=\"zh\" lang=\"zh\" dir=\"ltr\">")
		call append(line(".")+1, "<head>")
		call append(line(".")+2, "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />")
		call append(line(".")+3, "<title></title>")
		call append(line(".")+4, "</head>")
		call append(line(".")+5, "")
		call append(line(".")+6, "<body>")
		call append(line(".")+7, "")
		call append(line(".")+8, "")
		call append(line(".")+9, "</body>")
		call append(line(".")+10, "</html>")
	else
		call setline(1, "/**")
		call append(line("."),   " * @file   ".expand("%"))
		call append(line(".")+1, " * @author jphome <jphome98@gmail.com>")
        call append(line(".")+2, " * @date   ".strftime("%c"))
		call append(line(".")+3, " *")
		call append(line(".")+4, " * @brief ")
		call append(line(".")+5, " *")
		call append(line(".")+6, " *")
		call append(line(".")+7, " */")
        call append(line(".")+8, "")
	endif
	if &filetype == 'cpp'
		call append(line(".")+9,  "#include <iostream>")
		call append(line(".")+10, "using namespace std;")
		call append(line(".")+11, "")
	endif
	if &filetype == 'c'
		call append(line(".")+9,  "#include <stdio.h>")
		call append(line(".")+10, "")
	endif
"	if &filetype == 'java'
"		call append(line(".")+6,"public class ".expand("%"))
"		call append(line(".")+7,"")
"	endif
endfunc
" 新建文件后，自动定位到文件末尾
autocmd BufNewFile * normal G




"""""""""""""""""""
" 键盘命令
"""""""""""""""""""
" 选中状态下 Ctrl+c 复制
map <C-v> "*pa
imap <C-v> <Esc>"*pa
vmap <C-c> "+y
set mouse=v
" set clipboard=unnamed
" 列出当前目录文件
map <F3> :tabnew .<CR>
" 打开树状文件目录
map <C-F3> \be
:autocmd BufRead,BufNewFile *.dot map <F5> :w<CR>:!dot -Tjpg -o %<.jpg % && eog %<.jpg  <CR><CR> && exec "redr!"
" 按F5编译运行
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'cpp'
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'java'
		exec "!javac %"
		exec "!time java %<"
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		exec "!time python2.7 %"
    elseif &filetype == 'html'
        exec "!firefox % &"
    elseif &filetype == 'go'
"        exec "!go build %<"
        exec "!time go run %"
    elseif &filetype == 'mkd'
		call append(0, "---")
		call append(1, "title: ")
		call append(2, "date: '".strftime("%Y-%m-%d %H:%M:%S")."'")
		call append(3, "permalink: ")
		call append(4, "description: ")
		call append(5, "categories: ")
		call append(6, "- ")
		call append(7, "- ")
		call append(8, "")
		call append(9, "tags:")
		call append(10, "- ")
		call append(11, "---")
		call append(12, "")
		call append(13, "")
"        exec "!echo %"
"        exec "!touch ~/temp.html"
"        exec "!perl ~/.vim/markdown.pl % > /tmp/temp.html<"<CR>
"        exec "!markdown % > /tmp/temp.html<"<CR>
"        exec "md"
"        exec "!firefox /tmp/markdown.html &"
	endif
endfunc

" 需要事先设置blog_root环境变量
map <C-F5> :call RunXxx()<CR>
func! RunXxx()
	exec "w"
    if &filetype == 'mkd'
		exec "!cp % $blog_root/posts"
		exec "!cd $blog_root && gor compile"
	endif
endfunc

" C,C++的调试
map <F8> :call Rungdb()<CR>
func! Rungdb()
	exec "w"
	exec "!g++ % -g -o %<"
	exec "!gdb ./%<"
endfunc



"""""""""""""""""
" 实用设置
"""""""""""""""""
if has("autocmd")
      autocmd BufReadPost *
          \ if line("'\"") > 0 && line("'\"") <= line("$") |
          \   exe "normal g`\"" |
          \ endif
endif

" 设置当文件被改动时自动载入
set autoread
" quickfix模式
autocmd FileType c,cpp map <buffer> <leader><space> :w<cr>:make<cr>
" 代码补全
set completeopt=preview,menu
" 允许插件
filetype plugin on
" 共享剪贴板
" set clipboard+=unnamed
" 自动保存
set autowrite
set ruler                   " 打开状态栏标尺
set cursorline              " 突出显示当前行
set magic                   " 设置魔术
set guioptions-=T           " 隐藏工具栏
set guioptions-=m           " 隐藏菜单栏
" set foldcolumn=0
" set foldmethod=indent
" set foldlevel=3
" 去掉输入错误的提示声音
set noeb
" 在处理未保存或只读文件的时候，弹出确认
set confirm
" 禁止生成临时文件
set nobackup
set noswapfile
" 搜索忽略大小写
set ignorecase



set linespace=0
" 增强模式中的命令行自动完成操作
set wildmenu
" 使回格键（backspace）正常处理indent, eol, start等
set backspace=2
" 允许backspace和光标键跨越行边界
set whichwrap+=<,>,h,l
" 可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）
set mouse=a
set selection=exclusive
set selectmode=mouse,key
" 通过使用: commands命令，告诉我们文件的哪一行被改变过
set report=0
" 在被分割的窗口间显示空白，便于阅读
set fillchars=vert:\ ,stl:\ ,stlnc:\
" 高亮显示匹配的括号
set showmatch
" 匹配括号高亮的时间（单位是十分之一秒）
set matchtime=1
" 光标移动到buffer的顶部和底部时保持3行距离
set scrolloff=3
" 自动补全
"":inoremap ( ()<ESC>i
"":inoremap ) <c-r>=ClosePair(')')<CR>
":inoremap { {<CR>}<ESC>O
":inoremap } <c-r>=ClosePair('}')<CR>
"":inoremap [ []<ESC>i
"":inoremap ] <c-r>=ClosePair(']')<CR>
"":inoremap " ""<ESC>i
"":inoremap ' ''<ESC>i
""function! ClosePair(char)
""	if getline('.')[col('.') - 1] == a:char
""		return "\<Right>"
""	else
""		return a:char
""	endif
""endfunction
filetype plugin indent on
" 打开文件类型检测, 加了这句才可以用智能补全
set completeopt=longest,menu







"""""""""""""""""""""""
" Taglist (ctags) tag列表
"""""""""""""""""""""""
map <silent> <F9> <ESC>:Tlist<CR>
if MySys() == "windows"
	"let Tlist_Ctags_Cmd = 'ctags'
elseif MySys() == "linux"
	set shell=/bin/bash
	let Tlist_Ctags_Cmd = '/usr/bin/ctags'
endif
let Tlist_Auto_Open = 0				" 启动vim不自动开启tlist
let Tlist_Show_One_File = 0			" 同时显示多个文件的tag，只显示当前文件的
let Tlist_File_Fold_Auto_Close = 1	" 同时显示多文件tag时，折叠其他文件的tag
let Tlist_Exit_OnlyWindow = 1		" 如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Use_Left_Window = 1		" 在右侧窗口中显示taglist窗口
let Tlist_WinWidth = 25


""""""""""""""""""""""""
" netrw-browse 文件浏览器
" ,fe  打开netrw
""""""""""""""""""""""""
let g:netrw_winsize = 20
nmap <silent> <leader>fe :Sexplore!<CR>


"""""""""""""""""""""""
" BufExplorer
" ,bv   打开buf
"""""""""""""""""""""""
let g:bufExplorerDefaultHelp=0          " Do not show default help.
let g:bufExplorerShowRelativePath=1     " Show relative paths.
let g:bufExplorerSortBy='mru'           " Sort by most recently used.
let g:bufExplorerSplitRight=0           " Split left.
let g:bufExplorerSplitVertical=1        " Split vertically.
let g:bufExplorerSplitVertSize = 30     " Split width
let g:bufExplorerUseCurrentWindow=1     " Open in new window.
let g:bufExplorerHorzSize=6
let g:BufExplorerMaxHeight=30
autocmd BufWinEnter \[Buf\ List\] setl nonumber


"""""""""""""""""""""""
" winmanager
" ,bb	打开窗口管理器
"""""""""""""""""""""""
let g:winManagerWindowLayout = "BufExplorer,FileExplorer|TagList"
let g:winManagerWidth = 30
let g:defaultExplorer = 0
nmap <C-w>1 :FirstExplorerWindow<CR>
nmap <C-w>2 :BottomExplorerWindow<CR>
nmap <silent> <leader>bb :WMToggle<CR>


"""""""""""""""""""""""
" lookupfile
" ,lk	找文件
"""""""""""""""""""""""
let g:LookupFile_MinPatLength = 2               " 最少输入2个字符才开始查找
let g:LookupFile_PreserveLastPattern = 0        " 不保存上次查找的字符串
let g:LookupFile_PreservePatternHistory = 1     " 保存查找历史
let g:LookupFile_AlwaysAcceptFirst = 1          " 回车打开第一个匹配项目
let g:LookupFile_AllowNewFiles = 0              " 不允许创建不存在的文件
if filereadable("./filenametags")               " 设置tag文件的名字
   let g:LookupFile_TagExpr = '"./filenametags"'
endif
nmap <silent> <leader>lk <Plug>LookupFile<CR>
nmap <silent> <leader>ll :LUBufs<CR>
nmap <silent> <leader>lw :LUWalk<CR>


" minibufexpl插件的一般设置
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1
" let g:miniBufExplorerMoreThanOne = 0


" 输入法
:let g:vimim_map='c-/'
:let g:vimim_punctuation=0	" 不用中文标点
:set pastetoggle=<C-H>
:let g:vimim_cloud=-1


" python补全配置
" Pydiction配置Tab
au BufRead,BufNewFile *.{py,pyw} set filetype=python
let g:pydiction_location = '~/.vim/bundle/Pydiction/complete-dict'
let g:pydiction_menu_height = 20


set helplang=cn
set iskeyword+=.
set fileencodings=utf8
set termencoding=utf8
"set encoding=utf8
set fileencoding=utf8
set fileencodings=utf8,ucs-bom,gbk,cp936,gb2312,gb18030
let &termencoding=&encoding
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim


autocmd FileType python set omnifunc=pythoncomplete#Complete


""""""""""""""""""
" Emacs_style shortcut
""""""""""""""""""
noremap <C-g> <Esc>
map <C-g> <Esc>
nmap <C-g> <Esc>
imap <C-g> <Esc>l
cmap <C-g> <Esc>
vmap <C-g> <Esc>
xmap <C-g> <Esc>
omap <C-g> <Esc>
lmap <C-g> <Esc>

imap <C-b> <left>
imap <C-f> <right>
imap <C-e> <end>
imap <C-a> <home>

imap <C-k> <Esc>lDA
imap <C-d> <del>


""""""""""""""""
" tmux_style shortcut
""""""""""""""""
" 竖向拆分窗口
nmap <C-w>% :vsplit<CR>
" 横向拆分窗口
nmap <C-w>" :split<CR>
" 多窗口切换
nmap <C-w>o <C-w>w
" 关闭窗口
nmap <C-w>0 :q!<CR>
" 保存文件
map <leader>w :w<CR>
" 退出文件
map <leader>q :q<CR>


""""""""""""""""""""
" workspace
""""""""""""""""""""
if filereadable("workspace.vim")
	source workspace.vim
endif

