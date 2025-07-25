# Oh My Zsh.
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="sunaku-custom"
plugins=(git)
source $ZSH/oh-my-zsh.sh

# My configuration.
alias ls="lsd --icon never"
alias python3="python3.13"

[ -f "/Users/leonelflores/.ghcup/env" ] && . "/Users/leonelflores/.ghcup/env" # ghcup-env