# My not so simple dotfiles

## Prerequesites

 - [Homebrew](https://brew.sh)
 - [Oh my Zsh](https://ohmyz.sh/#install)
 - [A powerline font](https://github.com/powerline/fonts) - You may set one of them as your terminal font for symbols and characters compatibility

## Zsh

It's pretty much Oh My Zsh with Spaceship plus steroids. Easy to configure but powerfull tooling.

## Spaceship prompt

I personally like [Spaceship prompt](https://github.com/denysdovhan/spaceship-prompt). If you want a swag theme, go to their GitHub repository and follow instructions for installation.

> Do not forget to install sobe [Powerline fonts](https://github.com/powerline/fonts) for using Spaceship.

## VIM

I use Neovim with vim-plug for managing plugins and with some custom configs for myself.

All VIM plugins are supported by most Linux distributions and MacOS.

## Installation

**Access this dotfiles folder:**

```sh
cd path-to-here/dotfiles
```

**Move the `.zshrc` file to your user folder:**

```sh
cp .zshrc ~/.zshrc
```

**Restart your terminal session**

It will break and show you a poor interface on the new window. Do not worry, it's just missing some tools we are going to install in the next step.

**Run the installation script**

```
$ sh installation/install.sh
```

**Restart your terminal session and you're done 🎉**
