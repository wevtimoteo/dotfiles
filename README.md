# Dotfiles for macOS

```
                    _   _                 _                   _       _    __ _ _
                   | | (_)               | |                 | |     | |  / _(_) |
__      _______   _| |_ _ _ __ ___   ___ | |_ ___  ___     __| | ___ | |_| |_ _| | ___  ___
\ \ /\ / / _ \ \ / / __| | '_ ` _ \ / _ \| __/ _ \/ _ \   / _` |/ _ \| __|  _| | |/ _ \/ __|
 \ V  V /  __/\ V /| |_| | | | | | | (_) | ||  __/ (_) | | (_| | (_) | |_| | | | |  __/\__ \
  \_/\_/ \___| \_/  \__|_|_| |_| |_|\___/ \__\___|\___/   \__,_|\___/ \__|_| |_|_|\___||___/

```

Personal macOS configuration optimized for development workflow efficiency and terminal-based productivity.

Also check the [Linux version](https://github.com/wevtimoteo/dotfiles/tree/linux).

## Philosophy

This setup prioritizes:
- **Terminal-first workflow** - Minimal GUI dependencies, maximum keyboard efficiency
- **Security by default** - GPG commit signing, proper credential handling
- **Reproducibility** - Easy setup across machines with automated installation
- **Modern tooling** - Rust-based alternatives (ripgrep, fd, eza) for better performance

## Core Tools

### Editor & Terminal
- [neovim](https://neovim.io/) - Modern Vim with LSP, configured with [LazyVim](https://www.lazyvim.org/)
- [wezterm](https://wezfurlong.org/wezterm) - GPU-accelerated terminal emulator with multiplexing
- [tmux](https://github.com/tmux/tmux) - Terminal multiplexer for session management
- [starship](https://starship.rs/) - Fast, customizable shell prompt

### Development
- [gh](https://github.com/cli/cli) - GitHub CLI for PR/issue management
- [tig](https://jonas.github.io/tig/) - Text-mode interface for git with visual diffs
- [direnv](https://direnv.net/) - Automatic environment variable loading per project

### File Navigation & Search
- [ripgrep](https://github.com/BurntSushi/ripgrep) - Fast recursive grep
- [fd](https://github.com/sharkdp/fd) - Modern alternative to `find`
- [fzf](https://github.com/junegunn/fzf) - Fuzzy finder for files and command history
- [yazi](https://yazi-rs.github.io/) - Terminal file manager
- [eza](https://github.com/eza-community/eza) - Modern replacement for `ls`
- [bat](https://github.com/sharkdp/bat) - Syntax-highlighted `cat` clone

### Writing & Code Quality
- [codespell](https://github.com/codespell-project/codespell) - Spell checker for code
- [vale](https://vale.sh/) - Prose linter with style enforcement

### System Maintenance
- [topgrade](https://github.com/topgrade-rs/topgrade) - Unified update tool for all package managers
- [overmind](https://github.com/DarthSim/overmind) - Process manager for Procfile-based apps

## Setup

### Initial Installation

```bash
# Clone the repository
git clone git://github.com/wevtimoteo/dotfiles.git
cd dotfiles

# Preview what will be symlinked (dry run)
./install.zsh --simulate

# Actually create symlinks
./install.zsh

# Install packages via Homebrew
brew bundle
```

### Post-Installation Configuration

#### 1. Git Configuration

Create `~/.gitconfig.local` with your personal information:

```ini
[user]
  name = Your Name
  email = your.email@example.com
  signingkey = YOUR_GPG_KEY_ID
```

#### 2. Codespell Ignore Words

Create `~/.config/codespell/ignore-words.txt`:

```txt
SourceLevel
Dotfiles
```

#### 3. Vale Styles

Sync Vale writing styles:

```bash
vale sync
```

#### 4. Environment Variables

For project-specific or sensitive environment variables, create `~/.custom_exports` (automatically sourced by zshrc):

```bash
# Example: API keys, tokens, etc.
export GROQ_API_KEY="your-key-here"
export OPENAI_API_KEY="your-key-here"
```

## Maintenance

### Update All Tools

Use [topgrade](https://github.com/topgrade-rs/topgrade) to update everything at once:

```bash
# Dry run to see what would be updated
topgrade -n

# Actually run updates
topgrade
```

This will update:
- Homebrew packages and casks
- npm global packages
- Neovim plugins
- asdf plugins
- System software

### Update Specific Components

```bash
# Update Homebrew packages only
brew update && brew upgrade

# Update Neovim plugins
nvim --headless "+Lazy! sync" +qa
```

## Key Features

### Git Workflow Enhancements
- **GPG Commit Signing** - Automatically sign commits (configured in gitconfig)
- **Custom Aliases** - Shortcuts like `git update` (fetch + rebase), `git changes` (show modified files)
- **Smart Diffs** - Uses [git-split-diffs](https://github.com/banga/git-split-diffs) for improved readability
- **Auto-rebase** - Automatically rebase on pull instead of merge

### Shell Configuration
- **Zsh** with [antidote](https://getantidote.github.io/) plugin manager
- **Starship prompt** - Fast, informative prompt with git status
- **Smart history** - Ignore duplicates and commands starting with space
- **Directory shortcuts** - Auto-cd to `~/Sites`, `~/Apps` without typing `cd`

### Neovim Setup
- Based on [LazyVim](https://www.lazyvim.org/) starter configuration
- AI assistance with [Avante.nvim](https://github.com/yetone/avante.nvim)
- LSP configured for multiple languages
- Telescope for fuzzy finding
- Which-key for keybinding discovery

## References & Inspiration

- [dynaum/dotfiles](https://github.com/dynaum/dotfiles)
- [DailyVim](http://dailyvim.tumblr.com)
- [BrunoGrasselli/vim_files](https://github.com/BrunoGrasselli/vim_files)
- [georgeguimaraes/nvim-config](https://github.com/georgeguimaraes/nvim-config)

## License

MIT License - see [LICENSE](LICENSE) file for details
