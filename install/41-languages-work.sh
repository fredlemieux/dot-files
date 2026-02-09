#!/usr/bin/env bash
set -euo pipefail

# Initialize fnm (for corepack/pnpm commands)
if command -v fnm >/dev/null 2>&1; then
  eval "$(fnm env --use-on-cd)"
fi

# Initialize pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv >/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# Current projects specific language tools
pyenv install --skip-existing 3.9
pyenv install --skip-existing 3.11
pyenv install --skip-existing 3.12

# Install pipx if not already installed
if ! command -v pipx &> /dev/null; then
  echo "Installing pipx..."
  brew install pipx
  pipx ensurepath
else
  echo "pipx already installed"
fi

# Install poetry if not already installed or wrong version
if ! pipx list | grep -q "poetry 2.1.4"; then
  echo "Installing poetry 2.1.4..."
  pipx install poetry==2.1.4 --force
else
  echo "poetry 2.1.4 already installed"
fi

# Data grip
brew install --cask datagrip

# Enable corepack and install pnpm
corepack enable
corepack prepare pnpm@latest --activate
# pnpm completion zsh # TODO! revisit how we can have pnpm autocompletion
npx zsh-pnpm-completions


# Install Hasura CLI if not already installed
if ! command -v hasura &> /dev/null; then
  echo "Installing Hasura CLI..."
  curl -L https://github.com/hasura/graphql-engine/raw/stable/cli/get.sh | bash
else
  echo "Hasura CLI already installed"
fi
