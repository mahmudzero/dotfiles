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
