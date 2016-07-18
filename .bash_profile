# Functions and helpers concentrated on .bashrc
if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

# All alias are concentrated on .bash_aliases
if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

HISTCONTROL=ignoredups:ignorespace
# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000000
HISTFILESIZE=20000000

# For Ruby use
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
PATH=$PATH:/opt/vagrant/bin # Add Vagrant to PATH
PATH=$PATH:$HOME/bin # Add bin to PATH
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.

# Colors
export TERM=xterm-256color
export CLICOLOR=xterm-color

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# GIT Configs and helpers

if [ -f ~/.git-completion.bash ]; then
  source ~/.git-completion.bash
fi

if [ -f ~/.git-prompt.sh ]; then
  source ~/.git-prompt.sh
fi

# git lg alias
git config --global alias.lg "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"


#  Customize BASH PS1 prompt to show current GIT repository and branch.
#  by Mike Stewart - http://MediaDoneRight.com

#  SETUP CONSTANTS
#  Bunch-o-predefined colors.  Makes reading code easier than escape sequences.
#  I don't remember where I found this.  o_O

# Reset
Color_Off="\[\033[0m\]"       # Text Reset
# Regular Green
Green="\[\033[0;32m\]"        # Green

# Bold
BBlack="\[\033[1;30m\]"       # Black

BRed="\[\033[1;31m\]"         # Red

# High Intensty
IRed="\[\033[0;91m\]"         # Red

PathFull="\w"

# This PS1 snippet was adopted from code for MAC/BSD I saw from: http://allancraig.net/index.php?option=com_content&view=article&id=108:ps1-export-command-for-git&catid=45:general&Itemid=96
# I tweaked it to work on UBUNTU 11.04 & 11.10 plus made it mo' better

export PS1=$BRed'» '$BBlack$PathFull$Color_Off'$(git branch &>/dev/null;\
if [ $? -eq 0 ]; then \
    echo "$(echo `git status` | grep "nothing to commit" > /dev/null 2>&1; \
    if [ "$?" -eq "0" ]; then \
        # @4 - Clean repository - nothing to commit
        echo "'$Green'"$(__git_ps1 " (%s)"); \
    else \
        # @5 - Changes to working tree
        echo "'$IRed'"$(__git_ps1 " {%s}"); \
    fi)'$Color_Off' \$ "; \
else \
    # @2 - Prompt when not in GIT repo
    echo " '$Color_Off'\$ "; \
fi)'

