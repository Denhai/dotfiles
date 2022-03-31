#!/bin/bash

# Make sure container folders exist
mkdir -p ~/.config ~/.ipython/profile_default

FILES_TO_SYMLINK=".gitignore_global .gitconfig .vimrc .tmux.conf .imwheelrc .sqliterc .psqlrc .ipython/profile_default/ipython_config.py .bashrc .bash_aliases .bash_profile .inputrc"

for i in $FILES_TO_SYMLINK; do
    # -n don't follow symlinks whem making them (helpful when replacing links to directories)
    ln -snv ~/dotfiles/$i ~/$i
done

# These are different because they don't symlink into the root of the home folder
ln -snv ~/dotfiles/ssh_config ~/.ssh/config
ln -snv ~/dotfiles/fish ~/.config/fish
ln -snv ~/dotfiles/starship.toml ~/.config/starship.toml

# imwheel systemd service
mkdir -p ~/.config/systemd/user
ln -snv ~/dotfiles/imwheel.service ~/.config/systemd/user/imwheel.service
systemctl --user daemon-reload
systemctl --user enable --now imwheel.service
# journalctl --user --unit imwheel.service

# Install fzf (this adds files to ~/.config/fish/functions)
./fzf/install --key-bindings --completion --all

# Symlink bass
ln -snv ~/dotfiles/fish/bass/functions/__bass.py ~/.config/fish/functions
ln -snv ~/dotfiles/fish/bass/functions/bass.fish ~/.config/fish/functions
ln -snv ~/dotfiles/fish/z/functions/__z.fish ~/.config/fish/functions
