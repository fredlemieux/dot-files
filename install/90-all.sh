#!/usr/bin/env bash
set -euo pipefail

# Run all installers in order.
# Note: bootstrap/ remains untouched; this orchestrates install/ scripts only.

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
INSTALL_DIR="$ROOT_DIR/install"

scripts=(
  "10-cli.sh"
  "40-languages.sh"
  "41-languages-work.sh"
  "42-languages-node.sh"
  "50-apps-dev.sh"
  "51-apps-browsers.sh"
  "52-apps-productivity.sh"
  "53-apps-vpn.sh"
  "54-apps-ai.sh"
  "55-apps-comms.sh"
  "56-apps-password-managers.sh"
  "60-experiments.sh"
)

for script in "${scripts[@]}"; do
  path="$INSTALL_DIR/$script"
  if [[ -x "$path" ]]; then
    echo "==> Running $script"
    "$path"
  elif [[ -f "$path" ]]; then
    echo "==> Running $script (forcing bash)"
    bash "$path"
  else
    echo "Warning: $script not found, skipping" >&2
  fi
  echo
done

echo "All installers finished."
echo
echo "==> Symlinking dotfiles with stow"
"$ROOT_DIR/stow/stow.sh"
