#!/usr/bin/env bash
set -euo pipefail

echo "Installing AI applications..."

# claude-code is a cask
# chatgpt is a cask
brew install --cask \
  claude-code \
  chatgpt

# ollama has compatibility issues with Using GPU / Metal
# https://lmstudio.ai/
brew install ollama



# PAI (Personal AI) installation
if [ ! -d "$HOME/.claude" ] || [ ! -f "$HOME/.claude/INSTALL.ts" ]; then
  echo "Installing PAI..."
  TEMP_DIR=$(mktemp -d)
  git clone https://github.com/danielmiessler/PAI.git "$TEMP_DIR"

  # Back up your existing Claude Code configuration (if any)
  if [ -d "$HOME/.claude" ] && [ ! -f "$HOME/.claude/INSTALL.ts" ]; then
    mv "$HOME/.claude" "$HOME/.claude-backup-$(date +%Y%m%d)"
  fi

  # Copy the complete PAI installation
  mkdir -p "$HOME/.claude"
  cp -r "$TEMP_DIR/Releases/v2.5/." "$HOME/.claude/"

  # Run the configuration wizard
  (cd "$HOME/.claude" && bun run INSTALL.ts)

  rm -rf "$TEMP_DIR"
else
  echo "PAI is already installed in ~/.claude"
fi

# Not strictly AI but adding it here because that's what claude keeps using for commands <- Possibly remove
brew install gh

# ─── MCP Servers (Claude Code integrations) ────────────────────────
# These run via npx on-demand — no global install needed.
# Configured in ~/.claude/settings.json under "mcpServers".
# API keys stored in ~/.claude/.env (gitignored).
#
# @orengrinker/jira-mcp-server  — Jira Cloud integration (search, create, update tickets)
#   Requires: JIRA_BASE_URL, JIRA_EMAIL, JIRA_API_TOKEN in .env
#   Docs: https://github.com/OrenGrinker/jira-mcp-server

echo "AI applications installed."
