export ZSH=$HOME/.oh-my-zsh
export ZSH_THEME="sunaku"

plugins=(brew gem rails3 redis-cli rvm vagrant npm knife osx)

source $ZSH/oh-my-zsh.sh
source $HOME/.profile

unsetopt auto_name_dirs # FIX RVM

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
source $HOME/.aliases

# Me
unsetopt correct
unsetopt correctall
setopt histnostore
setopt histignoredups
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
