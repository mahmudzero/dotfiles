pwd=$PWD

if [[ $1 != 'skip_update' ]]; then
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
cd $2
