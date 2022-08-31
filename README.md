# My not so simple dotfiles

## Overview

These dotfiles are dependant of the following steps. After following the next steps, you will get a
terminal client with zsh on Oh-My-Zsh framework and Spaceship theme and a powerful NVIM configuration.

## Prerequisites

**Clone this repository**

```sh
git clone git@github.com:mtmr0x/dotfiles.git
```

**Access this dotfiles folder:**

```sh
cd dotfiles/
```

**Move .zshrc file to your root**

```sh
cp .zshrc ~/.zshrc
```

**Install these external dependencies**

 - [Homebrew](https://brew.sh)
 - [Oh my Zsh](https://ohmyz.sh/#install)
 - [A powerline font](https://github.com/powerline/fonts) - You must set one of them as your terminal font for symbols and characters compatibility
 - [The silver searcher](https://github.com/ggreer/the_silver_searcher) - In order to give super powers to the nvim

## VIM Set-up

```sh
# move files to your root
cp .vimrc ~/.vimrc
cp -r ./vim_modules ~/

# Getting latest python for supporting operations in Neovim
brew upgrade python
brew install python3
pip3 install neovim --user

# Install Neovim
brew install neovim

# Install The Silver Searcher
brew install the_silver_searcher

# Install FZF
brew install fzf

# install Node
brew install node

# Install Yarn
brew install yarn

# Create Neovim folder configs and paste the content inside
mkdir ~/.config
mkdir ~/.config/nvim
cp ./neovim/init.vim ~/.config/nvim/init.vim

# Install Plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install Plug dependencies
nvim -c "PlugInstall" -c "q" -c "q"
```

**Restart your terminal session and you're done 🎉**

## Post-install

Do not forget to get `coc` plugins to the ambient from inside NeoVim:

```
:CocInstall coc-tsserver
```

```
:CocInstall coc-prettier
```

```
:CocInstall coc-json
```

```
:CocInstall coc-rust-analyzer
```

...and anything else you want. Check them here: https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions

