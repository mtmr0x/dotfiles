# My simple dotfiles

## Bash

I use a simple Bash configuration, if you like a pure but pretty Terminal, here you go!

## VIM

In a nutshell, I use VIM 8, with vim-plug for managing plugins and with some custom configs for myself.

For Linux I did an optional automatic installation inside `./installation/linux.sh` script. I hope you enjoy it. :)

All VIM plugins are supported by most Linux Operational Systems and MacOS.

## Installation

### linux-gnu installation

Enter in the dotfiles folder and type:

```
$ sh installation/linux.sh
```

### Mac installation

I didn't write a Mac installation script, but you can get everything you need here :)

```
# Get Homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install git
brew install wget

# git configurations
git config --global user.name "Seu Nome"
git config --global user.email seu_usuario@seuemail.com
git config --global core.editor vim
wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
# hiding config git files
mv ~/git-completion.bash ~/.git-completion.bash
mv ~/git-prompt.sh ~/.git-prompt.sh

# Get updated VIM
brew install vim
### reload bash after this :)

# Install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

```
