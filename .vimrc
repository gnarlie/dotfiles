" highlight extra whitespace, when not insert mode
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=#881100
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+%#\@<!$/

set encoding=utf-8

color zenburn
set number
set autowriteall
syntax on
filetype plugin indent on
set cursorline

" remove comment char when joining lines
if v:version >= 703
    set conceallevel=1
    set formatoptions+=j
endif

let mapleader=","
let maplocalleader=","

set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

set hls
set incsearch
set ignorecase
set smartcase

set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

"auto save
:au FocusLost * silent! wa
:au CursorHold * silent! up

nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
let NERDChristmasTree = 1
let NERDTreeHighlightCursorline = 1
let NERDTreeShowBookmarks = 1
let NERDTreeShowHidden = 1
let NERDTreeIgnore=['\.swp$', '\~$']
let NERDTreeStatusline = "%{exists('b:NERDTreeRoot')?substitute(b:NERDTreeRoot.path.str(), $HOME, '~', '') . ' [' . fugitive#head() . ']' :''}"
nmap <leader>d :NERDTreeToggle<CR>

set guifont=Mono\ 9
set go-=T
set go-=m

set statusline=%<%f\ \%y%=line\ %l\ of\ %L\ col\ %c
" set ruler

" Opens an edit command with the path of the currently edited file filled in
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" Find in Files
nmap <silent> <F3> :execute 'grep ' . expand("<cword>") . " " . expand("%:h") . "/*." . expand("%:e") <BAR> copen <CR> <CR>

" 'Better' window keys
map <silent> <A-UP> :wincmd k <CR>
map <silent> <A-DOWN> :wincmd j <CR>
map <silent> <A-LEFT> :wincmd h <CR>
map <silent> <A-RIGHT> :wincmd l <CR>

" C/C++ jump to header
map <F4> :w<CR>:e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>
map <S-F4> :split %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>
map <C-F4> :vsplit %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>

set rtp+=~/.vim/bundle/Vundle.vim
execute vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
if v:version >= 703
    Plugin 'dense-analysis/ale'
endif
Plugin 'altercation/vim-colors-solarized'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'Xuyuanp/nerdtree-git-plugin'
execute vundle#end()

nmap <M-.> :bp<CR>
nmap <M-,> :bn<CR>
nmap <M-b> :MBEToggleAll<CR>

map <leader>m :MBEOpen<CR>:MBEFocus<CR>

" settings for a multi-project repo - search starting in the current file's
" dir. Can also set another root marker (e.g. OWNERS.txt or node_modules)
let g:ctrlp_working_path_mode = 'a'
let g:ctrlp_user_command = [ '.git', 'cd %s && git ls-files . -co --exclude-standard' ]

" load project specific settings
function! LoadProject()
    let projfile = $HOME . "/.vim/projects/" . fnamemodify(getcwd(), ":t") . ".vim"
    if filereadable(projfile)
        exec "source " . projfile
    endif
    exec "nmap <C-S-S> :e " . projfile . "<CR>"
endfunction

call LoadProject()

