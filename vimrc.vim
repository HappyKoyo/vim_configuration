"        _           
" __   _(_)_ __ ___  
" \ \ / / | '_ ` _ \ 
"  \ V /| | | | | | |
"   \_/ |_|_| |_| |_|
"                  
"
"

if has('nvim')
    "dein init
    if !&compatible
        set nocompatible
    endif

    " reset augroup
    augroup MyAutoCmd
    autocmd!
    augroup END

    "---dein settings---
    " auto install dein
    let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
    let s:dein_dir = s:cache_home . '/dein'
    let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
    if !isdirectory(s:dein_repo_dir)
        call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
    endif
    let &runtimepath = s:dein_repo_dir .",". &runtimepath

    " load plugin and create cache
    let s:toml_file = fnamemodify(expand('<sfile>'), ':h').'/dein.toml'
    let s:lazy_toml_file = fnamemodify(expand('<sfile>'), ':h').'/dein_lazy.toml'
    if dein#load_state(s:dein_dir)
        call dein#begin(s:dein_dir)
        call dein#load_toml(s:toml_file)
        call dein#load_toml(s:lazy_toml_file)
        call dein#end()
        call dein#save_state()
    endif
    " auto install lack plugin
    if has('vim_starting') && dein#check_install()
        call dein#install()
    endif
    tnoremap <silent> jj <C-\><C-n>
    set guicursor=
    " Workaround some broken plugins which set guicursor indiscriminately.
    "autocmd OptionSet guicursor noautocmd set guicursor=
endif

"---General---"
set smartindent
set expandtab
set tabstop=4
set shiftwidth=4
set virtualedit=onemore
set autoread
set clipboard=unnamed
nnoremap Y y$
nnoremap + <C-a>
nnoremap - <C-x>
au BufNewFile,BufRead *.launch setf xml

"---Visualization---"
set runtimepath+=$HOME/.vim
" colorscheme deus 
colorscheme molokai
set t_Co=256
syntax on
set number
set title
"set cursorcolumn
set guioptions+=R
map <C-n> :NERDTreeToggle<CR>

"---Movement---"
noremap j gj
noremap k gk
set whichwrap=b,s,h,l,<,>,[,],~
"emacs keymaps
"imap <C-p> <Up>
"imap <C-n> <Down>
"imap <C-b> <Left>
"imap <C-f> <Right>

"---Completion---"

"---Search---"
set wrapscan
set hlsearch
nmap <Esc><Esc> :nohlsearch<CR><Esc>
set ignorecase
set smartcase
set incsearch


autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

inoremap <silent>jj <ESC>
set number

"---EnvInfoCode---"

command! EnvInfo call EnvInfo()
function! EnvInfo()
    " carnel version.
    execute ':r! uname -r'
    " python version.
    execute ':r! python -V'
    " Os version.
    execute ':r! cat /etc/lsb-release'
    " ros version.
    execute ':r! rosversion -d'
endfunction
