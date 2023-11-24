source ~/.aliases
source ~/.env_vars

if [ -f ~/.lmshrc ]; then
    source ~/.lmshrc
fi

set -o vi
bind '"jk":"\el"'
bind -m vi-command 'Control-l: clear-screen'
bind -m vi-insert 'Control-l: clear-screen'
