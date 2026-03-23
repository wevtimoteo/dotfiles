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
- **Window Manager**: [Hyprland](https://hyprland.org) (v0.54.2) with [HyprPanel](https://hyprpanel.com)
- **App Launcher**: [Walker](https://github.com/abenz1267/walker) + [Elephant](https://github.com/abenz1267/elephant)
- **Screenshots**: grim + slurp with clipboard support

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

## Hyprland

The Hyprland config lives in `hypr/hyprland.conf` and is symlinked to `~/.config/hypr/` via `install.zsh`.

### Key bindings

| Keybind | Action |
|---------|--------|
| Super + Q | Open terminal (Ghostty) |
| Super + Space | App launcher (Walker) |
| Super + V | Clipboard history |
| Super + E | File manager (Nautilus) |
| Super + C | Close window |
| Super + N | Toggle notification panel |
| Super + B | Toggle bar |
| Super + Shift + R | Reload config |
| Super + F1 | Show all keybinds |
| Alt + Tab | Window switcher (Walker) |
| Super + 1-0 | Switch workspace |
| Super + Shift + 1-0 | Move window to workspace |
| Ctrl + Alt + Left/Right | Previous/next workspace |
| Super + L | Lock screen |
| Alt + Super + F | Fullscreen |
| Ctrl + Super + Return | Maximize |
| Print | Screenshot (full screen) |
| Super + Print | Screenshot (region) |
| Super + Shift + Print | Screenshot (active window) |

### Dependencies

```bash
# Hyprland (v0.54.2 from PPA)
sudo add-apt-repository ppa:cppiber/hyprland
sudo apt update
sudo apt install hyprland

# Core tools
sudo apt install grim slurp wl-clipboard cliphist playerctl brightnessctl imagemagick

# HyprPanel (build from source, see tmp/hyprland-setup-deps.md)
sudo apt install meson ninja-build valac valadoc gobject-introspection \
  libgirepository1.0-dev libgtk-3-dev libgtk-layer-shell-dev \
  libgtk-4-dev libgtk4-layer-shell-dev libjson-glib-dev libnm-dev \
  libwireplumber-0.5-dev gir1.2-gtksource-3.0 libiniparser-dev \
  libfftw3-dev gir1.2-gtop-2.0
```

HyprPanel, Walker, and Elephant are built from source. See the build steps in the commit history or run `cat tmp/hyprland-setup-deps.md` after creating the `tmp/` directory locally.

## Docker LSP

Run LSP servers inside Docker containers so that language servers resolve dependencies from the container rather than the host.

Two scripts handle the setup:

- **`docker-lsp`** — wrapper that proxies LSP commands through `docker compose exec -T`
- **`docker-lsp-init`** — bootstrap script that generates per-project config

### Supported servers

| Server | Detected by |
|--------|-------------|
| ElixirLS | `mix.exs` |
| Ruby LSP | `Gemfile` |
| Tailwind CSS | `tailwind.config.js` / `tailwind.config.ts` |

### Setup

Run `docker-lsp-init` inside a project that has a `compose.yaml`:

```bash
cd ~/Sites/my-project
docker-lsp-init
```

This generates:

1. `compose.override.yaml` — aligns container paths to host paths and mounts Mason LSP packages read-only
2. `.nvim.lua` — appends `vim.lsp.config()` calls that point each server to the `docker-lsp` wrapper

Then restart containers and open Neovim:

```bash
docker compose down && docker compose up -d
nvim .
```

Verify with `:LspInfo` — the `cmd` should show the `docker-lsp` wrapper.

Add `compose.override.yaml` to the project's `.gitignore` so it stays local.

## References

- https://github.com/dynaum/dotfiles
- https://github.com/BrunoGrasselli/vim_files
- https://github.com/git/git
