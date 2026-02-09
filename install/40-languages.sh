#!/usr/bin/env bash
set -euo pipefail

echo "Installing language managers..."

# fnm (Fast Node Manager)
brew install fnm
# Initialize fnm for this script
eval "$(fnm env --use-on-cd)"
# Install latest LTS Node if no versions installed yet
if [ -z "$(fnm ls)" ]; then
  echo "No Node versions found, installing latest LTS..."
  fnm install --lts
  fnm default lts-latest
fi

# For alfred's calculate anything
brew install php

brew install pyenv
# Initialize pyenv for this script
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Pyenv build environment https://github.com/pyenv/pyenv/wiki#suggested-build-environment
brew install openssl readline sqlite3 xz tcl-tk@8 libb2 zstd zlib pkgconfig
# Just install the latest python 3 version and use as default
pyenv install --skip-existing 3

echo "fnm installed. Note: No node versions are installed here."
