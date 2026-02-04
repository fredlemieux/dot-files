#!/usr/bin/env bash
set -euo pipefail

echo "Installing browsers..."

brew install --cask \
  arc \
  google-chrome \
  chromium

echo "Browsers installed."
