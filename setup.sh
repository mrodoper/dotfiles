#!/usr/bin/env bash

echo "Installing the needed ubuntu packages"
# install needed packages
sudo apt-get update
sudo apt-get -y install vim-gnome
sudo apt-get -y install cscope
sudo apt-get -y install build-essential cmake
sudo apt-get -y install python-dev python3-dev
sudo apt-get -y install tmux
sudo apt-get -y install --assume-yes xclip
sudo apt-get -y install silversearcher-ag
sudo apt-get -y install tree
sudo apt-get -y install zsh

echo "Setting up ZSH"
chsh -s /bin/zsh
cp ./.zshrc ~/

echo "Setting up VIM"
# setup vim
cp ./.vimrc ~/
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

~/.vim/bundle/YouCompleteMe/install.py --clang-completer

cp ./.ycm_extra_conf.py ~/

cp -r ./.vim ~/

echo "Setting up TMUX"
# setup tmux
cp ./.tmux.conf ~/
cp -r ./.tmux ~/
sudo ln -s ~/.tmux/tvim /usr/bin/tvim

echo "Setting up others (inputrc, git, ...)"
# setup others
cp ./.inputrc ~/
cp ./.gitconfig ~/
cp ./.gitignore_global ~/

echo "Make sure the git config has the correct user.name and email"
echo "You need to restart your computer to activate ZSH"
