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

# Installation:

```bash
git clone git://github.com/wevtimoteo/dotfiles.git
cd dotfiles

./install.zsh # --simulate
```

### Applying NixOS changes

```bash
sudo nixos-rebuild switch --flake <path-to-dotfiles>/dotfiles/nixos --impure
```

- Install [Julia Mono Nerdfont](https://github.com/mietzen/juliamono-nerd-font)
- Extract them to the `./nixos/modules/fonts/` directory

## References:

  * https://github.com/dynaum/dotfiles
  * http://dailyvim.tumblr.com
  * https://github.com/BrunoGrasselli/vim_files
  * https://github.com/git/git

## Evolution Mail client keymap

### Checking keys:

```
xmodmap -pk | grep <key-name>
```

```
(gtk_accel_path "<Actions>/new-item/mail-message-new" "c")
(gtk_accel_path "<Actions>/mail/mail-previous" "k")
(gtk_accel_path "<Actions>/mail/mail-next" "j")
(gtk_accel_path "<Actions>/mail/mail-move" "v")
(gtk_accel_path "<Actions>/mail/mail-copy" "l")
(gtk_accel_path "<Actions>/mail/mail-mark-unread" "<Shift>u")
(gtk_accel_path "<Actions>/mail/mail-mark-read" "<Shift>i")
(gtk_accel_path "<Actions>/mail/mail-folder-select-thread" "x")
(gtk_accel_path "<Actions>/mail/mail-archive" "e")
(gtk_accel_path "<Actions>/mail/mail-delete" "<Shift>ssharp")
```
