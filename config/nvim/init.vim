noremap Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" Switch syntax highlighting on

" Enable file type detection.
" Use the default filetype settings, so that mail gets 'textwidth' set to 72,
" 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent indenting.
filetype plugin indent on

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  autocmd!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  autocmd BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$") |
    \   execute "normal! g`\"" |
    \ endif

augroup END

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set buftype=nofile | read ++edit # | 0d_ | diffthis
                 \ | wincmd p | diffthis
endif

" vim-plug section
call plug#begin('~/.config/neovim/autload/plug.vim')

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'ctrlpvim/ctrlp.vim'
Plug 'morhetz/gruvbox'
Plug 'noahfrederick/vim-composer'
Plug 'vim-utils/vim-man'
Plug 'FelikZ/ctrlp-py-matcher'

call plug#end()

" color theme
syntax on       " enable syntax processing
set cursorline
set background=dark
hi CursorLine cterm=bold ctermbg=234
colorscheme gruvbox
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_number_columnt = 'bg4'
let g:gruvbox_improved_warnings = 1

" deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 1
" Use tab to complete
inoremap <expr><tab> pumvisible() ? "<c-n>" : "\<tab>"

" deoplete-padawan
let g:deoplete#sources#padawan#add_parentheses = 1

" CtrlP
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_show_hidden = 1
"let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }

" restore_view settings
set viewoptions=cursor,folds,slash,unix

" Misc
set backup
set backupdir=~/.vim/backup
set undofile
set mouse-=a

syntax on
set t_Co=256

set formatoptions=qrn1
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smartindent
set autoindent
set wrap
set history=50

set scrolloff=3
set hidden
set ruler
set backspace=indent,eol,start
set laststatus=2
set number
set relativenumber
set showcmd
set wildmenu
set lazyredraw
set showmatch

set foldenable
set foldlevelstart=10
set foldnestmax=10
nnoremap <space> za
set foldmethod=indent

" statusline stuff
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

let mapleader = ","
let g:mapleader = ","

nnoremap / /\v
vnoremap / /\v
set hlsearch
nnoremap <leader><space> :nohlsearch<CR>
set ignorecase
set smartcase
set gdefault
set incsearch
nnoremap <tab> %
nnoremap j gj
nnoremap k gk

" Remove arrows
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

au FocusLost * :wa

au BufRead,BufNewFile *.blade.php set filetype=html
