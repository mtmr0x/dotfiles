# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
# Git alias
git config --global alias.lg "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"

eval "$(thefuck --alias)"
source <(fzf --zsh)
source /opt/homebrew/opt/spaceship/spaceship.zsh
alias vim=nvim

fpath=(~/.zsh $fpath)
. "/Users/mtmr0x/.deno/env"

# Create function for git sync
#
# git sync                     # Basic rebase (current branch)
# git sync feature-branch      # Basic rebase (specific branch)
# git sync -f                  # Force reset
# git sync -f feature-branch   # Force reset (specific branch)
# git sync -r upstream         # Different remote
#
# git sync -t                  # Auto-resolve conflicts favoring their changes
# git sync -o                  # Auto-resolve conflicts favoring our changes
#
# In case of a conflict, you can use run `git sync -t` or `git sync -o` to auto-resolve the conflict
#
# git sync -t feature-branch              # Rebase specific branch, using their changes
# git sync -o -r upstream                 # Rebase from upstream, using our changes
# git sync -f -r upstream feature-branch  # Combine options
#
#
# Optional branch name
# -f flag for force reset
# -r flag for specifying remote
# Default remote is "origin"
# Uses current branch if none specified
git config --global alias.sync '!f() {
    # Check for continue flag first
    if [ "$1" = "-continue" ]; then
        git rebase --continue
        return
    fi

    # Check if we are in the middle of a rebase
    if [ -d "$(git rev-parse --git-dir)/rebase-merge" ] || [ -d "$(git rev-parse --git-dir)/rebase-apply" ]; then
        # If we get -t or -o during a rebase conflict, abort and restart with that strategy
        if [ "$1" = "-t" ] || [ "$1" = "-o" ]; then
            echo "Conflict detected. Aborting current rebase and restarting with $1 strategy..."
            git rebase --abort

            # Store current branch for reuse
            current_branch=$(git rev-parse --abbrev-ref HEAD)

            # Convert -t/-o to full strategy option
            if [ "$1" = "-t" ]; then
                git rebase --strategy-option=theirs origin/$current_branch
            else
                git rebase --strategy-option=ours origin/$current_branch
            fi
            return
        fi
    fi

    remote="origin"
    force=false
    branch=""
    strategy=""

    # Parse options
    while getopts "fr:t:o" opt; do
        case $opt in
            f) force=true ;;
            r) remote=$OPTARG ;;
            t) strategy="--strategy-option=theirs" ;;
            o) strategy="--strategy-option=ours" ;;
            \?) echo "Invalid option: -$OPTARG" >&2; return 1 ;;
        esac
    done

    # Shift past the options
    shift $((OPTIND-1))

    # Get branch name from argument or current branch
    if [ -n "$1" ]; then
        branch=$1
    else
        branch=$(git rev-parse --abbrev-ref HEAD)
    fi

    # Fetch from specified remote
    git fetch $remote

    # Perform sync based on force flag
    if [ "$force" = true ]; then
        git reset --hard $remote/$branch
    else
        if [ -n "$strategy" ]; then
            git rebase $strategy $remote/$branch
        else
            git rebase $remote/$branch
        fi
    fi
}; f'

 # # FIX for homebrew always update/upgrade if installing a package
 export HOMEBREW_NO_AUTO_UPDATE=1
 # # Disable analytics
 export HOMEBREW_NO_ANALYTICS=1

 # #
 # # Homebrew ZSH completions
 # #
 # if type brew &>/dev/null; then
 #     FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

 #     autoload -Uz compinit
 #     compinit
 # fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
