"""""""""""
" GENERAL "
"""""""""""

set shell=/bin/zsh

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Sets how many lines of history VIM has to remember
set history=700

" Set to auto read when a file is changed from the outside
set autoread

" Update file when cursor stops moving and when you focus on Terminal
au CursorHold,CursorHoldI * checktime
au FocusGained,BufEnter * :checktime

" Display extra whitespace
set listchars=tab:»·,trail:·,nbsp:·
set list

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set ignorecase
set smartcase

" Set line numbers and relative number rule
set number
set relativenumber
map <leader>rn :set relativenumber!<cr>

" Don't redraw while executing macros (good performance config)
set lazyredraw

" set a default split to the right considering right to left reading
set splitright

" Height of the command bar
set cmdheight=2

