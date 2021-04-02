""""""""""""
" TAGALONG "
""""""""""""

" auto complete html tags closing
let g:tagalong_filetypes = ['html', 'xml', 'tsx', 'jsx', 'eruby', 'ejs', 'eco', 'php', 'htmldjango', 'javascriptreact', 'typescriptreact', 'javascript']
let g:tagalong_verbose = 1

" set filetypes as typescriptreact
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact

