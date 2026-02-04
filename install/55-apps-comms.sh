#!/usr/bin/env bash
set -euo pipefail

echo "Installing communication applications..."

brew install --cask \
  whatsapp \
  slack \
  microsoft-teams

echo "Communication applications installed."
