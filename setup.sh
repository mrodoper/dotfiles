#!/usr/bin/env bash

sudo apt-get install vim
sudo apt-get install cscope
sudo apt-get install build-essential cmake
sudo apt-get install python-dev python3-dev

cp ./.vimrc ~/
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

~/.vim/bundle/YouCompleteMe/install.py --clang-completer

cp ./.inputrc ~/
cp ./.ycm_extra_conf.py ~/

cp -r ./.vim ~/
