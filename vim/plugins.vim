" vim-plug section
call plug#begin('~/.vim/autoload/')

Plug 'ctrlpvim/ctrlp.vim'
Plug 'bsdelf/bufferhint'
Plug 'tpope/vim-commentary'
Plug 'scrooloose/nerdtree'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-surround'
Plug 'arnaud-lb/vim-php-namespace'
Plug 'ervandew/supertab'
Plug 'garbas/vim-snipmate'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'stephpy/vim-php-cs-fixer'
Plug 'sheerun/vim-polyglot'
Plug 'vim-syntastic/syntastic'

call plug#end()

" Plugins preferences

" BufferHint
nnoremap - :call bufferhint#Popup()<CR>
nnoremap \ :call bufferhint#LoadPrevious()

" Gruvbox color theme
let g:gruvbox_italic = 1
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_improved_strings = 0
let g:gruvbox_improved_warnings = 1

" CtrlP
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_show_hidden = 1
let g:ctrlp_custom_ignore = 'node_modules\|git'

" NERDTree
let NERDTreeHijackNetrw = 0
let NERDTreeShowHidden = 1

" vim-php-namespace
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>n <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>n :call PhpInsertUse()<CR>

function! IPhpExpandClass()
    call PhpExpandClass()
    call feedkeys('a', 'n')
endfunction
autocmd FileType php inoremap <Leader>nf <Esc>:call IPhpExpandClass()<CR>
autocmd FileType php noremap <Leader>nf :call PhpExpandClass()<CR>

" vim-php-cs-fixer
let g:php_cs_fixer_level = "psr2"
nnoremap <silent><Leader>pf :call PhpCsFixerFixFile()<CR>

" syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
