export CLICOLOR=1;
export PATH=./bin:$HOME/bin:/usr/local/sbin:/usr/local/bin:/usr/local/share/npm/bin:/usr/local/share/python:$PATH
export TZ="America/New_York"
export EDITOR='vim'
export LC_ALL='en_US.UTF-8'

export NODE_PATH=/usr/local/lib/node
export PGOPTIONS='-c client_min_messages=WARNING'
export JRUBY_OPTS="--1.9"
export ANT_OPTS="-Xmx512m -XX:MaxPermSize=512m"

if [[ -s $HOME/.profile_aws ]] ; then source $HOME/.profile_aws ; fi
