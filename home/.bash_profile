export LC_ALL=en_US.UTF-8

source $HOME/.profile
source $HOME/.bashrc

if [[ -s $HOME/.rvm/scripts/rvm ]] ; then source $HOME/.rvm/scripts/rvm ; fi
[[ -r $rvm_path/scripts/completion ]] && . $rvm_path/scripts/completion

export HISTIGNORE="fg*"
bind '"\C-x": "fg %-\n"'
