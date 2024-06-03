# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

pwd=$PWD

if [[ $1 != 'skip_update' ]] && [[ -o login ]]; then
	cd ~/dotfiles
	echo "Checking for dotfiles updates..."
	git fetch
	if [[ $(git rev-parse HEAD) != $(git rev-parse @{u}) ]]; then
		echo "Found updates... updating!"
		git pull
		source ~/.zshrc 'skip_update' $pwd
	fi
fi

source ~/dotfiles/bootstrap
if [[ $2 != '' ]]; then
	cd $2
else
	cd $pwd
fi

[ -z $CODESPACES ] && [ -z $TMUX ] && exec tmux
[ -v WSLENV ] && cd $HOME
