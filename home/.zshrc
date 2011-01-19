# HISTORY
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt EXTENDED_HISTORY    # puts timestamps in the history
setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_NO_STORE
setopt HIST_EXPIRE_DUPS_FIRST
setopt HASH_CMDS    # turns on hashing
setopt AUTO_PUSHD
unsetopt BG_NICE    # do NOT lower bg jobs priority
setopt NOTIFY
setopt GLOB_DOTS
unsetopt AUTO_LIST    # these two should be turned off
setopt BASH_AUTO_LIST # twice
setopt PUSHD_TO_HOME
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_SILENT
setopt PUSHD_MINUS
setopt REC_EXACT
setopt HUP
setopt EXTENDED_GLOB
setopt LONG_LIST_JOBS
setopt CDABLE_VARS
# setopt CLOBBER
# setopt CORRECT      # command CORRECTION
# setopt CORRECT_ALL

# Autoload zsh modules when they are referenced
zmodload -a zsh/stat stat
zmodload -a zsh/zpty zpty
zmodload -a zsh/zprof zprof
zmodload -ap zsh/mapfile mapfile

setopt ALL_EXPORT
autoload colors zsh/terminfo
if [[ "$terminfo[colors]" -ge 8 ]]; then
  colors
fi
for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE; do
  eval PR_$color='%{$terminfo[bold]$fg[${(L)color}]%}'
  eval PR_LIGHT_$color='%{$fg[${(L)color}]%}'
  (( count = $count + 1 ))
done
PR_NO_COLOR="%{$terminfo[sgr0]%}"
PS1="$PR_BLUE%~ $PR_WHITE$PR_NO_COLOR\$ " # Custom Prompt settings
RPS1="$PR_LIGHT_YELLOW(%D{%m-%d %H:%M})$PR_NO_COLOR"
PATH="./bin:$HOME/bin:/usr/local/bin:$PATH:/usr/local/share/npm/bin:/usr/local/Cellar/php/5.3.3/bin/"
NODE_PATH="/usr/local/lib/node"
TZ="America/New_York"
HISTFILE=$HOME/.zhistory
HISTSIZE=1000
SAVEHIST=1000
HOSTNAME="`hostname`"
PAGER='less'
EDITOR='vim'
LC_ALL='en_US.UTF-8'
LANG='en_US.UTF-8'
LC_CTYPE=C
DISPLAY=:0.0
CLICOLOR=1
unsetopt ALL_EXPORT


bindkey "^[[3~" delete-char
bindkey "^[[H" beginning-of-line
bindkey "^[[1~" beginning-of-line
bindkey "^[[F"  end-of-line
bindkey "^[[4~" end-of-line

# bindkey '^r' history-incremental-search-backward
# bindkey "^[[5~" up-line-or-history
# bindkey "^[[6~" down-line-or-history
# bindkey ' ' magic-space    # also do history expansion on space
# bindkey '^I' complete-word # complete on tab, leave expansion to _expand

# stty erase ^H &>/dev/null

autoload -U compinit
compinit

# zstyle ':completion::complete:*' use-cache on
# zstyle ':completion::complete:*' cache-path ~/.zsh/cache/$HOST
# zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s'
# zstyle ':completion:*' menu select=1 _complete _ignored _approximate
# zstyle -e ':completion:*:approxima# te:*' max-errors \
#    'reply=( $(( ($#PREFIX+$#SUFFIX)/2 )) numeric )'
# zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
# zstyle ':completion:*:processes' command 'ps -axw'
# zstyle ':completion:*:processes-names' command 'ps -awxho command'
# Completion Styles
# zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
# list of completers to use
# zstyle ':completion:*::::' completer _expand _complete _ignored _approximate

# allow one error for every three characters typed in approximate completer
# zstyle -e ':completion:*:approximate:*' max-errors \
#    'reply=( $(( ($#PREFIX+$#SUFFIX)/2 )) numeric )'
# insert all expansions for expand completer
# zstyle ':completion:*:expand:*' tag-order all-expansions

# formatting and messages
# zstyle ':completion:*' verbose yes
# zstyle ':completion:*:descriptions' format '%B%d%b'
# zstyle ':completion:*:messages' format '%d'
# zstyle ':completion:*:warnings' format 'No matches for: %d'
# zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'
# zstyle ':completion:*' group-name ''

# match uppercase from lowercase
# zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# offer indexes before parameters in subscripts
# zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters

# command for process lists, the local web server details and host completion
#zstyle ':completion:*:processes' command 'ps -o pid,s,nice,stime,args'
#zstyle ':completion:*:urls' local 'www' '/var/www/htdocs' 'public_html'
# zstyle '*' hosts $hosts

# Filename suffixes to ignore during completion (except after rm command)
# zstyle ':completion:*:*:(^rm):*:*files' ignored-patterns '*?.o' '*?.c~' \
    # '*?.old' '*?.pro'
# the same for old style completion
#fignore=(.o .c~ .old .pro)

# ignore completion functions (until the _ignored completer)
# zstyle ':completion:*:functions' ignored-patterns '_*'
# zstyle ':completion:*:scp:*' tag-order \
#    files users 'hosts:-host hosts:-domain:domain hosts:-ipaddr"IP\ Address *'
# zstyle ':completion:*:scp:*' group-order \
#    files all-files users hosts-domain hosts-host hosts-ipaddr
# zstyle ':completion:*:ssh:*' tag-order \
#    users 'hosts:-host hosts:-domain:domain hosts:-ipaddr"IP\ Address *'
# zstyle ':completion:*:ssh:*' group-order \
#    hosts-domain hosts-host users hosts-ipaddr
# zstyle '*' single-ignored show

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
source $HOME/.aliases