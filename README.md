# Dotfiles for macOS

```
                    _   _                 _                   _       _    __ _ _
                   | | (_)               | |                 | |     | |  / _(_) |
__      _______   _| |_ _ _ __ ___   ___ | |_ ___  ___     __| | ___ | |_| |_ _| | ___  ___
\ \ /\ / / _ \ \ / / __| | '_ ` _ \ / _ \| __/ _ \/ _ \   / _` |/ _ \| __|  _| | |/ _ \/ __|
 \ V  V /  __/\ V /| |_| | | | | | | (_) | ||  __/ (_) | | (_| | (_) | |_| | | | |  __/\__ \
  \_/\_/ \___| \_/  \__|_|_| |_| |_|\___/ \__\___|\___/   \__,_|\___/ \__|_| |_|_|\___||___/

```

Also check the [Linux version](https://github.com/wevtimoteo/dotfiles/tree/linux).

Includes:

- [neovim](https://neovim.io/): better vim-based text editor
- [wezterm](https://wezfurlong.org/wezterm): terminal emulator and multiplexer
- [tmux](https://github.com/tmux/tmux): terminal multiplexer (I don't use `wezterm` for it)
- [gh](https://github.com/cli/cli): GitHub’s official command line tool
- [tig](https://jonas.github.io/tig/): ncurses-based text-mode interface for git
- [codespell](https://github.com/codespell-project/codespell): check code for common misspellings

## Setup

```bash
git clone git://github.com/wevtimoteo/dotfiles.git
cd dotfiles

./install.zsh --simulate

brew bundle
```

Omit `--simulate` to actually run it.

### Config files

### Codespell ignore words

Add a file under `~/.config/codespell/ignore-words.txt`:

```txt
SourceLevel
Dotfiles
```

### Vale Styles

To sync vale styles use:

```bash
vale sync
```

## Updating tools

```bash
topgrade -n
```

Omit `-n` to actually run it.

## References

- [dynaum/dotfiles](https://github.com/dynaum/dotfiles)
- [DailyVim](http://dailyvim.tumblr.com)
- [BrunoGrasselli/vim_files](https://github.com/BrunoGrasselli/vim_files)
- [georgeguimaraes/nvim-config](https://github.com/georgeguimaraes/nvim-config)
