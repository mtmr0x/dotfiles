""""""""""
" GOCODE "
""""""""""

let g:deoplete#sources#go#builtin_objects=1
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
