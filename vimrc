" basic config
set ruler
set nocompatible

filetype plugin on
filetype indent on

set nobackup
set nu
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4
set t_Co=256
set colorcolumn=81
highlight ColorColumn ctermbg=235 guibg=#2c2d27
let &colorcolumn="80,".join(range(120,120),",")
set cursorline
set cursorcolumn
set ignorecase smartcase
set smartcase
set hlsearch
set incsearch
set conceallevel=0
set concealcursor=""
" vim 自身命令行模式智能补全
set wildmenu
syntax sync minlines=100
syntax sync maxlines=240
set synmaxcol=800

" fold
set foldmethod=indent
" 启动时关闭折叠代码
set nofoldenable

" encoding
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,chiese,cp936

" ui
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R

" tab
if has('gui_running')
    set showtabline=2
endif

set cmdheight=1

filetype off    " Required

" 在右边打开帮助
autocmd FileType help wincmd L

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'    " Required
Plugin 'git@github.com:scrooloose/nerdtree.git'
Plugin 'git@github.com:Valloric/YouCompleteMe.git'
Plugin 'git@github.com:terryma/vim-multiple-cursors.git'
Plugin 'git@github.com:altercation/vim-colors-solarized.git'
Plugin 'git@github.com:Yggdroot/indentLine.git'
Plugin 'git@github.com:Raimondi/delimitMate.git'
Plugin 'git@github.com:mattn/emmet-vim.git'
Plugin 'git@github.com:itchyny/lightline.vim.git'
Plugin 'git@github.com:begriffs/haskell-vim-now.git'
Plugin 'git@github.com:godlygeek/tabular.git'
Plugin 'git@github.com:fatih/vim-go.git'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'git@github.com:fantasyczl/smarty-vim.git'
Plugin 'git@github.com:morhetz/gruvbox.git'
Plugin 'git@github.com:vim-syntastic/syntastic.git'
Plugin 'git@github.com:tpope/vim-fugitive.git'
Plugin 'mhinz/vim-signify'
Plugin 'shumphrey/fugitive-gitlab.vim'
Plugin 'majutsushi/tagbar'
Plugin 'jremmen/vim-ripgrep'
"Plugin 'git@github.com:Valloric/MatchTagAlways.git'
"Plugin 'git@github.com:fantasyczl/blade-php-vim.git'
Plugin 'posva/vim-vue'
"Plugin 'ludovicchabant/vim-gutentags'
Plugin 'git@github.com:rking/ag.vim.git'
"Plugin 'git@github.com:wklken/k-vim.git'
Plugin 'shmup/vim-sql-syntax'

call vundle#end()

" vim-colors-solarized config
syntax enable
if !has('gui_running')
    let g:solarized_termcolors=256
endif

if strftime("%H") > 5 && strftime("%H") < 18
    set background=dark
else
    " set background=light
    set background=dark
endif
let g:solarized_contrast="high"
colorscheme solarized
" colorscheme gruvbox

filetype plugin indent on " Required

" Config for indentLine
"¦
"imap <C-Return> <CR><CR><C-o>k<C-t>
imap <C-Return> <CR><C-o>O
let g:indentLine_char = '┊'

" Config For MacVim
if has('gui_macvim')
    set guifont=Monaco:h16
endif

" Config For YouCompleteMe
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
let g:enable_ycm_at_startup=1
let g:ycm_auto_trigger=1
" let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'

" Powerline {
" set guifont = PowerlineSymbols\ for\ Powerline
let g:Powerline_symbols = 'fancy'
" }

" NERDTree
let g:ctrlp_dont_split  = 'nerdtree'
" 按下 F2 调出/隐藏 NERDTree
silent! nmap <F2> :NERDTreeToggle<CR>
silent! nmap <F3> :NERDTreeFind<CR>
silent! nmap <F4> <C-w>w

" MatchAlways
let g:mta_filetypes = { 'html': 1, 'xhtml': 1, 'blade': 1, 'xml': 1}

" CtrlP
let g:ctrlp_switch_buffer = 0

" ag.vim
let g:ag_working_path_mode="r"

" emmet-vim
let g:user_emmet_mode='a'

" DelimitMate Config
let g:delimitMate_matchpairs = "(:),[:],{:}"
au FileType html,blade let b:delimitMate_matchpairs = "(:),[:],{:},<:>"

" lightline
set laststatus=2

" 这个会报错
" autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP

" fzf
set rtp+=/usr/local/opt/fzf
silent! nmap <C-P> :FZF<CR>

" Python3
if has('python3')
    " TODO
    "command! -nargs=1 Py py3 <args>
    "set pythonthreedll=/usr/local/Frameworks/Python.framework/Versions/Current/Python
    "set pythonthreehome=/usr/local/Frameworks/Python.framework/Versions/Current
endif


"  fnction
"SET Comment START
"autocmd BufNewFile *.php,*.js,*.cpp,*.py exec ":call SetComment()" |normal 10Go

func SetComment()
    if expand("%:e") == 'php'
        call setline(1, "<?php")
    elseif expand("%:e") == 'js'
        call setline(1, '//JavaScript file')
    elseif expand("%:e") == 'cpp'
        call setline(1, '//C++ file')
    elseif expand("%:e") == 'py'
        call setline(1, '#!/usr/bin/env python3')
        call append(1, '#coding:utf-8')
        return 0
    endif

    call append(1, '')
    call append(2, '/**************************************************************************')
    call append(3, ' *')
    call append(4, ' * Copyright (c) 2019 Zuoyebang.com, Inc. All Rights Reserved')
    call append(5, ' *')
    call append(6, ' **************************************************************************/')
    call append(7, '')
    call append(8, '')
    call append(9, '/**')
    call append(10, ' * @description:   ---')
    call append(11, ' * @author:        caozilong@zuoyebang.com')
    call append(12, ' * @date:        '.strftime("%Y-%m-%d %H:%M:%S"))
    call append(13, ' */')
endfunc

map <F10> :call SetComment()<CR>:12<CR>
"SET Comment END

" fugitive-gitlab.vim
let g:fugitive_gitlab_domains = ['https://git.afpai.com']
let g:PHP_vintage_case_default_indent=1

" pdv
" let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"
" nnoremap <buffer> <F8> :call pdv#DocumentWithSnip()<CR>

map <F7> f`lC,<Esc><CR>
map <F8> lywf,i => ''<Esc>hp<CR>
map <F9> f_x~


let g:indentLine_fileTypeExclude = ['json']

" vim-go disable auto gofmt when save, becase gofmt mess up file content.
let g:go_fmt_autosave=0

auto FileType markdown setl conceallevel=0
auto FileType json setl conceallevel=0

" For Plugin ybian/smartim
" let g:smartim_default = 'com.apple.keylayout.ABC'

nmap <F10> :GoDef<CR>

" syntastic
" speed is too slow
"let g:syntastic_python_checkers = ['pylint']

" rust
au FileType rust let b:delimitMate_matchpairs="(:),[:],{:}"
au FileType rust let b:delimitMate_quotes = "\""
