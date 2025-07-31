export CLICOLOR=1;
export PATH=./bin:$HOME/bin:/usr/local/sbin:/usr/local/bin:$PATH
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

export PATH="/usr/local/opt/findutils/libexec/gnubin:$PATH"
export PATH="$PATH:$HOME/.rd/bin"

# Work-specific settings (only load if GR_HOME is set)
if [ -n "$GR_HOME" ]; then
  export PATH=$PATH:$GR_HOME/engineering/bin
  jira-environment; tracker-environment
fi

export OPSLEVEL_API_TOKEN="X8k0EggqDNwKueSgKjNo0sgx3DNPiQNtSJw6"
export DOCKER_BUILDKIT=1

source ~/.aliases

export ASDF_GOLANG_MOD_VERSION_ENABLED=true
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
export IH_PRE_COMMIT_AUTO_STAGE=true

. /usr/local/Cellar/asdf/0.16.7/libexec/asdf.sh
[ -f /usr/local/opt/dvm/dvm.sh ] && . /usr/local/opt/dvm/dvm.sh

export GITHUB_USER=tjsingleton

ulimit -n 1024

# Disable git pager when Cursor is detected
if [ -n "$CURSOR_SESSION_ID" ]; then
  export GIT_PAGER=""
fi
