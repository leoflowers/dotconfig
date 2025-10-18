# Oh My Zsh.
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="sunaku-custom"
plugins=(git)
source $ZSH/oh-my-zsh.sh

# My configuration.
alias ls="lsd --icon never"

[ -f "/Users/leonelflores/.ghcup/env" ] && . "/Users/leonelflores/.ghcup/env" # ghcup-env

# conda stuff
if [[ `uname` == "Darwin" ]]; then
	__conda_setup="$('/opt/homebrew/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
	if [ $? -eq 0 ]; then
	    eval "$__conda_setup"
	else
	    if [ -f "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
	        . "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh"
	    else
	        export PATH="/opt/homebrew/Caskroom/miniconda/base/bin:$PATH"
	    fi
	fi
	unset __conda_setup
else
	__conda_setup="$('/usr/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
	if [ $? -eq 0 ]; then
	    eval "$__conda_setup"
	else
	    if [ -f "/usr/etc/profile.d/conda.sh" ]; then
	# . "/usr/etc/profile.d/conda.sh"  # commented out by conda initialize
	    else
	        export PATH="/usr/bin:$PATH"
	    fi
	fi
	unset __conda_setup
fi

conda activate ldf
