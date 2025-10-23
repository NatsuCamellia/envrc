# envrc

<img width="2032" height="1161" alt="Demo" src="https://github.com/user-attachments/assets/a30c43e6-5208-4c66-97d5-7f415b613de5" />

This repository contains my configurations for the following programs:

- Zsh
  - [Powerlevel10k](https://github.com/romkatv/powerlevel10k) theme
- Neovim
- Tmux

---

## Prerequisite

1. Zsh
2. Neovim (0.11.0 and later, for LSP support)
3. Tmux
4. Clangd (C language server from LLVM)
5. [ripgrep](https://github.com/BurntSushi/ripgrep), [fd](https://github.com/sharkdp/fd)
6. cc (preferably gcc)

You can install these with:

```sh
# On Ubuntu, (Neovim may not be new enough, you may need to install it from tarball manually)
sudo apt install zsh neovim tmux clangd ripgrep fd-find gcc

# On macOS (I'm not sure if the built-in clang works, but I use gcc)
brew install neovim tmux ripgrep fd
```

You also need a [Nerd font](https://www.nerdfonts.com), among which I recommend that of JetBrains Mono.

## Installation

For Zsh, add the following to `~/.zshrc`:

```
source <repo_path>/.zshrc
```

For the remaining, run:

```
./install.sh
```

For Tmux, press `<C-Space> I` when you first run Tmux to install the plugins.

---

## Zsh and Powerlevel10k Theme

### `.zshrc`

The Zsh config for p10k is in `.zshrc`. Since every computer generally needs specific configs for Zsh, it is recommended to source the `.zshrc` from this repository in your `~/.zshrc`, instead of modify this file directory. But it's fine if you don't want to synchronize your `.zshrc` with that of this repository.

```
# ~/.zshrc
source <repo_path>/.zshrc
```

### Powerlevel10k

The `install.sh` will install p10k at `~/powerlevel10k` and then sourced in `.zshrc`. Then `.zshrc` reads `.p10k.zsh` to load p10k config.

## Neovim

The config is in `.config/nvim`.

Some plugins need newer version of Neovim, which may not be the default on some servers. But you can go to the Neovim GitHub, download the tarball and extract them to some place. Then add the `bin/` directory in the extracted `nvim` to your `$PATH`.

## Notes and Problems

### Clangd on aarch64 Ubuntu

On aarch64 Ubuntu, Mason is unable to install `clangd` automatically. We have to install it manually and trick Mason:

```
ln -s <path-to-clangd> ~/.local/share/nvim/mason/bin/clangd
mkdir ~/.local/share/nvim/mason/packages/clangd
```

### Setup Clangd for Linux Source Code

```
yes "" | make defconfig
yes "" | make CC=clang -j$(nproc)
python3 scripts/clang-tools/gen_compile_commands.py
```

### Synchronized Clipboard between Neovim and OS

When you yank text in Neovim, the text will go into your system clipboard **if your terminal supports OSC52**.

#### (Not Solved) Current Clipboard Problems

The current clipboard support, by **system**, I mean the **local system**:

- Neovim Only
  - 👍 Yank to system (Neovim yank)
  - 👍 Paste from system (Neovim paste)
- Neovim inside Tmux
  - 👍 Yank to system (Neovim yank)
  - 😢 Paste from system (Neovim paste)
 
When we run Neovim directly, Neovim interact with the shell and can access the system clipboard directly. However, when we run Neovim inside Tmux, Neovim accesses Tmux's clipboard, but Tmux doesn't fetch system clipboard. So the pasted content would be what Neovim yanked last time.

The current solution is to paste with `C-V` directly.

#### Get OSC52 Clipboard Support On macOS

Sadly, our beloved macOS Terminal.app doesn't support this, and there are two workarounds:
1. Use [iTerm2](https://iterm2.com), which supports OSC52. (I tried iTerm2 and found it's good in terms of modern functionalities.)
2. Run Zsh/Tmux inside [osc52pty](https://github.com/roy2220/osc52pty). After installation, open Terminal.app settings, in Profiles > Shell, add `osc52pty tmux` (`tmux` can be replaced with `zsh`, etc.) to "Run command".

### Ubuntu: python3 failed with exit code 1 and signal 0.

```
sudo apt install python3-venv
```
