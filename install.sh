#!/bin/bash
# install.sh - wrapper for Codespaces compatibility

# Install required packages for Codespaces
sudo apt update
sudo apt install -y \
    exa \
	curl \
	git \
	ripgrep \
	fd-find \
	fzf \
	bat \
	tig \
	direnv \
	jq 

wget "https://github.com/sharkdp/vivid/releases/download/v0.8.0/vivid_0.8.0_amd64.deb"
sudo dpkg -i vivid_0.8.0_amd64.deb

# Run the actual install script
./install.zsh "$@"
