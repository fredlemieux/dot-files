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
  kubernetes-cli

echo "CLI tools installed"
