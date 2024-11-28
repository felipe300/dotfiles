# NOTE:Alias
# Remember to add this to ".zshrc"
# Bash Aliases
#if [[ -f ~/.bash_aliases ]]; then
#  . ~/.bash_aliases
#fi

# NOTE:System
alias uu='sudo apt update && sudo apt upgrade -y'
alias mkcd='mkcd_alias() { mkdir -p "$1" && cd "$1"; }; mkcd_alias'

# NOTE: Zellij
# Remember to add "Nvim SWITCHER" to ".zshrc"
alias zj='zellij'
alias zjr='zellij --session rust --layout ~/dotfiles/.config/zellij/rust.kdl'
alias zjt='zellij --session ts --layout ~/dotfiles/.config/zellij/ts.kdl'

# NOTE: Browser
alias brave='brave-browser </dev/null >/dev/null 2>&1 & disown'
alias incognito='brave-browser --incognito </dev/null >/dev/null 2>&1 & disown'
alias fox='firefox </dev/null >/dev/null 2>&1 & disown'

# NOTE:SWITCHER
alias nvim-lazy='NVIM_APPNAME=LazyVim nvim'
alias kvim='NVIM_APPNAME=Kickstart nvim'

# NOTE: THEFUCK- correct last error in console
eval $(thefuck --alias)
eval $(thefuck --alias fk)

# NOTE: eza
alias ls="eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions"
alias lt="eza --tree --level=2 --long --icons --git --no-filesize --icons=always --no-time --no-user --no-permissions"

# NOTE: fzf "interactive nvim search"
alias inv='nvim $(fzf -m --preview="bat --color=always {}")'
