#!/bin/sh
vim_installation() {
  cp .vimrc ~/.vimrc
  cp -r ./vim_modules ~/
  echo "\nGetting latest python for supporting operations in Neovim"
  brew upgrade python
  brew install python3
  pip3 install neovim --user
  echo "\nInstalling Neovim"
  brew install neovim
  echo "\nInstalling The Silver Searcher\n"
  brew install the_silver_searcher
  echo "\nInstalling FZF"
  brew install fzf
  echo "\nInstalling Node"
  brew install node
  echo "\nInstalling Yarn"
  brew install yarn
  echo "\nCreating Neovim folder configs"
  mkdir ~/.config
  mkdir ~/.config/nvim
  cp ./neovim/init.vim ~/.config/nvim/init.vim
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

  echo "\nWe need to perform the VIM dependencies installation. The screen will open and some errors will show up. Just ignore it following the instructions and the installations will run properly."
  echo "\n\nPress ENTER to continue to the installation"
  read press_anything
  clear
  nvim -c "PlugInstall" -c "q" -c "q"
}

runScripts() {
  clear

  echo "\nInstalling zsh-autosuggestions\n"
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

  echo "\nInstlaling zsh-syntax-highlighting\n"
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

  echo "\nInstalling syntax highlight and autocompletion plugins for zsh"
  git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

  echo "\nWhat is your name to be displayed at your GIT user.name?\n\nFor Example, mine is \"Matheus Marsiglio\"\n"
  read git_config_user_name
  git config --global user.name "$git_config_user_name"
  clear
  echo "\nWhat is your common used GIT email?\n\n(Probably a personal one)\n"
  read git_config_user_email
  git config --global user.email $git_config_user_email
  clear
  echo "\nI'm about to set as your default GIT editor as VIM and I highly recommend it.\n\n"
  echo "Can I do that for you? (y/n)\n\n"
  read git_core_editor_to_vim
  if echo "$git_core_editor_to_vim" | grep -iq "^y" ;then
    git config --global core.editor nvim
  else
    echo "\nOk, it's on your hands. :) Let's move on"
  fi
  echo "Defining gitignore global in root folder"
  cp .gitignore_global ~/.gitignore_global
  git config --global core.excludesfile ~/.gitignore_global
  echo "\n\n\nDone of git globals, let's install some helpers"
  echo "\n\n\nInstalling wget\n\n"
  brew install wget
  clear
  echo "\nInstalling additional tools\n\n"
  echo  "\nInstalling tree\n\n"
  brew install tree
  echo "\nInstalling GTI\n\n"
  brew install gti
  clear
  echo "\n\n"
  echo "I have a nice VIM config to install here for you.\n\n"
  vim_installation
  echo "Everything's done! \n\n Make sure to mark \"Run command as a login shell\" option in your Terminal preferences to bash be interpreted."
echo "\n\nDon't forget to restart your terminal after the installations"
}

greetings() {
  clear
  echo "\nHi $USER.\nDo you wanna proceed with the installation? (y/n)"
  read answer
  if echo "$answer" | grep -iq "^y" ;then
    runScripts
  else
    echo "Ok, anything I'm here and you can also send me a message on Twitter: @matmarsiglio :) \nCheers, \n\nM.\n\n"
  fi
}

greetings

echo "Give me any feedback about these scripts at https://github.com/matmarsiglio/dotfiles :)"

