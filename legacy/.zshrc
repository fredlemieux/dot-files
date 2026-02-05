
PROMPT='%F{green}%*%f %F{purple}%~%f %F{red}${vcs_info_msg_0_}%f$ '
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/frederiquelemieux/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="theunraveler"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	ssh-agent
	git
	zsh-autosuggestions
	zsh-syntax-highlighting
	git-open
    virtualenv
)

source $ZSH/oh-my-zsh.sh

# User configuration
[ -z "$SSH_AUTH_SOCK" ] && eval "$(ssh-agent -s)"

###### AWS Credentials for Terraform
# export AWS_PROFILE=paragon && echo AWS profile is PARAGON
# export AWS_PROFILE=paragon_staging && echo AWS profile is PARAGON STAGING
# export AWS_PROFILE=company_bakery && echo AWS profile is COMPANY BAKERY
# export AWS_PROFILE=personal && echo AWS profile is PERSONAL
# export AWS_PROFILE=powerx && echo AWS profile is POWERX
export AWS_PROFILE=devrole && echo AWS profile is POWERX DEV!!
# export AWS_PROFILE=prodrole && echo AWS profile is POWERX PROD!!

echo Husky disabled!
export HUSKY=0

# ----- zsh / bash snippet, place in ~/.zshrc / ~/.bashrc -----
source $HOME/.iterm2_shell_integration.zsh
iterm2_print_user_vars() {
	iterm2_set_user_var awsProfile $AWS_DEFAULT_PROFILE
}

# Puppeteer for Cypress
export PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
export PUPPETEER_EXECUTABLE_PATH=`which chromium`


# Android Dev
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
# export PATH=$PATH:$ANDROID_HOME/tools
# export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin

# # Jenv config for multiple java versions
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"


# Node
export NODE_BINARY="/opt/homebrew/bin/node"

# Brew --arch intel
# https://stackoverflow.com/questions/64951024/how-can-i-run-two-isolated-installations-of-homebrew
alias brow='arch --x86_64 /usr/local/Homebrew/bin/brew'

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias awscred="vim ~/.aws/credentials"
alias downloads="cd ~/downloads"
alias sshconfig="vim ~/.ssh/config"
alias sshkh="vim ~/.ssh/known_hosts"
alias ws="webstorm"
alias sls="serverless"
alias kc="kubectl"
alias gitroot='cd $(git rev-parse --show-toplevel)'
alias g4p='export PGUSER=game4padel_bidb
export PGPASSWORD=1#*05xRdyW2hPEcc'
alias vim='nvim'
alias vi='nvim'
alias viconfig='vi ~/.config/nvim'
alias ideavimconfig='vi ~/.ideavimrc'
alias pn='pnpm'

# PowerX aliases
alias getKubeToken='export KUBE_TOKEN=$(AWS_PROFILE=devrole aws eks get-token --cluster-name dev-eks --query status.token --output=text) && echo "Token updated!"'


function gcoo(){
  git checkout -t origin/"$1"
}


# Kubernetes autocomplete
source <(kubectl completion zsh)

# This runs iTerm un Rosetta
# alias intel="arch -x86_64"


export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/terraform terraform

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Extensions

# NVM Setup
source $HOME/zsh-extensions/yarn-run.plugin.zsh/yarn-run.plugin.zsh
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
# If you use nvm, setting NVM_SYMLINK_CURRENT=true creates a symbolic link, $NVM_DIR/current whenever you switch node versions,
# which can make updating node much simpler for WebStorm or any other IDE.
export NVM_SYMLINK_CURRENT=true

# place this after nvm initialization!
autoload -U add-zsh-hook

load-nvmrc() {
  local nvmrc_path
  nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version
    nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$(nvm version)" ]; then
      nvm use
    fi
  elif [ -n "$(PWD=$OLDPWD nvm_find_nvmrc)" ] && [ "$(nvm version)" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}

add-zsh-hook chpwd load-nvmrc
load-nvmrc

# PYENV setup
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
# This ensures that the environment is executable via paths.
export PATH=$(pyenv root)/shims:$PATH
# Python virtual env
eval "$(pyenv virtualenv-init -)"
function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}
export PYENV_VIRTUALENV_DISABLE_PROMPT=0
PROMPT+='%{$fg[green]%}$(virtualenv_info)%{$reset_color%}% $ '

# TidalVim Vin dir
export VIMTIDAL="$HOME/.local/share/nvim/site/pack/packer/start/vim-tidal"
export PATH="$VIMTIDAL/bin:$PATH"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

[ -f "/Users/frederiquelemieux/.ghcup/env" ] && source "/Users/frederiquelemieux/.ghcup/env" # ghcup-env
source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
source /opt/homebrew/opt/chruby/share/chruby/auto.sh
chruby ruby-3.3.6

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/frederiquelemieux/.lmstudio/bin"

# pnpm
export PNPM_HOME="/Users/frederiquelemieux/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/frederiquelemieux/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions
export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"
