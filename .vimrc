""""""""""""""""
" DEPENDENCIES "
""""""""""""""""

call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" General stuff
Plug 'echasnovski/mini.nvim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'brooth/far.vim' " find and replace tool
Plug 'liuchengxu/vista.vim' " show under the cursor item definition
Plug 'voldikss/vim-floaterm'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify' " show vcs diffs at line
Plug 'editorconfig/editorconfig-vim'
Plug 'nvim-neo-tree/neo-tree.nvim'
"" dependencies for neo-tree
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'MunifTanjim/nui.nvim'
Plug '3rd/image.nvim'
"" end dependencies for neo-tree
Plug 'romgrk/barbar.nvim'
"" dependency for barbar
" Plug 'nvim-tree/nvim-web-devicons' commented because it's available in dependencies for neo-tree
Plug 'lewis6991/gitsigns.nvim' " OPTIONAL: for git status

" end General stuff

" Colourschemes
Plug 'ayu-theme/ayu-vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
" End Colourschemes

" Clojure
Plug 'clojure-vim/vim-jack-in'
Plug 'radenling/vim-dispatch-neovim'
Plug 'SevereOverfl0w/vim-replant', { 'do': ':UpdateRemotePlugins' }
Plug 'tpope/vim-fireplace'
Plug 'tpope/vim-dispatch'
Plug 'guns/vim-sexp'
Plug 'luochen1990/rainbow'

" html
Plug 'AndrewRadev/tagalong.vim' " helper for html tags

" js, ts, etc
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

" Rust
Plug 'rust-lang/rust.vim'

" Golang
Plug 'stamblerre/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }
Plug 'fatih/vim-go'
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
source ~/vim_modules/dependencies/neotree.vim

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

