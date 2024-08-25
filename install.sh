#!/bin/bash

# Define the paths to the original files
zshrc_path=".zshrc"
vimrc_path=".vimrc"

echo "Backing up existing files"
# Create backups of existing files (if any)
if [ -f "$HOME/.zshrc" ]; then
    rm -f "$HOME/.zshrc.backup"
    mv -f "$HOME/.zshrc" "$HOME/.zshrc.backup"
    echo "Backed up $HOME/.zshrc to $HOME/.zshrc.backup"
fi

if [ -f "$HOME/.vimrc" ]; then
    rm -f "$HOME/.vimrc.backup"
    mv -f "$HOME/.vimrc" "$HOME/.vimrc.backup"
    echo "Backed up $HOME/.vimrc to $HOME/.vimrc.backup"
fi

# Create symbolic links to the original files
echo "Creating symbolic links"
ln "$zshrc_path" "$HOME/.zshrc"
ln "$vimrc_path" "$HOME/.vimrc"

echo "Installation complete"