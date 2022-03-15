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
chsh -s $(which zsh)

echo 'ZSH is main shell...'

# install oh my zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

ln -s ./zshrc ~/.zshrc
ln -s ./vim ~/.vim
ln p10k.zsh ~/.p10k.zsh
