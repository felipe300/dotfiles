# My dotfiles

This directory contains the dotfiles for my system

## Requirements

Ensure you have the following installed on your system

### Git

Check your system installation method in [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)

```bash
sudo apt install git-all
```

### Tmux

Check your system installation method in [Tmux](https://github.com/tmux/tmux)

```bash
apt install tmux
```

### Kitty

Check [Kitty](https://sw.kovidgoyal.net/kitty/) webpage, I use this [webpage](https://linux.how2shout.com/how-to-install-kitty-terminal-on-ubuntu-22-04-or-20-04/) to install kitty for `PopOS`

```bash
sudo apt install kitty
```

### Yazi

Check [Yazi](https://yazi-rs.github.io/) webpage, I use this [webpage](https://lindevs.com/install-yazi-on-ubuntu) to install kitty for `PopOS`

#### Use your `nvim conf` in Yazi

In case you open a file in yazi and you `config` do not open check your `yazi.toml` file in `~/.confi/yazi` and change

```
...

[opener]
edit = [
  { run = '${EDITOR:=vi} "$@"', desc = "$EDITOR", block = true, for = "unix" },
  // FOR
	{ run = 'nvim "$@"', desc = "$EDITOR", block = true, for = "unix" },
...
```

### Zellij

Check [Zellij](https://zellij.dev/) webpage

```bash
cargo install --locked zellij
```

### Stow

Check [GNU stow](https://www.gnu.org/software/stow/) webpage

```bash
sudo apt install stow
```

## Installation

First, check out the dotfiles `repo` in your $HOME directory using git

```bash
git clone git@github.com/felipe300/dotfiles.git
cd dotfiles
```

Then use GNU stow to create symlinks

```bash
stow .
```

In case of problems to create zellij symlinks

```bash
stow --adpot .
```
