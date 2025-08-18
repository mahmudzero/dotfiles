if [ -d "$HOME/.vim" ]; then
	echo "Deleting $HOME/.vim"
	rm -rf $HOME/.vim
fi
ln -s $PWD/vim $HOME/.vim
