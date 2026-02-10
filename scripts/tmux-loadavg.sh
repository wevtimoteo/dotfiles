#!/usr/bin/env bash
# Load average (1min, 5min) for tmux status bar (macOS)
sysctl -n vm.loadavg | awk '{printf "%s %s", $2, $3}'
