#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# Install Powerlevel10k if not found
if [ ! -d "$HOME/powerlevel10k" ]; then
	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
fi

# Define the paths to the original files
nvim_path=".config/nvim"
p10k_path=".p10k.zsh"

if [ -f "$HOME/$p10k_path" ]; then
	mv -f "$HOME/$p10k_path" "$HOME/$p10k_path.backup"
	echo "Backed up $HOME/$p10k_path to $HOME/$p10k_path.backup"
fi

if [ -d "$HOME/$nvim_path" ]; then
	mv -f "$HOME/$nvim_path" "$HOME/$nvim_path.backup"
	echo "Backed up $HOME/$nvim_path to $HOME/$nvim_path.backup"
fi

# Create symbolic links to the original files
echo "Creating symbolic links"
ln -f -s "$SCRIPT_DIR/$p10k_path" "$HOME/$p10k_path"
ln -f -s "$SCRIPT_DIR/$nvim_path" "$HOME/$nvim_path"

echo "Installation complete"

