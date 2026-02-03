#!/usr/bin/env bash
set -euo pipefail

echo "Installing language managers..."

brew install fnm

fnm install --lts
fnm default lts-latest

echo "Done. Next: wire fnm into zsh, then install a Node version."
