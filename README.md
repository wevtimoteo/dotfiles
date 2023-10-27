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

## Setup

```bash
git clone git://github.com/wevtimoteo/dotfiles.git
cd dotfiles

./install.zsh --simulate

brew bundle
```

Omit `--simulate` to actually run it.

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
