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

pwd=$PWD

cd ~/dotfiles
echo "Checking for dotfiles updates..."
git fetch
if [[ $(git rev-parse HEAD) != $(git rev-parse @{u}) ]]; then
	echo "Found updates... updating!"
	if test -z $(git diff $(git rev-parse @{u}) --name-only | grep zshrc); then
		echo "Found updates to base .zshrc... please source \$HOME/.zshrc to get latest updates"
	fi
	git pull
fi

source ~/dotfiles/bootstrap
cd $pwd

[ -z $CODESPACES ] && [ -z $TMUX ] && exec tmux
[ -v WSLENV ] && cd $HOME
