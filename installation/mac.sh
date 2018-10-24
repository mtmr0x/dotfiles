#!/bin/sh
vim_installation() {
  cp .vimrc ~/.vimrc
  brew install vim
  echo "\nGetting latest python for supporting operations in Neovim"
  brew upgrade python
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

  echo "\nInstalling Node environment through NVM"
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
  export NVM_DIR="${XDG_CONFIG_HOME/:-$HOME/.}nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
  command -v nvm
  echo "Installing Node"
  nvm install 9.5

  echo "\nInstalling zsh"
  brew install zsh
  echo "\nzsh installed!"
  echo "\nSetting zsh as default interface"
  grep -q -f $(which zsh) /etc/shells || echo $(which zsh) | sudo tee -a /etc/shells
  chsh -s $(which zsh)
  echo  "\nDone! zsh is the default terminal"
  clear

  echo "Installing powerline fonts"
  echo "\nCloning powerline fonts repository"
  cd ~/
  git clone https://github.com/powerline/fonts.git --depth=1
  cd ~/fonts
  echo "\nExecuting powerline fonts installation script"
  ./install.sh
  echo "\nDone! Now removing powerline fonts folder because we don't need it anymore"
  cd ../ && rm -rf fonts
  echo "Installing spaceship-prompt"
  npm install -g spaceship-prompt

  echo "\nFor NVM works properly at zsh, you need to put this into your $HOME/.zshrc to call nvm use automatically whenever you enter a directory that contains an .nvmrc file with a string telling nvm which node to use:"
  echo "
    # place this after nvm initialization!
    autoload -U add-zsh-hook
    load-nvmrc() {
      local node_version="$(nvm version)"
      local nvmrc_path="$(nvm_find_nvmrc)"

      if [ -n "$nvmrc_path" ]; then
        local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

        if [ "$nvmrc_node_version" = "N/A" ]; then
          nvm install
        elif [ "$nvmrc_node_version" != "$node_version" ]; then
          nvm use
        fi
      elif [ "$node_version" != "$(nvm version default)" ]; then
        echo "Reverting to nvm default version"
        nvm use default
      fi
    }
    add-zsh-hook chpwd load-nvmrc
    load-nvmrc
  "
  echo  "\n\n More information here: https://github.com/creationix/nvm#deeper-shell-integration"
  echo "\n\n\nHave you finished this step? (y/n)"
  read nvm_shell_integration_warn
  if echo "$nvm_shell_integration_warn" | grep -iq "^y" ;then
    echo "Shall we!"
  else
    clear
    echo "Ok then ¯\_(ツ)_/¯"
  fi

  echo "\nI have a nice VIM config to install here for you.\n\n"
  echo "\nWanna install it? (y/n)"
  read wanna_install_vim
  if echo "$wanna_install_vim" | grep -iq "^y" ;then
    vim_installation
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

