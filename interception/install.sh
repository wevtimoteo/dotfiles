#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DEBOUNCER_REPO="https://github.com/cpphusky/debouncer-udevmon.git"
DEBOUNCER_BUILD_DIR="/tmp/debouncer-udevmon"

# 1. Install interception-tools
# sudo add-apt-repository ppa:deafmute/interception
# sudo apt install interception-tools

# 2. Install build dependencies for debouncer-udevmon
# sudo apt install libclang-dev

# 3. Build and install debouncer-udevmon (requires Rust/Cargo)
# git clone "$DEBOUNCER_REPO" "$DEBOUNCER_BUILD_DIR"
# cd "$DEBOUNCER_BUILD_DIR"
# cargo build --release
# sudo cp target/release/debouncer-udevmon /usr/local/bin/

# 4. Symlink configs
sudo mkdir -p /etc/interception/udevmon.d
sudo ln -sf "$SCRIPT_DIR/debouncer.toml" /etc/debouncer.toml
sudo ln -sf "$SCRIPT_DIR/g915x-debounce.yaml" /etc/interception/udevmon.d/g915x-debounce.yaml

echo "Interception configs symlinked."

# 5. Test with timeout before enabling permanently
# sudo timeout 30 udevmon -c /etc/interception/udevmon.d/g915x-debounce.yaml

# 6. Enable the service
# sudo systemctl enable udevmon.service --now
