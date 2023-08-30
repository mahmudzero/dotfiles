#!/usr/bin/env bash

# step one, check if zsh is installed
which zsh
zsh_installed=$?

if [ $zsh_installed -ne 0 ]
then
  # if not raise an error
  echo 'Please install ZSH before continuing!'
  exit 1
fi

echo 'Setting ZSH as main shell...'
if [ $CODESPACES ]; then
	sudo chsh -s $(which zsh) $(whoami)
else
	chsh -s $(which zsh)
fi

echo 'ZSH is main shell...'

if [ ! -d "$HOME/.oh-my-zsh" ]; then
	# install oh my zsh
	sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# install powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

if [ -d "$HOME/.zshrc" ]; then
	echo "Deleting $HOME/.zshrc"
	rm -rf $HOME/.zshrc
fi
ln -s $PWD/zshrc $HOME/.zshrc

if [ -d "$HOME/.vim" ]; then
	echo "Deleting $HOME/.vim"
	rm -rf $HOME/.vim
fi
ln -s $PWD/vim $HOME/.vim

if [ -d "$HOME/.p10k.zsh" ]; then
	echo "Deleting $HOME/.p10k.zsh"
	rm -rf $HOME/.p10k.zsh
fi
ln -s $PWD/p10k.zsh $HOME/.p10k.zsh

if [ -d "$HOME/.tmux.conf" ]; then
	echo "Deleting $HOME/.tmux.conf"
	rm -rf $HOME/.tmux.conf
fi
ln -s $PWD/tmux.conf $HOME/.tmux.conf
