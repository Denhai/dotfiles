#!/bin/bash

sudo apt update

# Install essential APT packages
sudo apt install wget curl vim imwheel git-crypt direnv
# sudo apt install python-is-python3

# Install snap packages
sudo snap install starship

# Install fish https://github.com/fish-shell/fish-shell
sudo apt-add-repository ppa:fish-shell/release-3
sudo apt update
sudo apt install fish
chsh -s /usr/local/bin/fish

# Add PPA for more recent git
sudo apt-add-repository ppa:git-core/ppa
sudo apt update
sudo apt install git

# Install tldr
command -v npm && npm install -g tldr
