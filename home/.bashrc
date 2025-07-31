source $HOME/.aliases

brew_prefix=`brew --prefix`

if [ -f $brew_prefix/etc/bash_completion ]; then
  . $brew_prefix/etc/bash_completion
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

# GR
# don't put duplicate lines in the history
HISTCONTROL=ignoredups:ignorespace
# append to the history file, don't overwrite it
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# This loads the Included Health shell augmentations into your interactive shell
. "$HOME/.ih/augment.sh"

