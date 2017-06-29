"uto File: _vimrc
" Date: 2009-09-22
" Author: gashero
" NOTE: 配置一份简单的vim配置文件

set nocompatible    "非兼容模式
syntax on           "开启语法高亮
set background=dark "背景色
color desert
set ruler           "在左下角显示当前文件所在行
set showcmd         "在状态栏显示命令
set showmatch       "显示匹配的括号
set ignorecase      "大小写无关匹配
set smartcase       "只能匹配，即小写全匹配，大小写混合则严格匹配
set hlsearch        "搜索时高亮显示
set incsearch       "增量搜索
set nohls           "搜索时随着输入立即定位，不知什么原因会关闭结果高亮
set report=0        "显示修改次数
set mouse=a         "控制台启用鼠标
set number          "行号
set nobackup        "无备份
set cursorline      "高亮当前行背景
set fileencodings=ucs-bom,UTF-8,GBK,BIG5,latin1
set fileencoding=UTF-8
set fileformat=unix "换行使用unix方式
set ambiwidth=double
set noerrorbells    "不显示响铃
set visualbell      "可视化铃声
set foldmarker={,}  "缩进符号
set foldmethod=indent   "缩进作为折叠标识
set foldlevel=100   "不自动折叠
set foldopen-=search    "搜索时不打开折叠
set foldopen-=undo  "撤销时不打开折叠
set updatecount=0   "不使用交换文件
set magic           "使用正则时，除了$ . * ^以外的元字符都要加反斜线
set autoread

"缩进定义
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set smarttab
set backspace=2     "退格键可以删除任何东西
"显示TAB字符为<+++
set list
set list listchars=tab:<+

"映射常用操作
map [r :! python % <CR>
map [o :! python -i % <CR>
map [t :! rst2html.py % %<.html <CR>
map [s :! dot -Tsvg % -o%<.svg <CR>
map [v :! neato -Tpng -Gmaxiter=1000 -Goverlap=false -Esplines=true -Gsep=0.1 -Nfontname=Monaco -Efontname=Monaco % -o%<.png <CR>
imap <Nul> <Space>
map  <Nul> <Nop>
vmap <Nul> <Nop>
cmap <Nul> <Nop>
nmap <Nul> <Nop>

if has("gui_running")
    set lines=25
    set columns=80
    set lazyredraw  "延迟重绘
    set guioptions-=m   "不显示菜单
    set guioptions-=T   "不显示工具栏
    set guifont=Droid\ Sans\ Mono\ 9
endif

if has("autocmd")
    "回到上次文件打开所在行
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
        \| exe "normal g'\"" | endif
    "自动检测文件类型，并载入相关的规则文件
    filetype plugin on
    filetype indent on
    "智能缩进，使用4空格，使用全局的了
    "autocmd FileType python setlocal et | setlocal sta | setlocal sw=4
    "autocmd FileType c setlocal et | setlocal sta | setlocal sw=4
    "autocmd FileType h setlocal et | setlocal sta | setlocal sw=4
endif

"Arduino ino 文件
au BufNewFile,BufRead *.ino set filetype=c

filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
Plugin 'saltstack/salt-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'nvie/vim-flake8'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
let autosave=60  
" 插入匹配括号
inoremap ( ()<LEFT>
inoremap [ []<LEFT>
inoremap { {}<LEFT>
inoremap ' ''<LEFT>
inoremap " ""<LEFT>
" 文件一开就启动nerdtree
let g:nerdtree_open_on_console_startup=1
Plugin 'Valloric/YouCompleteMe'
"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
se cuc
