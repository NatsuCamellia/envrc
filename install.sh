#!/bin/bash

# Define the paths to the original files
vimrc_path=".vimrc"
p10k_path=".p10k.zsh"

echo "Backing up existing files"
# Create backups of existing files (if any)
if [ -f "$HOME/$vimrc_path" ]; then
    mv -f "$HOME/$vimrc_path" "$HOME/$vimrc_path.backup"
    echo "Backed up $HOME/$vimrc_path to $HOME/$vimrc_path.backup"
fi

if [ -f "$HOME/$p10k_path" ]; then
    mv -f "$HOME/$p10k_path" "$HOME/$p10k_path.backup"
    echo "Backed up $HOME/$p10k_path to $HOME/$p10k_path.backup"
fi

# Create symbolic links to the original files
echo "Creating symbolic links"
ln -f -s "$(pwd)/$vimrc_path" "$HOME/$vimrc_path"
ln -f -s "$(pwd)/$p10k_path" "$HOME/$p10k_path"

echo "Installation complete"
