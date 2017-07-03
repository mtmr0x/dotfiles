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

# GIT Configs and helpers
if [ -f ~/.git-completion.bash ]; then
  source ~/.git-completion.bash
fi

if [ -f ~/.git-prompt.sh ]; then
  source ~/.git-prompt.sh
fi

# git lg alias
git config --global alias.lg "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"

# Reset
Color_Off="\[\033[0m\]"       # Text Reset
# Regular Green
Green="\[\033[0;32m\]"        # Green

# Bold
BBlack="\[\033[1;30m\]"       # Black

BRed="\[\033[1;31m\]"         # Red

# High Intensty
IRed="\[\033[0;91m\]"         # Red

export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true

export PS1=$BRed'→ '$Color_Off$BBlack'\W'$Color_Off'\
$(git branch &>/dev/null;\
if [ $? -eq 0 ]; then \
    echo "$(echo `git status` | grep "nothing to commit" > /dev/null 2>&1; \
    if [ "$?" -eq "0" ]; then \
        # @4 - Clean repository - nothing to commit
        echo "'$BBlack'"$(__git_ps1 " (%s)"); \
    else \
        # @5 - Changes to working tree
        echo "'$BRed'"$(__git_ps1 " {%s}"); \
    fi)'$Color_Off' "; \
else \
    # @2 - Prompt when not in GIT repo
    echo " '$Color_Off'";\
fi)'$BBlack'$'$Color_Off' '


export PATH="$HOME/.cargo/bin:$PATH"

