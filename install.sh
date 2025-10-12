#!/bin/bash
# install.sh - wrapper for Codespaces compatibility

# Install required packages for Codespaces
sudo apt update
sudo apt install -y \
	curl \
	git \
	ripgrep \
	fd-find \
	fzf \
	bat \
	tig \
	jq 

# Run the actual install script
./install.zsh "$@"

source ~/.bashrc