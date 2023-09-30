#!/bin/zsh

### cute prompt ###
autoload -Uz colors
colors

# autoload -Uz vcs_info
# setopt prompt_subst
# zstyle ':vcs_info:git:*' check-for-changes true
# zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
# zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
# zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
# zstyle ':vcs_info:*' actionformats '[%b|%a]'
# precmd () { vcs_info }

status_code () {
    local ok="(*'-'%)<"
    local ng="(*;-;%)<"

    local color face reset
    color="%{%(?.${fg[magenta]}.${fg[cyan]})%}"
    face="%(?.$ok.$ng)"
    reset="%{$reset_color%}"

    echo "$color$face$reset"
}

PROMPT='%D{%H:%M:%S} %n@%m %F{blue}[%~]%f
`status_code` %# '

# Insert new line.
function precmd() {
    # Print a newline before the prompt, unless it's the first prompt in the process.
    if [ -z "$NEW_LINE_BEFORE_PROMPT" ]; then
        NEW_LINE_BEFORE_PROMPT=1
    elif [ "$NEW_LINE_BEFORE_PROMPT" -eq 1 ]; then
        echo ""
    fi
}

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
    alias diff='diff --color=auto'
fi

### history ###
setopt share_history
setopt hist_reduce_blanks
setopt hist_ignore_all_dups
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt autocd
unsetopt extendedglob
bindkey -v

### ls ###
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

### nvim ###
alias vim='nvim'

### bat ###
alias bat='batcat'
alias cat='batcat'
export BAT_THEME="Solarized (dark)"
