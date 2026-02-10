#!/usr/bin/env bash
set -e

# 1. Xcode Command Line Tools
if ! xcode-select -p &>/dev/null; then
  echo "Installing Xcode Command Line Tools..."
  xcode-select --install
  echo "Please re-run this script after installation completes."
  exit 1
fi

# 2. Homebrew
if ! command -v brew &>/dev/null; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# 3. Ensure brew in PATH (Apple Silicon)
if [[ "$(uname -m)" == "arm64" ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Ensure brew is available in THIS script run (Apple Silicon)
if [[ -x /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ -x /usr/local/bin/brew ]]; then
  eval "$(/usr/local/bin/brew shellenv)"
fi

# 4. Core tools
brew install git stow

# 5. Show only running apps in Dock (empties pinned apps)
defaults write com.apple.dock static-only -bool true

# Optional: also hide "recent apps" section
defaults write com.apple.
dock show-recents -bool false

# 6. Auto-hide the dock
defaults write com.apple.dock autohide -bool true && killall Dock

killall Dock

# TODO!
# This clashes with webstorm shortcuts
#Disable/change the key binding for the Search man Page Index in Terminal feature:
#Open Apple menu | System Preferences | Keyboard | Shortcuts | Services
#Disable Search man Page Index in Terminal (or change the shortcut)
#Use Search Everywhere (Shift+Shift) shortcut instead of Find Action (Cmd+Shift+A).
