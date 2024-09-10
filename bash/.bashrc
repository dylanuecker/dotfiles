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

if [ -f ~/.localrc ]; then
    source ~/.localrc
fi

set -o vi
bind '"jk":"\el"'
bind -m vi-command 'Control-l: clear-screen'
bind -m vi-insert 'Control-l: clear-screen'
