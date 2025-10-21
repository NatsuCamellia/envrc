#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# Install Powerlevel10k if not found
if [ ! -d "$HOME/powerlevel10k" ]; then
	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
fi

# Install Tmux Plugin Manager if not found
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

install_dotfile() {
	local filename=$1
	if [ -f "$HOME/$filename" ]; then
		mv -f "$HOME/$filename" "$HOME/$filename.backup"
		echo "Backed up $HOME/$filename to $HOME/$filename.backup"
	fi
	ln -f -s "$SCRIPT_DIR/$filename" "$HOME/$filename"
	echo "Created symbolic link $SCRIPT_DIR/$filename -> $HOME/$filename"
}

install_dotfile ".config/nvim"
install_dotfile ".p10k.zsh"
install_dotfile ".tmux.conf"

echo "Installation completed"

