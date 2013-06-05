source $HOME/.aliases

if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

# TEXTMATE
export TM_SUPPORT_PATH=/Applications/TextMate.app/Contents/SharedSupport/Support
export EDITOR=vim

# GREP
export GREP_COLOR="1;37;41"
export GREP_OPTIONS="--color=auto"

# PROMPT COLORS
BLUE="\[\033[01;34m\]"
BRIGHT_WHITE="\[\033[1;37m\]"

export PS1="$BLUE\w $BRIGHT_WHITE\$ "
export PS2=": "

export rvm_cd_complete_flag=1

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
