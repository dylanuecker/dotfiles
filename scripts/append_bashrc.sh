#!/bin/bash
# append minimal setup to default bashrc, useful for vms

tee --append ~/.bashrc <<EOF
set -o vi
bind '"jk":"\el"'
bind -m vi-command 'Control-l: clear-screen'
bind -m vi-insert 'Control-l: clear-screen'

source ~/.aliases
source ~/.env_vars

# shell configuration local to this machine
# e.g. export NOVIMSTATUSLINE=-
if [ -f ~/.lmshrc ]; then
	source ~/.lmshrc
fi
EOF
