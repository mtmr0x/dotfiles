""""""""""""""""
" DEPENDENCIES "
""""""""""""""""

call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Clojure Setup
Plug 'clojure-vim/vim-jack-in'
Plug 'radenling/vim-dispatch-neovim'
Plug 'SevereOverfl0w/vim-replant', { 'do': ':UpdateRemotePlugins' }
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fireplace'
Plug 'guns/vim-sexp'

Plug 'luochen1990/rainbow'

" Only in Neovim:
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
" Colourschemes
Plug 'ayu-theme/ayu-vim'
Plug 'dracula/vim', { 'as': 'dracula' }
" End Colourschemes
Plug 'rust-lang/rust.vim'
Plug 'fatih/vim-go'
Plug 'editorconfig/editorconfig-vim'
" Things for golang
Plug 'stamblerre/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'neovim/nvim-lspconfig'
Plug 'ray-x/go.nvim'
Plug 'ray-x/guihua.lua'

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

