call plug#begin('~/.vim/plugged')

"""""""""""""""""""""""""""""
""""""""界面配置"""""""""""""
"""""""""""""""""""""""""""""
" 状态条
Plug 'itchyny/lightline.vim'

" git
Plug 'tpope/vim-fugitive'

"""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""" 代码搜索配置插件"""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""
" LeaderF
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }

" Gutentags
Plug 'ludovicchabant/vim-gutentags'
Plug 'skywind3000/gutentags_plus'

" Preview
Plug 'skywind3000/vim-preview'

"""""""""""""""""""""""""""""""""""""
""""""""""增强配置"""""""""""""""""""
"""""""""""""""""""""""""""""""""""""
" AsyncRun
Plug 'skywind3000/asyncrun.vim'

"""""""""""""""""""""""""""""""""""
""""""""""""颜色"""""""""""""""""""
"""""""""""""""""""""""""""""""""""
Plug 'altercation/vim-colors-solarized'

call plug#end()
