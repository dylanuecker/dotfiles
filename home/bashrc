# if not running interactively, don't do anything
[[ $- != *i* ]] && return

BOLD=$(tput bold)         # bold
RESET=$(tput sgr0)        # turn off all attributes
PRIMARY=$(tput setaf 4)   # light blue
SECONDARY=$(tput setaf 7) # white
PS1='\[$BOLD\]\[$PRIMARY\]\u@\h\[$SECONDARY\] \w \$\[$RESET\] '

set -o vi
# bind jk to escape and then move once to the left
bind '"jk":"\el"'
# v in "command mode" doesn't open vim for editing
#bind -m vi-command '"v": ""'

bind '"kk":clear-screen'
bind '"jj":"ls\n"'
bind '"kj":"dc\n"'

export VISUAL=vim
export EDITOR="$VISUAL"
export LESSHISTFILE=-
export PATH="$HOME/.local/bin:$PATH"
export HISTIGNORE="ls"

source /usr/share/bash-completion/bash_completion

alias ls='ls --color=auto'
alias la='ls -A'

alias gs='git status'
alias gd='git diff'
alias gl='git log'
alias gb='git branch'
alias gc='git checkout'

alias dc='. traverse'
