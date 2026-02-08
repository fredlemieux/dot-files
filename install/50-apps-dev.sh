#!/usr/bin/env bash
set -euo pipefail

echo "Installing development applications..."

brew install --cask \
  webstorm \
  docker-desktop \
  postman


echo "Development applications installed."
