#!/usr/bin/env bash
# Now playing (Spotify) for tmux status bar via osascript (macOS)
MAX_LEN=40

text=$(osascript -e '
tell application "System Events"
  set process_list to (name of every process)
end tell
if process_list contains "Spotify" then
  tell application "Spotify"
    if player state is playing then
      set track_name to name of current track
      set artist_name to artist of current track
      return artist_name & " - " & track_name
    end if
  end tell
end if
return ""
' 2>/dev/null)

if [ -z "$text" ]; then
  echo -n "-"
  exit 0
fi

if [ ${#text} -gt $MAX_LEN ]; then
  echo -n "${text:0:$MAX_LEN}…"
else
  echo -n "$text"
fi
