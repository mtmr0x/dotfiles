"""""""
" ALE "
"""""""

let g:ale_completion_enabled = 1
let g:ale_sign_column_always = 1
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '!!'
let g:ale_linters = {
\'javascript': ['flow', 'eslint'],
\}
let g:ale_fixers = {
\'javascript': ['eslint'],
\}

