function bootstrap {
	# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
	# Initialization code that may require console input (password prompts, [y/n]
	# confirmations, etc.) must go above this block; everything else may go below.
	if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
		source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
	fi

	# Path to your oh-my-zsh installation.
	export ZSH="$HOME/.oh-my-zsh"

	# Set name of the theme to load --- if set to "random", it will
	# load a random theme each time oh-my-zsh is loaded, in which case,
	# to know which specific one was loaded, run: echo $RANDOM_THEME
	# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
	ZSH_THEME="powerlevel10k/powerlevel10k"

	# Which plugins would you like to load?
	# Standard plugins can be found in $ZSH/plugins/
	# Custom plugins may be added to $ZSH_CUSTOM/plugins/
	# Example format: plugins=(rails git textmate ruby lighthouse)
	# Add wisely, as too many plugins slow down shell startup.
	plugins=(git)

	source $ZSH/oh-my-zsh.sh

	# User configuration
	export PATH="/opt/homebrew/bin:$PATH"
	export PATH="$HOME/go/bin:$PATH"

	alias code='open $1 -a Visual\ Studio\ Code'
	alias sl='ls'
	alias py='python3'
	alias python='python3'
	alias ffx='open $1 -a Firefox\ Developer\ Edition'
	alias dc='docker-compose'
	alias d='docker'
	alias v='vim'

	# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
	[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

	[[ ! -f ~/.profile ]] || source ~/.profile

	eval "$(rbenv init - zsh)"

	export NVM_DIR="$HOME/.nvm"
	[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
	[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

	set -o vi
}

if [[ $1 != 'skip_update' ]]; then
	cd ~/dotfiles
	echo "Checking for dotfiles updates..."
	git fetch
	if [[ $(git rev-parse HEAD) != $(git rev-parse @{u}) ]]; then
		echo "Found updates... updating!"
		git pull
		source ~/.zshrc 'skip_update'
	else
		bootstrap
	fi
else
	bootstrap
fi
