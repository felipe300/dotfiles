# NOTE:History
HISTFILE="$XDG_STATE_HOME/zsh/history"
HISTSIZE=100000
SAVEHIST=100000

setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS

# NOTE: NVIM
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

export ZSH="$HOME/.oh-my-zsh"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting web-search terraform vi-mode)

source $ZSH/oh-my-zsh.sh

# NOTE: User configuration

# NOTE: DENO
export DENO_INSTALL="/home/pipo/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# NOTE: pnpm
export PNPM_HOME="/home/pipo/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"

# NOTE: BUN
# bun completions
[ -s "/home/pipo/.bun/_bun" ] && source "/home/pipo/.bun/_bun"
# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# NOTE: Nvim Switcher
function nvims() {
  items=("default" "Kickstart" "LazyVim")
  config=$(printf "%s\n" "${items[@]}" | fzf --prompt=" Neovim Config  " --height=50% --layout=reverse --border --exit-0)
  if [[ -z $config ]]; then
    echo "Nothing selected"
    return 0
  elif [[ $config == "default" ]]; then
    config=""
  fi
  NVIM_APPNAME=$config nvim $@
}

# NOTE: Lazy Switcher bindkey
bindkey -s ^a "nvims\n"

# NOTE: Bash Aliases
if [[ -f ~/.bash_aliases ]]; then
  . ~/.bash_aliases
fi

# NOTE: fzf, install -> "Using git"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPS="--extended"

# -- Use fd instead of fzf --
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

# PREVIEW
show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"

export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

# Advanced customization of fzf options via _fzf_comprun function
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo ${}'"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "$show_file_or_dir_preview" "$@" ;;
  esac
}

# NOTE: bat theme
# check "josean page" https://www.josean.com/posts/7-amazing-cli-tools
export BAT_THEME=tokyonight_night

# NOTE: zoxide
eval "$(zoxide init --cmd cd zsh)"

# NOTE: GO path
export PATH=$PATH:/usr/local/go/bin

# NOTE: set Editor
export EDITOR=nvim

# NOTE: FNM
FNM_PATH="/home/pipo/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/home/pipo/.local/share/fnm:$PATH"
  # eval "`fnm env`"
fi

eval "$(fnm env --use-on-cd --shell zsh)"

# jmeter -java
export PATH=$PATH:/opt/jmeter/apache-jmeter-5.6.3/bin

# NOTE: Terraform autocompletion
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/terraform terraform

# Created by `pipx` on 2026-03-08 01:49:40
export PATH="$PATH:/home/pipo/.local/bin"

# NOTE: Starship
export STARSHIP_CONFIG=~/.config/starship.toml
eval "$(starship init zsh)"

# Use native Zsh line editor widgets to search history safely
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# Bind Arrow Keys so they don't break autocomplete or suggestion highlights
bindkey '\e[A' up-line-or-beginning-search   # Arrow Up: search history matching prefix
bindkey '\e[B' down-line-or-beginning-search # Arrow Down: search history matching prefix

# Map Home & End keys properly for Kitty, Tmux, and standard terms
typeset -g -A key
key[Home]="${terminfo[khome]:-\e[H}"
key[End]="${terminfo[kend]:-\e[F}"

# Fallback escape sequences
[[ "${key[Home]}" == "" ]] && key[Home]="\eOH"
[[ "${key[End]}" == "" ]] && key[End]="\eOF"

# Bind Home & End keys to actually move the cursor instead of searching history
[[ -n "${key[Home]}" ]] && bindkey "${key[Home]}" beginning-of-line
[[ -n "${key[End]}" ]]  && bindkey "${key[End]}"  end-of-line

# Zsh-autosuggestions tweak: Press Control + Space to accept a ghost text suggestion
bindkey '^ ' autosuggest-accept
