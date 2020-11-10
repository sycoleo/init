" ----------gutentags.vim插件配置-----------------------------------------------
set tags=./.tags;,.tags
let $GTAGSLABEL = 'pygments'
if has('unix')
    if system('uname -s') == "Darwin\n"
        let $GTAGSLABEL = '/usr/local/etc/gtags.conf'
    else
        let $GTAGSCONF = '/etc/gtags.conf'
    endif
endif

" gutentags 搜索工程目录的标志，当前文件路径向上递归直到碰到这些文件/目录名
let g:gutentags_project_root = ['.git','.root','MAINTAINERS', 'COPYING','.project']
let g:gutentags_file_list_command = {
  \'markers': {
    \'cscope.lst': 'taglslist',
    \'.git': 'taglslist',
    \'MAINTAINERS': 'taglslist',
    \'COPYING': 'taglslist',
    \},
\}

" gtags外部参数配置文件
let g:gutentags_gtags_options_file = '.gtags.optconf.log'
" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'
" 同时开启 ctags 和 gtags 支持：
let g:gutentags_modules = []
if executable('ctags')
	let g:gutentags_modules += ['ctags']
endif
if executable('gtags-cscope') && executable('gtags')
	let g:gutentags_modules += ['gtags_cscope']
endif
" 将自动生成的 ctags/gtags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let g:gutentags_cache_dir = expand('~/.cache/tags')

" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = []
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extras=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" 如果使用 universal ctags 需要增加下面一行
let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']

" 禁用 gutentags 自动加载 gtags 数据库的行为
" 避免多个项目数据库相互干扰,使用plus插件解决问题
let g:gutentags_auto_add_gtags_cscope = 0

" change focus to quickfix window after search (optional).
let g:gutentags_plus_switch = 1

" debug
let g:gutentags_define_advanced_commands = 1

"----------vim-preview配置-------------------------------------------------
"P 预览 大p关闭
autocmd FileType qf nnoremap <silent><buffer> p :PreviewQuickfix<cr>
autocmd FileType qf nnoremap <silent><buffer> P :PreviewClose<cr>

" -----------LeaderF 模糊文件查找-------------------------------
" Ctrl + f 打开文件搜索
let g:Lf_ShortcutF = '<c-f>'
noremap <Leader>ff :LeaderfFunction<cr>
noremap <Leader>fb :LeaderfBuffer<cr>
noremap <Leader>ft :LeaderfTag<cr>
noremap <Leader>fm :LeaderfMru<cr>
noremap <Leader>fl :LeaderfLine<cr>
let g:Lf_GtagsAutoGenerate = 1
" let g:Lf_Gtagslabel = 'native-pygments'
noremap <leader>fr :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fd :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fo :<C-U><C-R>=printf("Leaderf! gtags --recall %s", "")<CR><CR>
noremap <leader>fn :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>
noremap <leader>fp :<C-U><C-R>=printf("Leaderf gtags --previous %s", "")<CR><CR>
noremap <leader>fa :<C-U><C-R>=printf("Leaderf gtags")<CR><CR>

let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }
let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowHeight = 0.30
let g:Lf_CacheDirectory = expand('~/.vim/cache')
let g:Lf_ShowRelativePath = 0
let g:Lf_HideHelp = 1
let g:Lf_StlColorscheme = 'powerline'
let g:Lf_PreviewResult = {'Function':0, 'BufTag':0}

let g:Lf_NormalMap = {
	\ "File":   [["<ESC>", ':exec g:Lf_py "fileExplManager.quit()"<CR>']],
	\ "Buffer": [["<ESC>", ':exec g:Lf_py "bufExplManager.quit()"<CR>']],
	\ "Mru":    [["<ESC>", ':exec g:Lf_py "mruExplManager.quit()"<CR>']],
	\ "Tag":    [["<ESC>", ':exec g:Lf_py "tagExplManager.quit()"<CR>']],
	\ "Function":    [["<ESC>", ':exec g:Lf_py "functionExplManager.quit()"<CR>']],
	\ "Colorscheme":    [["<ESC>", ':exec g:Lf_py "colorschemeExplManager.quit()"<CR>']],
	\ }

"----------asyncrun.vim插件配置--------------------------------------------
" 自动打开 quickfix window ，高度为 6
let g:asyncrun_open = 6

" 任务结束时候响铃提醒
let g:asyncrun_bell = 1

" 设置 F10 打开/关闭 Quickfix 窗口
nnoremap <F10> :call asyncrun#quickfix_toggle(6)<cr>


