""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif		" 记住上次打开的位置，注意~/.viminfo 的权限
set autoread                " 设置当文件被改动时自动载入
filetype plugin on          "允许插件  
set clipboard+=unnamed      "共享剪贴板  
set nobackup                "从不备份  
set autowrite               " 自动保存
set cursorline              " 突出显示当前行
set magic                   " 设置魔术
set guioptions-=T           " 隐藏工具栏
set guioptions-=m           " 隐藏菜单栏
set foldcolumn=0            " 设置在状态行显示的信息
set confirm                 " 在处理未保存或只读文件的时候，弹出确认
set autoindent              " 自动缩进
"{ 统一缩进为4
    set tabstop=4               " Tab键的宽度
    set softtabstop=4
    set shiftwidth=4
	set expandtab             " 不要用空格代替制表符
"}
set smarttab                " 在行和段开始处使用制表符
set history=100             " 历史记录数
set ignorecase              "搜索忽略大小写
"{  搜索逐字符高亮
    set hlsearch
    set incsearch
"}
set gdefault                "行内替换
"语言设置
set langmenu=zh_CN.UTF-8
set helplang=cn
set iskeyword+=_,$,@,%,#,-              " 带有如下符号的单词不要被换行分割
set linespace=1             " 字符间插入的像素行数目
set wildmenu                " 增强模式中的命令行自动完成操作
set backspace=2             " 使回格键（backspace）正常处理indent, eol, start等
" 允许backspace和光标键跨越行边界
set whichwrap+=<,>,h,l
"{  可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）
    set mouse=a
    set selection=exclusive
    set selectmode=mouse,key
"}
set report=0      " 通过使用: commands命令，告诉我们文件的哪一行被改变过
set showmatch     " 高亮显示匹配的括号
set matchtime=1   " 匹配括号高亮的时间（单位是十分之一秒）
set shortmess=atI   " 启动的时候不显示那个援助乌干达儿童的提示  
set nu              " 显示行号  
autocmd InsertLeave * se nocul  " 用浅色高亮当前行  
set ruler           " 显示标尺  
set showcmd         " 输入的命令显示出来，看的清楚些  
set cmdheight=1     " 命令行（在状态行下）的高度，设置为1  
set scrolloff=3     " 光标移动到buffer的顶部和底部时保持3行距离  
set laststatus=2    " 启动显示状态行(1),总是显示状态行(2)  
set foldenable      " 允许折叠  
set foldmethod=manual   " 手动折叠  
set nocompatible  "去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限  
" 显示中文帮助
if version >= 603
    set helplang=cn
    set encoding=utf-8
endif
"{ 编码相关设置
    set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
    set termencoding=utf-8
    set encoding=utf-8
    set fileencodings=utf-8
    set fileencoding=utf-8
"}  
filetype plugin on          " 载入文件类型插件
filetype indent on          " 为特定文件类型载入相关缩进文件
if version > 580
    highlight clear
    if exists("syntax_on")
        syntax reset
    endif
endif
"{  color schem solorized
    syntax on           " 语法高亮  
    set background=dark
    colorscheme solarized
"}
"{plugin begin
"{ pathogen
execute pathogen#infect()
"}

"{nerdcommenter 
let g:NERDSpaceDelims = 1 " 注释之后添加1个空格

let g:NERDCompactSexyComs = 1 " 多行注释

let g:NERDDefaultAlign = 'left' "注释符左对齐

let g:NERDAltDelims_php = 1 "默认使用的注释风格

let g:NERDCustomDelimiters = { 'php': { 'left': '/**','right': '*/' } } "自定义语言注释风格

let g:NERDCommentEmptyLines = 1 "允许注释空行

let g:NERDTrimTrailingWhitespace = 1
"}
"{gitv 


"}
"{tagbar  

set tags=/home/homework/tags

"}
"{vim-easy-align
    "Start interactive EasyAlign in visual mode (e.g. vipga)
    xmap ga <Plug>(EasyAlign)
    "Start interactive EasyAlign for a motion/text object (e.g. gaip)
    nmap ga <Plug>(EasyAlign)
"}
"{vim-easymotion

"}
"{vim-fugitive


"}
"{ag.vim


"}
"{ vim-gitgutter
set updatetime=100
let g:gitgutter_max_signs = 50000
"}

""}plugin end

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" some key maps
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vmap <C-c> "+y						" 选中状态下 Ctrl+c 复制
nnoremap <F2> :g/^\s*$/d<CR>		"去空行  
:map <C-o>  :tabn <CR>
:map <C-i>  :tabp <CR>
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

"{	php 语法检查 , 保存:w 时，进行语法检查，注意配置 php 的位置
autocmd BufWritePost *.php call PHPSyntaxCheck()
if !exists('g:PHP_SYNTAX_CHECK_BIN')
    let g:PHP_SYNTAX_CHECK_BIN = '/home/homework/php/bin/php'
endif
function! PHPSyntaxCheck()
    let result = system(g:PHP_SYNTAX_CHECK_BIN.' -l -n '.expand('%'))
    if (stridx(result, 'No syntax errors detected') == -1)
        echohl WarningMsg | echo result | echohl None
    endif
endfunction
"}
