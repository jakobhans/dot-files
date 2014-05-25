set nocompatible
execute pathogen#infect()
autocmd VimEnter * NERDTree
syntax on
filetype plugin indent on

set history=700
set autoread
set number

let mapleader = ","
let g:mapleader = ","

set autoread

nmap <leader>w :w!<cr>

set so=7
set wildmenu
set ruler
set cmdheight=2
set hid
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set ignorecase
set smartcase
set hlsearch
set incsearch
set lazyredraw
set magic
set showmatch
set mat=2

colorscheme desert
set background=dark
set encoding=utf-8
set ffs=unix,dos,mac

set nobackup
set nowb
set noswapfile

set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set lbr
set tw=500
set ai
set si
set wrap
