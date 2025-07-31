export LC_ALL=en_US.UTF-8

source $HOME/.profile
source $HOME/.bashrc

export HISTIGNORE="fg*"
bind '"\C-x": "fg %-\n"'

[[ -r ~/.bashrc ]] && source ~/.bashrc

. "$HOME/.local/bin/env"
