# Oh My Zsh.
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="sunaku-custom"
plugins=(git)
source $ZSH/oh-my-zsh.sh

# My configuration.
alias ls="lsd --icon never"
alias python3="python3.13"

[ -f "/Users/leonelflores/.ghcup/env" ] && . "/Users/leonelflores/.ghcup/env" # ghcup-env

# conda stuff
__conda_setup="$('/usr/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/etc/profile.d/conda.sh" ]; then
        . "/usr/etc/profile.d/conda.sh"
    else
        export PATH="/usr/bin:$PATH"
    fi
fi
unset __conda_setup

# do after dotconfig is installed
conda activate ldf
