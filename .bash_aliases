# Alias
# Remember to add this to ".zshrc"
# Bash Aliases
#if [[ -f ~/.bash_aliases ]]; then
#  . ~/.bash_aliases
#fi

# Zellij
# Remember to add "Nvim SWITCHER" to ".zshrc"
alias zj="zellij"
alias zjr="zellij --session rust --layout ~/dotfiles/.config/zellij/default_rust.kdl"
alias zjt="zellij --session ts --layout ~/dotfiles/.config/zellij/default_ts.kdl"

# Browser
alias brave="brave-browser </dev/null >/dev/null 2>&1 & disown"
alias firefox="firefox </dev/null >/dev/null 2>&1 & disown"

# SWITCHER
alias nvim-lazy="NVIM_APPNAME=LazyVim nvim"
alias nvim-kick="NVIM_APPNAME=kickstart nvim"
