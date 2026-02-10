#!/usr/bin/env bash
# Cached ping for tmux status bar (refreshes every 30s)
CACHE_FILE="/tmp/tmux-ping-cache"
MAX_AGE=30

if [ -f "$CACHE_FILE" ]; then
  file_age=$(( $(date +%s) - $(stat -f %m "$CACHE_FILE") ))
  if [ "$file_age" -lt "$MAX_AGE" ]; then
    cat "$CACHE_FILE"
    exit 0
  fi
fi

result=$(ping -c 1 -W 1 8.8.8.8 2>/dev/null | tail -1 | awk -F'/' '{printf "%.0fms", $5}')
if [ -n "$result" ]; then
  echo -n "$result" > "$CACHE_FILE"
  echo -n "$result"
else
  echo -n "N/A"
fi
