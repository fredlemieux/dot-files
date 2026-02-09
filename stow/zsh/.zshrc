# --- Basics ---
export EDITOR=vim
export VISUAL=vim

##### Vim keybindings for shell editing #####
bindkey -v
##### Reduce vim-mode ESC delay #####
KEYTIMEOUT=1

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
## Interactive menu
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS} # keeps directory colours, not sure if this works/is necessary
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' # case insensitive

# Move to directories without cd
setopt autocd

##### Autosuggestions (history ghost text) #####
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'
ZSH_AUTOSUGGEST_STRATEGY=(history)
# Accept full autosuggestion with Ctrl-Space
bindkey '^ ' autosuggest-accept

# --- SSH agent (macOS-friendly) ---
# Use macOS keychain + ssh-agent
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
  eval "$(ssh-agent -s)"
fi

# --- fnm (Node.js version manager) ---
export FNM_COREPACK_ENABLED=true
if command -v fnm >/dev/null 2>&1; then
  eval "$(fnm env --use-on-cd)"
fi

# --- pyenv setup ---
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"

# --- IDE CLIs ---

# WebStorm CLI
if [[ -d "/Applications/WebStorm.app/Contents/MacOS" ]]; then
  export PATH="/Applications/WebStorm.app/Contents/MacOS:$PATH"
fi

# Terminal navigation
# Ensure option-backspace deletes word
# Option/Alt (Meta) word-wise editing in *insert* mode (viins)
# Terminal should be configured with “Use Option as Meta key”.
bindkey -M viins '^[^?' backward-kill-word   # ⌥ + Backspace
bindkey -M viins '^[d'  kill-word            # ⌥ + d (delete forward word)
bindkey -M viins '^[b'  backward-word        # ⌥ + b (back a word)
bindkey -M viins '^[f'  forward-word         # ⌥ + f (forward a word)

# Make Backspace/Delete consistently delete a single character in vi insert mode.
# (Different terminals send either ^? or ^H for Backspace.)
bindkey -M viins '^?' backward-delete-char
bindkey -M viins '^H' backward-delete-char

# Forward-delete (Fn+Delete on macOS often sends ^[[3~)
bindkey -M viins '^[[3~' delete-char

# Some terminals send these for Option+Arrow; bind them too (macOS/Terminal/iTerm common)
bindkey -M viins '^[\e[1;3D' backward-word   # ⌥ + ←
bindkey -M viins '^[\e[1;3C' forward-word    # ⌥ + →
bindkey -M viins '^[\e[3;3~' kill-word       # ⌥ + Fn + Delete (common)


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
alias gr='git rebase'
alias grhh='git reset --hard'
alias glog='git log --oneline --graph --decorate -10'

# Package aliases
alias pn=pnpm

# CLI
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Kubernetes
alias kc='kubectl'

##### Prompt (Starship) #####
eval "$(starship init zsh)"

# --- Local overrides (not committed) ---
[[ -f ~/.zsh.local ]] && source ~/.zsh.local
