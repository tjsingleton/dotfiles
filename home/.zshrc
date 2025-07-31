export ZSH=$HOME/.oh-my-zsh
export ZSH_THEME="sunaku"

plugins=(brew gem osx)

source $ZSH/oh-my-zsh.sh
source $HOME/.profile

source $HOME/.aliases

# Me
unsetopt correct
unsetopt correctall
setopt histnostore
setopt histignoredups

# This loads the Included Health shell augmentations into your interactive shell
[ -f "$HOME/.ih/augment.sh" ] && . "$HOME/.ih/augment.sh"
