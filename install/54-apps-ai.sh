#!/usr/bin/env bash
set -euo pipefail

echo "Installing AI applications..."

# claude-code is a cask
# chatgpt is a cask
brew install --cask \
  claude-code \
  chatgpt

echo "AI applications installed."
