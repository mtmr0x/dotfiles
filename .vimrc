""""""""""""""""
" DEPENDENCIES "
""""""""""""""""

call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jlesquembre/coc-conjure' " extension for clojure
Plug 'Olical/conjure', {'tag': 'v4.18.0'}
Plug 'tpope/vim-dispatch'
Plug 'clojure-vim/vim-jack-in'
Plug 'tpope/vim-fireplace'
" Infer parentheses for Clojure, Lisp and Scheme.
Plug 'eraserhd/parinfer-rust', {'do':
        \  'cargo build --release'}
" Only in Neovim:
Plug 'radenling/vim-dispatch-neovim'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
" Plug 'w0rp/ale' " linter
Plug 'AndrewRadev/tagalong.vim' " helper for html tags
Plug 'brooth/far.vim' " find and replace tool
Plug 'liuchengxu/vista.vim' " show under the cursor item definition
Plug 'voldikss/vim-floaterm'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify' " show vcs diffs at line
Plug 'ayu-theme/ayu-vim'
Plug 'rust-lang/rust.vim'
Plug 'stamblerre/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }
Plug 'fatih/vim-go'
Plug 'editorconfig/editorconfig-vim'

call plug#end()

"""""""""""""""""""""""""""""""
" DEPENDENCIES CONFIGURATIONS "
"""""""""""""""""""""""""""""""
source ~/vim_modules/dependencies/fzf.vim
source ~/vim_modules/dependencies/coc.vim
source ~/vim_modules/dependencies/ale.vim
source ~/vim_modules/dependencies/tagalong.vim
source ~/vim_modules/dependencies/vista.vim
source ~/vim_modules/dependencies/floaterm.vim
source ~/vim_modules/dependencies/airline.vim
source ~/vim_modules/dependencies/signify.vim
source ~/vim_modules/dependencies/gocode.vim
source ~/vim_modules/dependencies/editorconfig.vim

""""""""""""""""""
" CONFIGURATIONS "
""""""""""""""""""
source ~/vim_modules/general.vim
source ~/vim_modules/colorscheme.vim
source ~/vim_modules/leaderkeymaps.vim
source ~/vim_modules/indentation.vim
source ~/vim_modules/buffers.vim
source ~/vim_modules/filetype.vim
source ~/vim_modules/cursor.vim
source ~/vim_modules/navigation.vim
source ~/vim_modules/search.vim

"""""""""""""
" MODIFIERS "
"""""""""""""
source ~/vim_modules/modifiers/visualselection.vim
source ~/vim_modules/modifiers/bclose.vim
source ~/vim_modules/modifiers/deletetrailingws.vim

