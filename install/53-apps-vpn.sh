#!/usr/bin/env bash
set -euo pipefail

echo "Installing VPN..."

brew install --cask \
  protonvpn \
  aws-vpn-client

echo "VPN installed."
