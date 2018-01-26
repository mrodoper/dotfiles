#!/usr/bin/env bash

echo "Installing the needed ubuntu packages"
# install needed packages
sudo apt-get install vim
sudo apt-get install cscope
sudo apt-get install build-essential cmake
sudo apt-get install python-dev python3-dev
sudo apt-get install tmux
sudo apt-get install --assume-yes xclip
sudo apt-get install silversearcher-ag
sudo apt-get install tree

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