"--------------------light.vim配置-----------------------------------
" hide mode
set noshowmode
" showtabline always
set showtabline=2

let g:lightline = {
      \ 'colorscheme': 'solarized',
      \   'mode_map': { 'c': 'NORMAL' },
      \   'active': {
      \     'left': [ [ 'mode', 'paste' ],
      \               [ 'branch' ],
      \               [ 'readonly', 'filename', 'modified' ] ],
      \     'right': [ [ 'percent', 'lineinfo' ],
      \                [ 'filetype', 'fileencoding', 'denitepath' ],
      \                [ 'gtags' ]],
      \   },
      \   'component_function': {
      \     'mode': 'LightlineMode',
      \     'branch': 'LightlineBranch',
      \     'filename': 'LightlineFilename',
      \     'modified': 'LightlineModified',
      \     'gtags': 'LightlineCurrentGtags',
      \     'filetype': 'LightlineFiletype',
      \     'fileencoding': 'LightlineFileencoding',
      \     'denitepath': 'LightlineDenitepath',
      \     'percent': 'LightlinePercent',
      \     'lineinfo': 'LightlineLineinfo'
      \   },
      \   'component_expand': {
      \     'readonly': 'LightlineReadonly',
      \   },
      \   'component_type': {
      \     'readonly': 'warning',
      \   },
      \   'subseparator': {
      \     'left': '',
      \     'right': ''
      \   },
      \ }

" functions
function! LightlineMode() abort
  if &filetype ==? 'denite'
    call lightline#link(tolower(denite#get_status('raw_mode')[0]))
    return 'Denite'
  endif
  if winwidth(0) <= 60
    return ''
  endif
  return lightline#mode()
endfunction

function! LightlineBranch() abort
  if winwidth(0) <= 75 || !exists('*fugitive#head')
    return ''
  endif
  return fugitive#head()
endfunction

function! LightlineReadonly() abort
  return &filetype !~? 'help\|man\|denite' && &readonly ? 'RO' : ''
endfunction

function! LightlineFilename() abort
  return (&filetype ==? 'denite' ? denite#get_status('sources') :
        \  &filetype =~? 'tagbar\|nerdtree' ? '' :
        \  &filetype =~? 'help\|man' ? expand('%:t') :
        \  winwidth(0) > 150 ? expand('%') :
        \  winwidth(0) > 110 ? pathshorten(expand('%')) :
        \ '' !=# expand('%:t') ? expand('%:t') :'[No Name]')
endfunction

function! LightlineModified() abort
  return &filetype =~? 'help\|man\|denite' ? '' :
        \ &modified ? '+' :
        \ &modifiable ? '' : '-'
endfunction

function! s:get_gutentags_status(mods) abort
    let l:msg = ''
    if index(a:mods, 'ctags') >= 0 || index(a:mods, 'gtags_cscope') >= 0
       let l:msg .= '♻'
     endif
     return l:msg
endfunction

function! LightlineCurrentGtags() abort
  if winwidth(0) <= 90
        \ || !get(g:, 'loaded_gutentags', 0)
    return ''
  endif
  let msg = gutentags#statusline_cb(function('<SID>get_gutentags_status'))
"  let msg = gutentags#statusline('[', ']')
  return empty(msg) ? '' :  msg
endfunction

function! LightlineFiletype() abort
  if winwidth(0) <= 70 || &filetype ==? 'denite'
    return ''
  endif
  return &filetype
endfunction

function! LightlineFileencoding() abort
  if winwidth(0) <= 70 || &filetype ==? 'denite'
    return ''
  endif
  return (&fileencoding !=# '' ? &fileencoding : &encoding) .
        \ '[' . &fileformat . ']'
endfunction

function! LightlineDenitepath() abort
  if &filetype !=? 'denite'
    return ''
  endif
  return substitute(denite#get_status('path'), '^[' . $HOME, '[~', '')
endfunction

function! LightlinePercent() abort
  if &filetype ==? 'denite'
    let l:line_total = denite#get_status('line_total')
    if l:line_total[1] == 0
      return printf('%3d%%', 100)
    endif
    let l:line_cursor = denite#get_status('line_cursor')
    return printf('%3d%%', 100 * l:line_cursor / l:line_total)
  else
    return printf('%3d%%', 100 * line('.') / line('$'))
  endif
endfunction

function! LightlineLineinfo() abort
  return &filetype ==? 'denite' ? denite#get_status('linenr') :
        \ printf('%3d:%-2d', line('.'), col('.'))
endfunction
