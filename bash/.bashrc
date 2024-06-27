source ~/.alias
source ~/.env

if [ -f ~/.localrc ]; then
    source ~/.localrc
fi

set -o vi
bind '"jk":"\el"'
bind -m vi-command 'Control-l: clear-screen'
bind -m vi-insert 'Control-l: clear-screen'
