# Current projects specific language tools
pyenv install --skip-existing 3.9
pyenv install --skip-existing 3.11
pyenv install --skip-existing 3.12

# Enable corepack and install pnpm
corepack enable
corepack prepare pnpm@latest --activate
