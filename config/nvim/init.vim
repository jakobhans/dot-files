" Don't use Ex mode, use Q for formatting
noremap Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" Switch syntax highlighting on
syntax on

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
Plug 'pbogut/deoplete-padawan'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'morhetz/gruvbox'
Plug 'noahfrederick/vim-composer'
Plug 'vim-utils/vim-man'
Plug 'FelikZ/ctrlp-py-matcher'

call plug#end()

" color theme
colorscheme gruvbox
set background=dark

" deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 1

" deoplete-padawan
let g:deoplete#sources#padawan#add_parentheses = 1

" CtrlP
let g:ctrlp_show_hidden = 1
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }

" restore_view settings
set viewoptions=cursor,folds,slash,unix

" Misc
set backup
set undofile
set mouse-=a

syntax on
set t_Co=256

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smartindent
set autoindent
set history=50

set scrolloff=3
set hidden
set ruler
set cursorline
hi CursorLine cterm=bold ctermbg=234
hi Normal ctermbg=none
set backspace=indent,eol,start
set laststatus=2
set number
set relativenumber
set showcmd

" statusline stuff
set statusline=%t                                   "tail of the filename
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
set nohlsearch
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
nnoremap <leader><space> :no<cr>
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


set wrap
set formatoptions=qrn1

au FocusLost * :wa

au BufRead,BufNewFile *.blade.php set filetype=html
