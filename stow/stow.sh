#!/usr/bin/env bash
set -euo pipefail

echo "Symlinking dotfiles with stow..."

STOW_DIR="$(cd "$(dirname "$0")" && pwd)"

cd "$STOW_DIR"

# Stow each config directory
for dir in */; do
  dir_name="${dir%/}"
  echo "  → stowing $dir_name"
  stow -t ~ "$dir_name"
done

echo "Dotfiles symlinked successfully."
