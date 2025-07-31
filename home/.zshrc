# Enable error handling for zsh dotfiles
# setopt ERR_EXIT  # Temporarily disabled for debugging
export DOTFILES_DEBUG=0

# Function to log dotfiles operations
dotfiles_log() {
  if [ "${DOTFILES_DEBUG:-0}" = "1" ]; then
    echo "[DOTFILES] $*" >&2
  fi
}

dotfiles_log "Loading .zshrc..."

export ZSH=$HOME/.oh-my-zsh
export ZSH_CUSTOM=$ZSH/custom

# Set all required Oh My Zsh environment variables
export DISABLE_AUTO_TITLE=true
export DISABLE_UNTRACKED_FILES_DIRTY=true
export ZSH_THEME_GIT_PROMPT_BEHIND=""
export DISABLE_AUTO_UPDATE=true
export DISABLE_UPDATE_PROMPT=true
export DISABLE_GIT_PROMPT_ASYNC=true
export ZSH_DISABLE_COMPFIX=true
export CASE_SENSITIVE=true
export ENABLE_CORRECTION=false
export DISABLE_MAGIC_FUNCTIONS=true
export DISABLE_LS_COLORS=false
export INSIDE_EMACS=false

plugins=(brew gem)

dotfiles_log "Loading Oh My Zsh..."
DISABLE_UPDATE_PROMPT=true ZSH_DISABLE_COMPFIX=true source $ZSH/oh-my-zsh.sh || {
  echo "[DOTFILES ERROR] Failed to load Oh My Zsh" >&2
  return 1
}

# Set theme after Oh My Zsh is loaded
export ZSH_THEME="minimal"

dotfiles_log "Loading .profile..."
source $HOME/.profile || {
  echo "[DOTFILES ERROR] Failed to source ~/.profile" >&2
  return 1
}

dotfiles_log "Loading .aliases..."
source $HOME/.aliases || {
  echo "[DOTFILES ERROR] Failed to source ~/.aliases" >&2
  return 1
}

# Me
unsetopt correct
unsetopt correctall
setopt histnostore
setopt histignoredups

# This loads the Included Health shell augmentations into your interactive shell
if [ -f "$HOME/.ih/augment.sh" ]; then
  dotfiles_log "Loading work augmentations..."
  . "$HOME/.ih/augment.sh" || {
    echo "[DOTFILES ERROR] Failed to load work augmentations" >&2
    return 1
  }
fi

# Cursor-specific optimizations
if [ -n "$CURSOR_SESSION_ID" ]; then
  dotfiles_log "Cursor detected - applying optimizations"
  export GIT_PAGER=""
  export EDITOR="cursor"
  export GIT_EDITOR="cursor"
  export VISUAL="cursor"
fi

dotfiles_log ".zshrc loaded successfully"
