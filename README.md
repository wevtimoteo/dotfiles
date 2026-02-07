# Dotfiles for Linux

```
                    _   _                 _                   _       _    __ _ _
                   | | (_)               | |                 | |     | |  / _(_) |
__      _______   _| |_ _ _ __ ___   ___ | |_ ___  ___     __| | ___ | |_| |_ _| | ___  ___
\ \ /\ / / _ \ \ / / __| | '_ ` _ \ / _ \| __/ _ \/ _ \   / _` |/ _ \| __|  _| | |/ _ \/ __|
 \ V  V /  __/\ V /| |_| | | | | | | (_) | ||  __/ (_) | | (_| | (_) | |_| | | | |  __/\__ \
  \_/\_/ \___| \_/  \__|_|_| |_| |_|\___/ \__\___|\___/   \__,_|\___/ \__|_| |_|_|\___||___/

```

Check [`macOS` version](https://github.com/wevtimoteo/dotfiles/tree/macos).

## What's included

- **Shell**: zsh with custom aliases and exports
- **Editor**: Neovim
- **Terminal**: Ghostty, WezTerm
- **Multiplexer**: tmux with [catppuccin-frappe](https://github.com/catppuccin/tmux) theme
- **Prompt**: [Starship](https://starship.rs)
- **Git**: custom aliases, global gitignore
- **Theme**: Catppuccin Frappe across terminal and editor

## Installation

```bash
git clone git://github.com/wevtimoteo/dotfiles.git
cd dotfiles

./install.zsh # --simulate
```

Credentials and machine-specific settings are kept in `~/.gitconfig.local` (not tracked).

## tmux status bar

The tmux setup uses catppuccin-frappe with the following status modules:

| Module | Description |
|--------|-------------|
| Now Playing | Current Spotify/MPRIS track via `playerctl` |
| Ping | Network latency to 8.8.8.8 (cached, 30s interval) |
| Load Average | System load (1min, 5min) |
| CPU | CPU usage percentage |
| Battery | Battery level and icon |
| Session | Current tmux session name |

After installing plugins with `prefix + I`, reload with `prefix + r`.

### Setup

The tmux custom modules reference scripts via `$DOTFILES_DIR`. Add the following to your `~/.custom_exports`:

```bash
export DOTFILES_DIR="$HOME/Sites/dotfiles"
```

### Dependencies

- `playerctl` for now playing module: `sudo apt install playerctl`

## References

- https://github.com/dynaum/dotfiles
- https://github.com/BrunoGrasselli/vim_files
- https://github.com/git/git
