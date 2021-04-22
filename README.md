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

## Installation

**Restart your terminal session**

> **IMPORTANT**: It might show you a broken interface at the new window. Do not worry, it's just missing some tools we are going to install in the next step.

**Run the installation script**

```
$ ./installation/install.sh
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

