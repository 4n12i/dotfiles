#!/bin/zsh

# prompt
autoload -Uz colors
colors

autoload -Uz compinit
compinit

source $HOME/git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWUPSTREAM=auto
setopt PROMPT_SUBST

git_color() {
	local color git_info reset
	git_info="$(__git_ps1 "%s")"
	reset="%{$reset_color%}"
	if [[ $git_info == *"%"* ]] || [[ $git_info == *"*"* ]]; then
		color="%{${fg[red]}%}"
  	elif [[ $git_info == *"+"* ]]; then
		color="%{${fg[green]}%}"
  	else
		color="%{${fg[cyan]}%}"
  	fi

	echo "$color$git_info$reset"
}

status_code () {
    local ok="(*'-'%)<"
    local ng="(*;-;%)<"
    local color face reset
    color="%{%(?.${fg[magenta]}.${fg[cyan]})%}"
    face="%(?.$ok.$ng)"
    reset="%{$reset_color%}"

    echo "$color$face$reset"
}

PROMPT='%F{blue}%~%f %F{yellow}$(__git_ps1 "[")%f`git_color`%F{yellow}$(__git_ps1 "]")%f
`status_code` %# '
# RPROMPT='%D{%H:%M:%S}'

# insert new line
function precmd() {
    # print a newline before the prompt, unless it's the first prompt in the process.
    if [ -z "$NEW_LINE_BEFORE_PROMPT" ]; then
        NEW_LINE_BEFORE_PROMPT=1
    elif [ "$NEW_LINE_BEFORE_PROMPT" -eq 1 ]; then
        echo ""
    fi
}

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# enable color support
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

# ls
alias ll='ls -l'
alias la='ls -a'

# history
setopt share_history
setopt hist_reduce_blanks
setopt hist_ignore_all_dups
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt autocd
unsetopt extendedglob
bindkey -v

export BAT_THEME="Solarized (dark)"
export PATH=$PATH:/usr/bin/zig

# eval "$(starship init zsh)"
