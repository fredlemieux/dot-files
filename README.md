# Dotfiles

Personal macOS dotfiles managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Structure

```
bootstrap/      # Initial system setup (Xcode, Homebrew, etc.)
install/        # Modular installation scripts
  10-cli.sh           # CLI tools (tmux, fzf, ripgrep, etc.)
  40-languages.sh     # Language managers (fnm, pyenv, php)
  41-languages-work.sh # Work specific languages (Python 3.9/3.11/3.12, Hasura, Poetry)
  42-languages-node.sh # Node/Bun tools (pnpm, bun)
  50-apps-dev.sh      # Development apps (WebStorm, Docker, Postman)
  51-apps-browsers.sh # Web browsers (Chrome, Firefox)
  52-apps-productivity.sh # Productivity apps
  53-apps-vpn.sh      # VPN clients
  54-apps-ai.sh       # AI tools (Claude Code, ChatGPT, Ollama, PAI)
  55-apps-comms.sh    # Communication apps (WhatsApp, Slack, Teams)
  56-apps-password-managers.sh # Password managers (Keeper)
  60-experiments.sh   # Experimental apps and tools
  90-all.sh           # Run all installers in order
stow/           # Configuration files for symlinking
  .stow-local-ignore  # Files to exclude from symlinking
  stow.sh             # Symlink script
  git/                # Git config
  idea/               # IdeaVim config
  ssh/                # SSH config
  starship/           # Starship prompt config
  tmux/               # Tmux config
  zsh/                # Zsh config
```

## Setup

### Fresh macOS Installation

Run the bootstrap script first:

```bash
git clone https://github.com/yourusername/dotfiles.git ~/dotfiles
cd ~/dotfiles
./bootstrap/macos.sh
```

This will:
- Install Xcode Command Line Tools
- Install Homebrew
- Install git and stow
- Configure Dock settings

### Install Everything

Run all installers and symlink dotfiles:

```bash
./install/90-all.sh
```

Or run individual installers:

```bash
./install/10-cli.sh          # CLI tools only
./install/40-languages.sh    # Language managers only
./stow/stow.sh               # Symlink dotfiles only
```

### Git Configuration

Copy the example config and add your email:

```bash
cp stow/git/.gitconfig.local.example ~/.gitconfig.local
vim ~/.gitconfig.local  # Add your email
```

## Manual Steps

After running the installers:

1. **Node.js**: Install a Node version with `fnm install <version>` and `fnm use <version>`
2. **SSH Keys**: Add your SSH keys to `~/.ssh/`
3. **Git Email**: Update `~/.gitconfig.local` with your email address

## Updating

To re-symlink dotfiles after making changes:

```bash
cd ~/dotfiles/stow
stow -R -t ~ <folder>  # Re-stow a specific config
```

Or run the stow script:

```bash
./stow/stow.sh
```

## License

MIT
