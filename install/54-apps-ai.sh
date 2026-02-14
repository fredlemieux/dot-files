#!/usr/bin/env bash
set -euo pipefail

echo "Installing AI applications..."

# claude-code is a cask
# chatgpt is a cask
brew install --cask \
  claude-code \
  chatgpt

# ollama has compatibility issues with Using GPU / Metal
# https://lmstudio.ai/
brew install ollama

echo "AI applications installed."
