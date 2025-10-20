# Zsh and Environment Run Commands

This repository contains my configurations for Zsh and other tools. You can install all of them except for `.zshrc` with:

```sh
$ ./install.sh
```

## Zsh and Powerlevel10k Theme

### `.zshrc`

The Zsh config for p10k is in `.zshrc`. Since every computer generally needs specific configs for Zsh, it is recommended to source the `.zshrc` from this repository in your `~/.zshrc`, instead of modify this file directory. But it's fine if you don't want to synchronize your `.zshrc` with that of this repository.

```
# ~/.zshrc
source $repo/.zshrc
```

### Powerlevel10k

The `install.sh` will install p10k at `~/powerlevel10k` and then sourced in `.zshrc`. Then `.zshrc` reads `.p10k.zsh` to load p10k config.

## Neovim

The config is in `.config/nvim`. The config assumes you use a NERD font in your terminal, tofus appear if you don't install a NERD font.

Some plugins need newer version of Neovim, which may not be the default on some servers. But you can go to the Neovim GitHub, download the tarball and extract them to your home directory. Then run `~/bin/nvim` when you want to use Neovim. As a tip, you can add `~/bin` to your `$PATH`.

### Clangd LSP

**Installing `clangd`**: On **aarch64 Ubuntu**, Mason is unable to install `clangd` automatically. We have to install it manually and trick Mason:

```
$ ln -s ~/opt/LLVM-21.1.0-Linux-ARM64/bin/clangd ~/.local/share/nvim/mason/bin/clangd
$ mkdir ~/.local/share/nvim/mason/packages/clangd
```

**Setup `clangd` for Linux kernel**: 

1. Install `NatsuCamellia/envrc` to get Neovim config
2. `yes "" | make defconfig`
3. `yes "" | make CC=/home/cqwang/opt/LLVM-21.1.0-Linux-ARM64/bin/clang -j$(nproc)`
4. `python3 scripts/clang-tools/gen_compile_commands.py`
