# NOTE:Alias
# Remember to add this to ".zshrc"
# Bash Aliases
#if [[ -f ~/.bash_aliases ]]; then
#  . ~/.bash_aliases
#fi

export EZA_FLAGS="--color=always --git --icons=always --no-filesize --no-time --no-user --no-permissions"

# NOTE:System
alias uu='sudo apt update && sudo apt upgrade -y'
alias mkcd='mkcd_alias() { mkdir -p "$1" && cd "$1"; }; mkcd_alias'
alias c='clear'
alias v='nvim'

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
alias kvim='NVIM_APPNAME=kickstart nvim'

# NOTE: eza
alias ls="eza $EZA_FLAGS"
alias ll="eza --long $EZA_FLAGS"
alias lt="eza --tree --level=2 --long --icons $EZA_FLAGS"

# NOTE: fzf "interactive nvim search"
alias inv='nvim $(fzf -m --preview="bat --color=always {}")'

# NOTE: nvim sudo - allows to edit files with no permissions
alias nvsu="sudoedit nvim"

# NOTE: Curl
alias pm="curl http://wttr.in/puerto-montt"
