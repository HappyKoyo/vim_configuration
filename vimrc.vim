"---General---"
inoremap <silent> jj <ESC>
set smartindent
set expandtab
set tabstop=4
set virtualedit=onemore
set autoread
set clipboard=unnamed,autoselect
nnoremap Y y$
nnoremap + <C-a>
nnoremap - <C-x>

"---Visualization---"
colorscheme deus 
"colorscheme molokai
set t_Co=256
syntax on
set number
set title
"set cursorcolumn
set guioptions+=R

"---Movement---"
noremap j gj
noremap k gk
imap <C-p> <Up>
imap <C-n> <Down>
imap <C-b> <Left>
imap <C-f> <Right>
set whichwrap=b,s,h,l,<,>,[,],~

"---Completion---"

"---Search---"
set wrapscan
set hlsearch
nmap <Esc><Esc> :nohlsearch<CR><Esc>
set ignorecase
set smartcase
set incsearch

