#!/bin/bash
# append minimal setup to default bashrc, useful for vms

tee --append ~/.bashrc <<EOF
set -o vi
bind '"jk":"\el"'

source ~/.aliases
source ~/.env_vars

# shell configuration local to this machine
# e.g. export NOVIMSTATUSLINE=-
if [ -f ~/.lmshrc ]; then
	source ~/.lmshrc
fi
EOF
