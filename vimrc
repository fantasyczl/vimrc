" basic config
set ruler
set nocompatible

filetype plugin on
filetype indent on

set nu
set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set expandtab
syntax on
set t_Co=256
set colorcolumn=81
highlight ColorColumn ctermbg=235 guibg=#2c2d27
let &colorcolumn="80,".join(range(120,999),",")
set cursorline
set cursorcolumn
set ignorecase smartcase
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
Plugin 'git@github.com:Valloric/MatchTagAlways.git'
Plugin 'git@github.com:fantasyczl/blade-php-vim.git'
Plugin 'git@github.com:itchyny/lightline.vim.git'
Plugin 'git@github.com:begriffs/haskell-vim-now.git'
Plugin 'git@github.com:godlygeek/tabular.git'
Plugin 'git@github.com:fatih/vim-go.git'
Plugin 'lvht/phpcd.vim'
Plugin 'posva/vim-vue'
Plugin 'junegunn/fzf'
"Plugin 'git@github.com:kien/ctrlp.vim.git'
"Plugin 'git@github.com:rking/ag.vim.git'
"Plugin 'git@github.com:wklken/k-vim.git'
"Plugin 'git@github.com:tpope/vim-commentary.git'
"Plugin 'git@github.com:tpope/vim-fugitive.git'

call vundle#end()

" vim-colors-solarized config
syntax enable
if !has('gui_running')
    let g:solarized_termcolors=256
endif

if strftime("%H") > 5 && strftime("%H") < 18
    " set background=dark
    set background=light
else
    set background=light
endif
let g:solarized_contrast="high"
colorscheme solarized

filetype plugin indent on " Required

" Config for indentLine
"¦
imap <C-Return> <CR><CR><C-o>k<C-t>
let g:indentLine_char = '┊'

" Config For MacVim
set guifont=Monaco:h15

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

autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP

" fzf
set rtp+=/usr/local/opt/fzf
silent! nmap <C-P> :FZF<CR>

" Python3
if has('python3')
    command! -nargs=1 Py py3 <args>
    set pythonthreedll=/usr/local/Frameworks/Python.framework/Versions/3.6/Python
    set pythonthreehome=/usr/local/Frameworks/Python.framework/Versions/3.6
endif
