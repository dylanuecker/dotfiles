# if not running interactively (e.g. remote file transfer), don't do anything
[[ $- != *i* ]] && return

source ~/.aliases
source ~/.env_vars

autoload -Uz compinit
compinit
zstyle ':completion:*' menu select

autoload -Uz vcs_info
precmd() {
	vcs_info
}
setopt PROMPT_SUBST
zstyle ':vcs_info:git:*' formats '[%b]'

PROMPT='%B%(?..[%?] )%F{blue}%n@%m%F{white} %~ %#%f%b '
RPROMPT='%B%F{blue}${vcs_info_msg_0_}%f%b'
ZLE_RPROMPT_INDENT=0

# bash:
# 	set -o vi
# 	bind '"jk":"\el"'
bindkey -v
bindkey -M viins 'jk' vi-cmd-mode
KEYTIMEOUT=10 # 0.1 seconds

HISTFILE="$HOME/.zhistory"
HISTSIZE=10000
SAVEHIST=$HISTSIZE
setopt EXTENDED_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS
setopt SHARE_HISTORY
HISTORY_IGNORE="(cd(| *)|ls(| *))"
