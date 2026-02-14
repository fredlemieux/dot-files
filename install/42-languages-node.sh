#!/usr/bin/env bash
set -euo pipefail


# Enable corepack and install pnpm
corepack enable
corepack prepare pnpm@latest --activate

# pnpm completion zsh # TODO! revisit how we can have pnpm autocompletion
npx zsh-pnpm-completions

# Bun
brew install oven-sh/bun/bun
