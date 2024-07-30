"""""""""""""""
" COLORSCHEME "
"""""""""""""""

" Enable syntax highlighting
syntax on
filetype plugin indent on

let g:rehash256 = 1
set termguicolors     " enable true colors support
let ayucolor='mirage'
colorscheme catppuccin

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Filetypes support "
au BufNewFile, BufRead *.ejs set syntax=html

