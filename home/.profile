# Enable error handling and verbose output for dotfiles
set -euo pipefail
export DOTFILES_DEBUG=1

# Function to log dotfiles operations
dotfiles_log() {
  if [ "${DOTFILES_DEBUG:-0}" = "1" ]; then
    echo "[DOTFILES] $*" >&2
  fi
}

# Set Oh My Zsh environment variables early
DISABLE_AUTO_TITLE=true
DISABLE_UNTRACKED_FILES_DIRTY=true
ZSH_THEME_GIT_PROMPT_BEHIND=""
DISABLE_AUTO_UPDATE=true
DISABLE_UPDATE_PROMPT=true
DISABLE_GIT_PROMPT_ASYNC=true
ZSH_DISABLE_COMPFIX=true

dotfiles_log "Loading .profile..."

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

# Load everything from profile.d folder (if it exists)
if [ -d "${HOME}/.profile.d" ]; then
  dotfiles_log "Loading .profile.d scripts..."
  # Use nullglob to handle case when no .sh files exist
  shopt -s nullglob 2>/dev/null || true
  for file in ${HOME}/.profile.d/*.sh; do
    if [ -f "$file" ]; then
      dotfiles_log "Sourcing $file"
      source "$file" || {
        echo "[DOTFILES ERROR] Failed to source $file" >&2
        return 1
      }
    fi
  done
fi

export PATH="/usr/local/opt/findutils/libexec/gnubin:$PATH"
export PATH="$PATH:$HOME/.rd/bin"

# Work-specific settings (only load if GR_HOME is set)
if [ -n "$GR_HOME" ]; then
  dotfiles_log "Loading work-specific settings (GR_HOME: $GR_HOME)"
  export PATH=$PATH:$GR_HOME/engineering/bin
  jira-environment || {
    echo "[DOTFILES ERROR] Failed to load jira-environment" >&2
    return 1
  }
  tracker-environment || {
    echo "[DOTFILES ERROR] Failed to load tracker-environment" >&2
    return 1
  }
fi

export OPSLEVEL_API_TOKEN="X8k0EggqDNwKueSgKjNo0sgx3DNPiQNtSJw6"
export DOCKER_BUILDKIT=1

dotfiles_log "Loading .aliases..."
source ~/.aliases || {
  echo "[DOTFILES ERROR] Failed to source ~/.aliases" >&2
  return 1
}

export ASDF_GOLANG_MOD_VERSION_ENABLED=true
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
export IH_PRE_COMMIT_AUTO_STAGE=true

dotfiles_log "Loading asdf..."
. /usr/local/Cellar/asdf/0.16.7/libexec/asdf.sh || {
  echo "[DOTFILES ERROR] Failed to load asdf" >&2
  return 1
}

if [ -f /usr/local/opt/dvm/dvm.sh ]; then
  dotfiles_log "Loading dvm..."
  . /usr/local/opt/dvm/dvm.sh || {
    echo "[DOTFILES ERROR] Failed to load dvm" >&2
    return 1
  }
fi

export GITHUB_USER=tjsingleton

ulimit -n 1024

# Cursor-specific optimizations
if [ -n "$CURSOR_SESSION_ID" ]; then
  dotfiles_log "Cursor detected - applying optimizations"
  export GIT_PAGER=""
  export EDITOR="cursor"
  export GIT_EDITOR="cursor"
  export VISUAL="cursor"
fi

dotfiles_log ".profile loaded successfully"
