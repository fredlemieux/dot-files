#!/usr/bin/env bash
set -euo pipefail

echo "Installing GUI apps..."

brew install --cask \
  webstorm \
  chatgpt \
  alfred \
  rectangle \
  docker-desktop \
  protonvpn \
  google-drive \
  dropbox \
  obsidian \
  arc \
  google-chrome \
  chromium

echo "Done."
echo "Notes:"
echo "- Alfred needs accessibility permissions"
echo "- Docker Desktop needs launching once to finish setup"
