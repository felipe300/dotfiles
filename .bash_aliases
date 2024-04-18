# Alias
# Remember to add this to ".zshrc"
# Bash Aliases
#if [[ -f ~/.bash_aliases ]]; then
#  . ~/.bash_aliases
#fi

# System
alias uu='sudo apt update && sudo apt upgrade -y'
alias mkcd='mkcd_alias() { mkdir -p "$1" && cd "$1"; }; mkcd_alias'

# Zellij
# Remember to add "Nvim SWITCHER" to ".zshrc"
alias zj='zellij'
alias zjr='zellij --session rust --layout ~/dotfiles/.config/zellij/rust.kdl'
alias zjt='zellij --session ts --layout ~/dotfiles/.config/zellij/ts.kdl'

# Browser
alias brave='brave-browser </dev/null >/dev/null 2>&1 & disown'
alias fox='firefox </dev/null >/dev/null 2>&1 & disown'

# SWITCHER
alias nvim-lazy='NVIM_APPNAME=LazyVim nvim'
alias nvim-kick='NVIM_APPNAME=kickstart nvim'

# THEFUCK- correct last error in console
eval $(thefuck --alias)
eval $(thefuck --alias fk)
