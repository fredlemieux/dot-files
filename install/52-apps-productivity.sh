#!/usr/bin/env bash
set -euo pipefail

echo "Installing productivity applications..."

brew install --cask \
  alfred \
  rectangle \
  obsidian \
  google-drive

echo "Productivity applications installed."
