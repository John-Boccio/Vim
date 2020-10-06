"------- BEGIN PLUGINS -------
" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" List of plugins:

" Fuzzy File Finder
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'
" Better statusline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Initialize plugin system
call plug#end()
"------- END PLUGINS -------

" Turn on syntax highlighting
syntax on

" Show line numbers
set number

" Show file stats
set ruler

" Map jj to escape
:imap jj <Esc>

" Change cursor depending on mode
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Persistent undo
set undofile " Maintain undo history between sessions
set undodir=~/.vim/undodir

" Use UTF-8 encoding
 set encoding=utf-8

" Have line across current cursor row
set cursorline

" Allow mouse use
set mouse=a

" Always have 5 lines above or below the cursor
set scrolloff=5

" Set amount of spaces per tab
" set expandtab " Use spaces instead of tabs
set tabstop=4
set shiftwidth=4

" Set ignore case and use smart case for searching, highlight searches
set ignorecase
set smartcase
set hlsearch

" Show matching pair for [], {}, ()
set showmatch

" Make backspace work like most other programs
set backspace=indent,eol,start

"------- Fuzzy File Finder config -------
nnoremap <c-p> :FZF<cr>
"------- End Fuzzy File Finder config -------

" Set color scheme to desert
:colorscheme desertink

