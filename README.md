# My Dotfiles

This repository contains my personal configuration files (dotfiles) for development on **Pop!\_OS / Ubuntu**. It uses **GNU Stow** to manage symlinks cleanly.

## Requirements & Toolchain

Ensure you have the following core utilities installed on your system before deploying the dotfiles.

**Terminal & Multiplexers**

- **Kitty**: Fast, feature-rich, GPU-based terminal emulator.

```bash
sudo apt install kitty
```

- **Tmux**: Terminal multiplexer for workspace persistence.

```bash
sudo apt install tmux
```

- **Zellij**: A modern, layout-driven workspace alternative to Tmux.

```bash
language
```

**Core Utilities & Shell Enhancements**

- **GNU Stow**: Symlink manager used to deploy these dotfiles.

```bash
sudo apt install stow
```

- **Starship**: The minimal, blazing-fast, and customizable prompt.
- **FNM**: Fast Node Manager for managing Node/TypeScript runtimes.
- **FZF**: Command-line fuzzy finder.

**File Managers & CLI Tools**

- **Yazi**: Blazing-fast terminal file manager written in Rust.
- **Bat**: A `cat` clone with syntax highlighting (`tokyonight_night`).
- **Eza**: A modern alternative to `ls`.

## Post-Installation Configurations

**Use Neovim inside Yazi**

If Yazi opens files with standard `vi` instead of your custom Neovim configurations, update your `~/.config/yazi/yazi.toml` file to point directly to `nvim`:

```toml
[opener]
edit = [
  { run = 'nvim "$@"', desc = "Neovim", block = true, for = "unix" },
]
```

**Neovim Configuration Switcher**

The Zsh configuration includes an automated profile picker for Neovim setups (Default, Kickstart, LazyVim).

- Trigger it inside your terminal by pressing: `Ctrl + A`

## Installation & Deployment

1. Clone the repository directly into your `$HOME` directory:

```bash
cd ~
git clone git@github.com:felipe300/dotfiles.git
cd dotfiles
```

2. Deploy configurations using GNU Stow:

```bash
stow .
```

3. In case of conflicts (e.g., if default Zellij or terminal config files already exist), force Stow to adopt your existing environment system state into the symlinks:

```bash
stow --adopt .
```
