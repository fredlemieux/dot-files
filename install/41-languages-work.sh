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

# Enable corepack and install pnpm
corepack enable
corepack prepare pnpm@latest --activate
