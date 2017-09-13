#!/usr/bin/env bash

cp ./.vimrc ~/
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

cp ./.inputrc ~/

cp -r ./.vim ~/
