#!/usr/bin/env bash
set -euo pipefail

echo "Installing language managers..."

# fnm (Fast Node Manager)
brew install fnm
# For alfred's calculate anything
brew install php

brew install pyenv
# Pyenv build environment https://github.com/pyenv/pyenv/wiki#suggested-build-environment
brew install openssl readline sqlite3 xz tcl-tk@8 libb2 zstd zlib pkgconfig
# Just install the latest python 3 version and use as default
pyenv install 3

echo "fnm installed. Note: No node versions are installed here."
