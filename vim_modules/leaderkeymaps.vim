"""""""""""""
" MAPLEADER "
"""""""""""""
" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","
let g:ctrlp_by_filename = 1

map <leader>l :vsplit<cr>:Ggrep "<C-r><C-w>"<cr><Esc>:copen<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

" Ctrl+X, Ctrl+C and Ctrl+V
" Only works after installing vim-gnome package on Ubuntu 10.04
vnoremap <leader>x "+d
vnoremap <leader>c "+y
nnoremap <leader>v "+p
nnoremap <leader>V "+P
" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :1,$bd!<cr>

" Useful mappings for managing tabs
nmap <leader>T :tabnew<cr>

" Spell checking
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

