#!/usr/bin/env bash

type zsh &>/dev/null
if [ $? -ne 0 ]; then
	# if not raise an error
	echo "please install zsh"
	exit 1
fi

type fzy &>/dev/null
if [ $? -ne 0 ]; then
	echo "please install fzy"
	exit 1
fi

type tmux &>/dev/null
if [ $? -ne 0 ]; then
	echo "please install tmux"
	exit 1
fi

type vim &>/dev/null
if [ $? -ne 0 ]; then
	echo "please install vim"
	exit 1
fi

type nvim &>/dev/null
if [ $? -ne 0 ]; then
	echo "please install nvim"
	exit 1
fi

type rg &>/dev/null
if [ $? -ne 0 ]; then
	echo "please install ripgrep"
	exit 1
fi

echo "Setting ZSH as main shell..."
echo $SHELL | grep zsh
zsh_def=$?
if [ $zsh_def -ne 0 ]; then
	if [ $CODESPACES ]; then
		sudo chsh -s $(which zsh) $(whoami)
	else
		chsh -s $(which zsh)
	fi
fi
echo "ZSH is main shell..."

if [ ! -d "$HOME/.oh-my-zsh" ]; then
	# install oh my zsh
	sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# install powerlevel10k
plvl10k_dir="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
if [ -d $plvl10k_dir ]; then
	echo "Deleting powerlevel10k"
	rm -rf $plvl10k_dir
fi
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $plvl10k_dir

if [ -f "$HOME/.p10k.zsh" ]; then
	echo "Deleting $HOME/.p10k.zsh"
	rm -rf $HOME/.p10k.zsh
fi
ln -s $PWD/p10k.zsh $HOME/.p10k.zsh

packer_dir="$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim"
if [ -d $packer_dir ]; then
	echo "Deleting $packer_dir"
	rm -rf $packer_dir
fi
git clone --depth 1 https://github.com/wbthomason/packer.nvim $packer_dir

if [ -d "$HOME/.config/nvim" ]; then
	echo "Deleting $HOME/.config/nvim"
	rm -rf $HOME/.config/nvim
fi
mkdir -p $HOME/.config
ln -s $PWD/nvim $HOME/.config/nvim

if [ -f "$HOME/.zshrc" ]; then
	echo "Deleting $HOME/.zshrc"
	rm -rf $HOME/.zshrc
fi
ln -s $PWD/zshrc $HOME/.zshrc

if [ -d "$HOME/.vim" ]; then
	echo "Deleting $HOME/.vim"
	rm -rf $HOME/.vim
fi
ln -s $PWD/vim $HOME/.vim

if [ -f "$HOME/.tmux.conf" ]; then
	echo "Deleting $HOME/.tmux.conf"
	rm -rf $HOME/.tmux.conf
fi
ln -s $PWD/tmux.conf $HOME/.tmux.conf

if [ -f "$HOME/.gitconfig" ]; then
	echo "Deleting $HOME/.gitconfig"
	rm -rf $HOME/.gitconfig
fi
ln -s $PWD/.gitconfig $HOME/.gitconfig

if [ -d "$HOME/.config/zed" ]; then
	echo "Deleting $HOME/.config/zed"
	rm -rf $HOME/.config/zed
fi
ln -s $PWD/zed/zed $HOME/.config/zed
