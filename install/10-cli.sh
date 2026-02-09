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
  zoxide \
  kubernetes-cli \
  awscli \
  terraform \
  starship

echo "CLI tools installed"

# https://github.com/ajeetdsouza/zoxide
