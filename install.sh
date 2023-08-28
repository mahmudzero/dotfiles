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

if [ ! -d "$HOME/.oh_my_zsh" ]; then
	# install oh my zsh
	sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# install powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

ln -s ./zshrc $HOME/.zshrc
ln -s ./vim $HOME/.vim
ln -s ./p10k.zsh $HOME/.p10k.zsh
ln -s ./tmux.conf $HOME/.tmux.conf
