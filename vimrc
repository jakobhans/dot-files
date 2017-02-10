syntax on                                   " enable syntax processing
filetype plugin indent on                   " load plugin and indent file for filetype                       
set cursorline                              " highlight cursor line
set viewoptions=cursor,folds,slash,unix     " saving cursor position, folds, slashes and unix EOL format

" Map Leader
let mapleader = ","     " , is the map leader key
let g:mapleader = ","   " , is the map leader key

" vim-plug section
call plug#begin('~/.vim/autoload/')

Plug 'ctrlpvim/ctrlp.vim'
Plug 'morhetz/gruvbox'
Plug 'noahfrederick/vim-composer'
Plug 'vim-utils/vim-man'
Plug 'StanAngeloff/php.vim'
Plug 'stephpy/vim-php-cs-fixer'
Plug 'vim-scripts/L9'
Plug 'vim-scripts/FuzzyFinder'
Plug 'PotatoesMaster/i3-vim-syntax'

call plug#end()

" color theme
set background=dark
hi CursorLine cterm=bold ctermbg=234
colorscheme gruvbox
let g:gruvbox_italic = 1
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_improved_strings = 1
let g:gruvbox_number_columnt = 'bg4'
let g:gruvbox_improved_warnings = 1

" Omnicomplete
set omnifunc=syntaxcomplete#Complete

" FuzzyFinder
nnoremap <C-b> :FufBuffer<CR>
nnoremap <C-f> :FufFile<CR>

" CtrlP
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_show_hidden = 1
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" statusline display 
set statusline=%f                                   "tail of the filename
set statusline+=[%{strlen(&fenc)?&fenc:'none'},     "file encoding
set statusline+=%{&ff}]                             "file format
set statusline+=%h                                  "help file flag
set statusline+=%m                                  "modified flag
set statusline+=%r                                  "read only flag
set statusline+=%y                                  "filetype
set statusline+=%=                                  "left/right separator
set statusline+=%c,                                 "cursor column
set statusline+=%l/%L                               "cursor line/total lines
set statusline+=\ %P                                "percent through file

" Backup 
if isdirectory($HOME . '/.vim/backup') == 0
    :silent !mkdir -p ~/.vim/backup >/dev/null 2>&1
endif
set backupdir-=.
set backupdir+=.
set backupdir-=~/
set backupdir^=~/.vim/backup/
set backupdir^=./.vim-backup/
set backup

" Swap Files
if isdirectory($HOME . '/.vim/swap') == 0
    :silent !mkdir -p ~/.vim/swap >/dev/null 2>&1
endif
set directory=./.vim-swap//
set directory+=~/.vim/swap//
set directory+=~/tmp//
set directory+=.

" Undo Files
if exists("+undofile")
    if isdirectory($HOME . '/.vim/undo') == 0
        :silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
    endif
    set undodir=./.vim-undo//
    set undodir+=~/.vim/undo//
    set undofile
endif

" Misc
set viminfo+=n~/.vim/viminfo
set mouse-=a

" Colors
set t_Co=256
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE

" Formatting, syntax and displaying
set formatoptions=qrn1
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smartindent
set autoindent
set wrap
set textwidth=79
set history=50
set scrolloff=3
set laststatus=2
set hidden
set ruler
set backspace=indent,eol,start
set number
set relativenumber
set showcmd
set wildmenu
set lazyredraw
set showmatch
set ignorecase
set smartcase
set gdefault
set incsearch

" Folding
set foldenable
set foldlevelstart=10
set foldnestmax=10
nnoremap <space> za
set foldmethod=indent

" General remappings
inoremap <C-U> <C-G>u<C-U>
vnoremap / /\v
nnoremap / /\v
nnoremap <leader><space> :nohl<CR>
nnoremap j gj
nnoremap k gk
nnoremap ; :
noremap <leader>q :bp<CR>
noremap <leader>w :bn<CR>
noremap Q gq

set pastetoggle=<F10>

au FocusLost * :wa

au BufRead,BufNewFile *.blade.php set filetype=html
au BufRead,BufNewFile filetype php set filetype=php.html

" Remapping to remove arrows
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
