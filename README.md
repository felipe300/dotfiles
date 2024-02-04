# My dotfiles

This directory contains the dotfiles for my system

## Requirements

Ensure you have the following installed on your system

### Git

Check your system installation method in [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)

```bash
sudo apt install git-all
```

### Stow

Check [GNU stow](https://www.gnu.org/software/stow/) webpage

```bash
sudo apt install stow
```

## Installation

First, check out the dotfiles repo in your $HOME directory using git

```bash
git clone git@github.com/felipe300/dotfiles.git
cd dotfiles
```

Then use GNU stow to create symlinks

```bash
stow .
```
