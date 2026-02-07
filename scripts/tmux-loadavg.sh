#!/usr/bin/env bash
# Load average (1min, 5min) for tmux status bar
awk '{printf "%s %s", $1, $2}' /proc/loadavg
