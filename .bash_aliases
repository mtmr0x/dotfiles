alias be='bundle exec'
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls -la --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias vim='/usr/local/bin/vim -T xterm-256color'
    alias vi='/usr/local/bin/vim -T xterm-256color'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias vim='/usr/local/bin/vim'
alias vi='/usr/local/bin/vim'

