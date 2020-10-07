export CLICOLOR=1;
export PATH=./bin:$HOME/bin:/usr/local/sbin:/usr/local/bin:$HOME/go/bin:$PATH
export TZ="America/New_York"
export EDITOR='vim'
export LC_ALL='en_US.UTF-8'

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

export AWS_DEFAULT_REGION=us-east-1

#Determine where a shell function is defined / declared
function find_function {
  shopt -s extdebug
  declare -F "$1"
  shopt -u extdebug
}

# Load everything from profile.d folder
for file in ${HOME}/.profile.d/*.sh; do
  source ${file};
done

export PATH=$PATH:$GR_HOME/engineering/bin
export PATH="/usr/local/opt/findutils/libexec/gnubin:$PATH"


jira-environment; tracker-environment

. /usr/local/opt/asdf/asdf.sh
[ -f /usr/local/opt/dvm/dvm.sh ] && . /usr/local/opt/dvm/dvm.sh

export GITHUB_USER=tjsingleton


ulimit -n 1024