# Enable error handling for zsh dotfiles
setopt ERR_EXIT
export DOTFILES_DEBUG=1

# Function to log dotfiles operations
dotfiles_log() {
  if [ "${DOTFILES_DEBUG:-0}" = "1" ]; then
    echo "[DOTFILES] $*" >&2
  fi
}

dotfiles_log "Loading .zshrc..."

export ZSH=$HOME/.oh-my-zsh
export ZSH_THEME="sunaku"

plugins=(brew gem)

dotfiles_log "Loading Oh My Zsh..."
source $ZSH/oh-my-zsh.sh || {
  echo "[DOTFILES ERROR] Failed to load Oh My Zsh" >&2
  return 1
}

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
