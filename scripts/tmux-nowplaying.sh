#!/usr/bin/env bash
# Now playing (Spotify / MPRIS) for tmux status bar, truncated to 40 chars
MAX_LEN=50

text=$(playerctl metadata --format '{{ artist }} - {{ title }}' 2>/dev/null)

if [ -z "$text" ]; then
  echo -n ""
  exit 0
fi

if [ ${#text} -gt $MAX_LEN ]; then
  echo -n "${text:0:$MAX_LEN}…"
else
  echo -n "$text"
fi
