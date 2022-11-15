# Installation:

```
git clone git://github.com/wevtimoteo/dotfiles.git
cd dotfiles
bash install.sh
```

## References:

  * https://github.com/dynaum/dotfiles
  * http://dailyvim.tumblr.com
  * https://github.com/BrunoGrasselli/vim_files
  * https://github.com/git/git

## License:

```
             DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
                    Version 2, December 2004

 Copyright (C) 2004 Sam Hocevar <sam@hocevar.net>

 Everyone is permitted to copy and distribute verbatim or modified
 copies of this dotfiles code, and changing it is allowed as long
 as the name is changed.

            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION

  0. You just DO WHAT THE FUCK YOU WANT TO.
```

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
