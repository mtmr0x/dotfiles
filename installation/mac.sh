#!/bin/sh
vim_installation() {
  cp .vimrc ~/.vimrc
  brew install vim
  echo "\nGetting latest python for supporting operations in Neovim"
  brew upgrade python
  brew install python3
  pip3 install neovim --user
  echo "\nInstalling Neovim"
  brew install neovim
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

side_tools() {
  echo "\nInstalling GUI tools from brew cask"
  echo "\n\n\n"
  echo "\nInstalling Fantastical Calendar"
  brew cask install fantastical
  echo "\n\n\n"
  echo "\nInstalling Brave Browser"
  brew cask install brave-browser
  echo "\n\n\n"
  echo "\nInstalling XMind-ZEN"
  brew cask install xmind-zen
  echo "\n\n\n"
  echo "\nInstalling 1Password"
  brew cask install 1password
  echo "\n\n\n"
  echo "\nInstalling 1Password CLI"
  brew cask install 1password-cli
  echo "\n\n\n"
  echo "\nInstalling GPG Tools"
  brew cask install gpg-suite
  echo "\n\n\n"
  echo "\nInstalling Sketch App"
  brew cask install sketch
  echo "\n\n\n"
  echo "Side tools installed! 🎉"
  echo "\n\n\n"
}

mac_defaults() {
  clear
  echo "Configuring Dock\n"
  defaults write com.apple.dock static-only -bool true; killall Dock
  defaults write com.apple.Dock autohide -bool true; killall Dock
  echo "\n\n"
  echo "Configuring keyboard\n"
  defaults write -g InitialKeyRepeat -int 15
  defaults write -g KeyRepeat -int 2
}

runBashScripts() {
  clear
  echo "\nMoving scripts to your user directory..."
  cp .bashrc ~/.bashrc
  cp .bash_profile ~/.bash_profile
  cp .bash_aliases ~/.bash_aliases
  clear
  echo "Installing Homebrew"
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  clear
  echo "Installing or updating GIT"
  brew install git
  clear
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
  echo "\n\n\nStarting checking if you have wget"
  brew install wget
  wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
  wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
  mv git-completion.bash ~/.git-completion.bash
  mv git-prompt.sh ~/.git-prompt.sh
  clear
  echo "\nDone with bash and GIT installations.\n\n"
  echo "I have a nice VIM config to install here for you.\n\n"
  echo "Wanna install it? (y/n)"
  read wanna_install_vim
  if echo "$wanna_install_vim" | grep -iq "^y" ;then
    vim_installation
  else
    clear
    echo "Ok then ¯\_(ツ)_/¯"
  fi
  clear
  echo "\nInstalling NodeJS from NVM\n\n"
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
  export NVM_DIR="${XDG_CONFIG_HOME/:-$HOME/.}nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
  command -v nvm
  nvm install 10.16
  clear
  echo "\nInstalling Rust\n\n"
  curl https://sh.rustup.rs -sSf | sh
  clear
  echo "\nInstalling additional tools\n\n"
  echo  "\nInstalling tree\n\n"
  brew install tree
  echo "\nInstalling GTI\n\n"
  brew install gti
  echo "\nInstalling Fuck\n\n"
  brew install thefuck
  clear
  echo "\n\n"
  echo "Do you want to install the default GUI tools like XMind, Brave Browser, Fantastical, etc? (y/n)\n"
  read wanna_install_side_tools
  if echo "$wanna_install_side_tools" | grep -iq "^y" ;then
    side_tools
  else
    clear
    echo "Ok then ¯\_(ツ)_/¯"
  fi
  clear
  echo "\n\n"
  echo "Do you want to run MacOS configurations scripts for customizations? (y/n)\n"
  echo "\n\n\n\n\n"
  read mac_defaults
  if echo "$mac_defaults" | grep -iq "^y" ;then
    mac_defaults
  else
    clear
    echo "Ok then ¯\_(ツ)_/¯"
  fi
  echo "\n\n\n\n\n"
  echo "Everything's done! \n\n Make sure to mark \"Run command as a login shell\" option in your Terminal preferences to bash be interpreted."
echo "\n\nDon't forget to restart your terminal after the installations"
}

greetings() {
  clear
  echo "\nHi $USER.\nDo you wanna proceed with the installation? (y/n)"
  read answer
  if echo "$answer" | grep -iq "^y" ;then
    runBashScripts
  else
    echo "Ok, anything I'm here and you can also send me a message on Twitter: @matmarsiglio :) \nCheers, \n\nM.\n\n"
  fi
}

greetings

echo "Give me any feedback about these scripts at https://github.com/matmarsiglio/dotfiles :)"

