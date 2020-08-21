"""
" 基本配置
"""

" 编解码
set encoding=utf-8
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1

" 关闭兼容模式
set nocompatible

"""""""""""""""""""""""""""""""""""""""""
" vim控制配置
"""""""""""""""""""""""""""""""""""""""""
" 在title bar显示文件名
set title

" 总是显示状态栏
set laststatus=2

" 显示光标当前位置
set ruler
" 禁止光标闪烁
set gcr=a:block-blinkon0

"""""""""""""""""""""""""""""""""""""""""
" 内容显示配置
"""""""""""""""""""""""""""""""""""""""""
" 开启代码颜色高亮
syntax on
syntax enable

" 告诉vim terminal支持 256 colors
set t_Co=256

" color scheme
set background=light
color solarized

"""""""""""""""""""""""""""""""""""""""""
" 代码查看配置
"""""""""""""""""""""""""""""""""""""""""
" 开启实时搜索功能
set incsearch
" 搜索时大小写不敏感
set ignorecase

" vim 自身命令行模式智能补全
set wildmenu
set smartcase
set showmatch
set matchtime=2

" 开启行号显示
set number

" 高亮显示当前行/列
set cursorline
set cursorcolumn

" 高亮显示搜索结果
set hlsearch

" 不自动换行
set nowrap

" 终端滚动时时刻保留n行在界面中
set scrolloff=25

" 基于缩进或语法进行代码折叠
set foldmethod=syntax
" 启动 vim 时关闭折叠代码
set nofoldenable

" 默认收缩设置
set autoindent
set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=80
set smarttab
set expandtab

" 根据侦测到的不同文件类型处理不同的插件和缩放
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=120
autocmd FileType html,htmldjango,xhtml,haml setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=0 wrap
autocmd FileType make setlocal noexpandtab
autocmd FileType c,h,cpp,c++ setlocal noexpandtab
autocmd FileType sh setlocal textwidth=0 wrap
