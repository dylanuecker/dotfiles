# if not running interactively (e.g. remote file transfer), don't do anything
[[ $- != *i* ]] && return

test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"

source ~/.alias
source ~/.env

export LESS_TERMCAP_mb=$(tput bold; tput setaf 1)                # blinking (red)
export LESS_TERMCAP_md=$(tput bold; tput setaf 2)                # bold (green)
export LESS_TERMCAP_me=$(tput sgr0)                              # end mode (reset all)
export LESS_TERMCAP_so=$(tput setaf 0; tput setab 255)           # standout-mode (black on white)
export LESS_TERMCAP_se=$(tput sgr0)                              # end standout-mode (reset all)
export LESS_TERMCAP_us=$(tput smul; tput bold; tput setaf 5)     # underline (purple)
export LESS_TERMCAP_ue=$(tput sgr0)                              # end underline (reset all)

# set default prompt colors, can override in .localrc
PROMPT_PRIMARY=blue
PROMPT_SECONDARY=gray
if [ -f ~/.localrc ]; then
	source ~/.localrc
fi

autoload -Uz compinit
compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'l' vi-forward-char
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

# exit shell on partial command line
exit_zsh() { exit }
zle -N exit_zsh
bindkey '^D' exit_zsh

# clear backbuffer using Ctrl+L
clear-screen-and-scrollback() {
    printf '\x1Bc'
    zle clear-screen
}
zle -N clear-screen-and-scrollback
bindkey '^L' clear-screen-and-scrollback

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^[[Z' autosuggest-accept # shift + tab
