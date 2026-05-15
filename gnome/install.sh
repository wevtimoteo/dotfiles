#!/usr/bin/env bash
set -euo pipefail

if ! command -v gsettings >/dev/null 2>&1; then
  echo "gsettings not found; skipping GNOME setup"
  exit 0
fi

if ! gsettings list-schemas | grep -qx 'org.gnome.GPaste'; then
  echo "GPaste gsettings schema not found; skipping GPaste setup"
  exit 0
fi

gsettings set org.gnome.GPaste images-support true
gsettings set org.gnome.GPaste growing-lines true
gsettings set org.gnome.GPaste synchronize-clipboards true
gsettings set org.gnome.GPaste save-history true
gsettings set org.gnome.GPaste track-changes true
gsettings set org.gnome.GPaste max-history-size 200

if command -v gnome-extensions >/dev/null 2>&1; then
  if gnome-extensions list 2>/dev/null | grep -q '^GPaste@gnome-shell-extensions.gnome.org$'; then
    gnome-extensions enable GPaste@gnome-shell-extensions.gnome.org || true
  fi
fi
