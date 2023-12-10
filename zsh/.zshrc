# if not running interactively (e.g. remote file transfer), don't do anything
[[ $- != *i* ]] && return

source ~/.aliases
source ~/.env_vars

# set default prompt colors, can override in .localrc
PROMPT_PRIMARY=blue
PROMPT_SECONDARY=white
if [ -f ~/.localrc ]; then
	source ~/.localrc
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

PROMPT='%B%(?..[%?] )%F{$PROMPT_PRIMARY}%n@%m%F{$PROMPT_SECONDARY} %~ %#%f%b '
RPROMPT='%B%F{$PROMPT_SECONDARY}${vcs_info_msg_0_}%F{$PROMPT_PRIMARY}[%D{%I:%M:%S %P}]%f%b'
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
