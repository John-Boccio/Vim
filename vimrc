"------- BEGIN PLUGINS -------
" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" List of plugins:

" Fuzzy File Finder
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'
" Autogenerates tags for code bases
Plug 'ludovicchabant/vim-gutentags'
" Better statusline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Autocomplete
Plug 'ycm-core/YouCompleteMe'
" Syntax linting
Plug 'vim-syntastic/syntastic'

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

"------- Gutentags config ------- 
" config project root markers.
let g:gutentags_project_root = ['.git', '.root', 'Makefile']

" generate datebases in my cache directory, prevent gtags files polluting my project
let g:gutentags_ctags_tagfile = '.tags'
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags

" change focus to quickfix window after search (optional).
let g:gutentags_plus_switch = 1
"------- End gutentags config -------

"------- VimCompletesMe config -------
" Allow tab to do more autocompletion
autocmd FileType text,markdown let b:vcm_tab_complete = 'dict'"
"------- End VimCompletesMe config -------

"------- Syntaxtic config -------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"------- End Syntaxtic config -------

"------- Fuzzy File Finder config -------
nnoremap <c-p> :FZF<cr>
"------- End Fuzzy File Finder config -------

" Function for loading cscope database
function! LoadCscope()
  let db = findfile("cscope.out", ".;")
  if (!empty(db))
    let path = strpart(db, 0, match(db, "/cscope.out$"))
    set nocscopeverbose " suppress 'duplicate connection' error
    exe "cs add " . db . " " . path
    set cscopeverbose
  " else add the database pointed to by environment variable 
  elseif $CSCOPE_DB != "" 
    cs add $CSCOPE_DB
  endif
endfunction
au BufEnter /* call LoadCscope()

" Set color scheme to desert
:colorscheme spacecamp

