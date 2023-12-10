# if not running interactively (e.g. remote file transfer), don't do anything
[[ $- != *i* ]] && return

source ~/.aliases
source ~/.env_vars

if [ -f ~/.lmshrc ]; then
	source ~/.lmshrc
fi

autoload -Uz compinit
compinit
zstyle ':completion:*' menu select

autoload -Uz vcs_info
precmd() {
	vcs_info
}
setopt PROMPT_SUBST
zstyle ':vcs_info:git:*' formats '[%40>..>%b%>>] '

PROMPT='%B%(?..[%?] )%F{blue}%n@%m%F{white} %~ %#%f%b '
RPROMPT='%B%F{white}${vcs_info_msg_0_}%F{blue}[%D{%I:%M:%S %P}]%f%b'
ZLE_RPROMPT_INDENT=0

bindkey -v
bindkey -M viins 'jk' vi-cmd-mode
KEYTIMEOUT=20 # 0.2 seconds

HISTFILE="$HOME/.zhistory"
HISTSIZE=10000
SAVEHIST=$HISTSIZE
setopt EXTENDED_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS
setopt SHARE_HISTORY
HISTORY_IGNORE="(cd(| *)|ls(| *))"
