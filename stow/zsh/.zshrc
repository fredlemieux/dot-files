# --- Basics ---
export EDITOR=vim
export VISUAL=vim

##### Vim keybindings for shell editing #####
bindkey -v

# --- History ---
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_REDUCE_BLANKS
setopt INC_APPEND_HISTORY

# --- Completion ---
autoload -Uz compinit
compinit

# --- SSH agent (macOS-friendly) ---
# Use macOS keychain + ssh-agent
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
  eval "$(ssh-agent -s)"
fi

# --- fnm (Node.js version manager) ---
if command -v fnm >/dev/null 2>&1; then
  eval "$(fnm env --use-on-cd)"
fi

# --- IDE CLIs ---

# WebStorm CLI
if [[ -d "/Applications/WebStorm.app/Contents/MacOS" ]]; then
  export PATH="/Applications/WebStorm.app/Contents/MacOS:$PATH"
fi

## ALIASES!
# Git aliases (OMZ-style greatest hits)
alias g='git'
alias ga='git add'
alias gaa='git add --all'
alias gb='git branch'
alias gbd='git branch -d'
alias gc='git commit'
alias gca='git commit --amend'
alias gcam='git commit -am'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gd='git diff'
alias gds='git diff --staged'
alias gl='git pull'
alias gp='git push'
alias gpf='git push --force-with-lease'
alias gst='git status'
alias glog='git log --oneline --graph --decorate -10'

# CLI Aliases for ease
alias ..='cd ..'


##### Prompt (Starship) #####
eval "$(starship init zsh)"
