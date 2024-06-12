# if not running interactively (e.g. remote file transfer), don't do anything
[[ $- != *i* ]] && return

source ~/.aliases
source ~/.env_vars
source ~/.functions

# set default prompt colors, can override in .localrc
PROMPT_PRIMARY=blue
PROMPT_SECONDARY=gray
if [ -f ~/.localrc ]; then
	source ~/.localrc
fi

autoload -Uz compinit
compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors ''
# fix list-colors output
# change selected option foreground
# blinking cursor on tab?
setopt GLOB_DOTS
unsetopt LIST_TYPES

autoload -Uz vcs_info
precmd() {
	vcs_info
}
setopt PROMPT_SUBST
zstyle ':vcs_info:git:*' formats '[%40>..>%b%>>] '

PROMPT='%B%(?..[%?] )%F{$PROMPT_PRIMARY}%n@%m%F{$PROMPT_SECONDARY} %~ %#%f%b '
RPROMPT='%B%F{$PROMPT_SECONDARY}${vcs_info_msg_0_}%F{$PROMPT_PRIMARY}[%D{%I:%M:%S %P}]%f%b'
ZLE_RPROMPT_INDENT=0

unalias run-help 2>/dev/null
autoload -Uz run-help
HELPDIR="/usr/share/zsh/help"
alias help=run-help

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

DIRSTACKSIZE=20
setopt AUTO_PUSHD
setopt PUSHD_SILENT
setopt PUSHD_TO_HOME
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_MINUS
