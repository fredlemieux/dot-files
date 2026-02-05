#!/usr/bin/env bash
set -euo pipefail

echo "Installing CLI tools..."

brew install \
  tmux \
  fzf \
  ripgrep \
  fd \
  bat \
  direnv \
  zsh-autosuggestions \
  kubernetes-cli \
  starship

echo "CLI tools installed"
