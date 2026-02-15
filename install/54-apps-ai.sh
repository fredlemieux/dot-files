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

# Not strictly AI but adding it here because that's what claude keeps using for commands <- Possibly remove
brew install gh

echo "AI applications installed."
