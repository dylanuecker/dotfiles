# if not running interactively, don't do anything
[[ $- != *i* ]] && return

autoload -Uz compinit
compinit
zstyle ':completion:*' menu select

# vi mode
bindkey -v
bindkey -M viins 'jk' vi-cmd-mode 
KEYTIMEOUT=10 # 0.1 seconds

autoload -Uz vcs_info
precmd() {
	vcs_info
}
setopt PROMPT_SUBST
zstyle ':vcs_info:git:*' formats '[%b]'

PROMPT='%B%(?..[%?] )%F{blue}%n@%m%F{white} %~ %#%f%b '
RPROMPT='%B%F{blue}${vcs_info_msg_0_}%f%b'
ZLE_RPROMPT_INDENT=0

export VISUAL=vim
export EDITOR=$VISUAL
LESSHISTFILE=-
PATH="$HOME/.local/bin:$PATH"

HISTFILE="$HOME/.zhistory"
HISTSIZE=10000
SAVEHIST=$HISTSIZE
setopt EXTENDED_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS
setopt SHARE_HISTORY
HISTORY_IGNORE="(cd(| *)|ls(| *))"

alias ls='ls --color=auto'
alias la='ls -A'

alias diff='diff --color=auto'

alias ga='git add'
alias gb='git branch'
alias gc='git commit'
alias gca='git commit -a'
alias gcam='git commit -a -m'
alias gcm='git commit -m'
alias gd='git diff'
alias gl='git log'
alias gmv='git mv'
alias gp='git push'
alias gpl='git pull'
alias grm='git rm'
alias gs='git status'

alias lf='lf -last-dir-path ~/.config/lf/lastdirpath; cd $(head -1 ~/.config/lf/lastdirpath)'
