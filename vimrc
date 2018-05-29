" Setup stuff
if !has ('g:syntax_on')
    syntax enable
endif
set viewoptions=cursor,folds,slash,unix     " saving cursor position, folds, slashes and unix EOL format
set viminfo+=n~/.vim/viminfo
set mouse=a

" Map Leader
let mapleader = ","     " , is the map leader key
let g:mapleader = ","   " , is the map leader key

so ~/.vim/plugins.vim

" Colors
colorscheme gruvbox
set background=dark
let &t_ut=''
set cursorline                              " highlight cursor line
highlight CursorLine term=bold cterm=bold ctermbg=237
set t_Co=256

" Formatting, syntax and displaying
set formatoptions=qrn1
set tabstop=4
set shiftwidth=4
set expandtab
set wrap
set textwidth=79
set history=50
set scrolloff=3
set laststatus=2
set hidden
set backspace=indent,eol,start
set number
set relativenumber
set showcmd
set wildmenu
set wildmode=full
set lazyredraw
set showmatch
set infercase
set smartcase
set gdefault
set synmaxcol=350

" statusline display 
"set statusline=
"set statusline+=%f                                   "tail of the filename
"set statusline+=[%{strlen(&fenc)?&fenc:'none'},     "file encoding
"set statusline+=%{&ff}]                             "file format
"set statusline+=%#warningmsg#                       "warning messages
"set statusline+=%{SyntasticStatuslineFlag()}        "Syntastic flag
"set statusline+=%*                                  "End of syntastic flag
"set statusline+=%h                                  "help file flag
"set statusline+=%m                                  "modified flag
"set statusline+=%r                                  "read only flag
"set statusline+=%y                                  "filetype
"set statusline+=%=                                  "left/right separator
"set statusline+=%c,                                 "cursor column
"set statusline+=%l/%L                               "cursor line/total lines
"set statusline+=\ %P                                "percent through file

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

" Search
set hlsearch
set incsearch

" Autocomplete
set complete=.,w,b,u,t,i

" Folding
set foldenable
set foldmethod=indent
set foldcolumn=2
set foldlevelstart=10
set foldnestmax=10
nnoremap <space> za

" Auto Commands
" Auto load vimrc on save
augroup autosourcing
    autocmd!
    autocmd BufWritePost vimrc source ~/.vimrc 
augroup END

" General remappings
nnoremap <leader><space> :nohl<CR>
noremap <leader>q :bp<CR>
noremap <leader>w :bn<CR>

nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'

set pastetoggle=<F10>

au BufRead,BufNewFile *.blade.php set filetype=html
au BufRead,BufNewFile filetype php set filetype=html

" Notes
" - zz to center screen
" - :! issue CLI commands
" - :!ctags -R to remake ctags
" - Ctrl + ] to go to method with ctags
" - Ctrl + 6 to go back to where the method was first seen
