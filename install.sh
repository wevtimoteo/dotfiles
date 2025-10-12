#!/bin/bash
# install.sh - wrapper for Codespaces compatibility

# Install required packages for Codespaces
sudo apt update
sudo apt install -y \
	tmux \
	zsh \
	curl \
	git \
	ripgrep \
	fd-find \
	fzf \
	bat \
	neovim \
	tig \
	direnv \
	jq 
# eza, yazi, antidote, eza, and others may require manual install or are not available in apt

wget "https://github.com/sharkdp/vivid/releases/download/v0.8.0/vivid_0.8.0_amd64.deb"
sudo dpkg -i vivid_0.8.0_amd64.deb

# Run the actual install script
./install.zsh "$@"
