# --- Basics ---
export EDITOR=vim
export VISUAL=vim

# --- History ---
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_REDUCE_BLANKS

# --- Completion ---
autoload -Uz compinit
compinit

# --- SSH agent (macOS-friendly) ---
# Use macOS keychain + ssh-agent
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
  eval "$(ssh-agent -s)"
fi
