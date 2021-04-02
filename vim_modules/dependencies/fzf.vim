"""""""
" FZF "
"""""""
map <C-p> :GFiles<CR>
let g:fzf_preview_window = 'right:60%'

map <leader>g :Ag <cr>
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, fzf#vim#with_preview('right'), <bang>0)
