color zenburn
set number
syntax on
filetype plugin indent on

let mapleader=","

set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

set hls
set incsearch
set ignorecase
set smartcase

nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
let NERDChristmasTree = 1
let NERDTreeHighlightCursorline = 1
let NERDTreeShowBookmarks = 1
let NERDTreeShowHidden = 1
nmap <leader>d :NERDTreeToggle<CR>

set guifont=Monospace\ 9

" Opens an edit command with the path of the currently edited file filled in
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" Start CTAGS
let g:ctags_title=0
let g:ctags_statusline=1
let generate_tags=1

" Start taglist
nnoremap <silent> <F8> :TlistToggle<CR>
let Tlist_GainFocus_On_ToggleOpen=1
