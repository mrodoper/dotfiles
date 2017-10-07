#!/usr/bin/env bash

echo "Backing up VIM"
# backup vim
cp ~/.vimrc ./
mkdir -p ./.vim
cp -r ~/.vim/plugin ./.vim
cp -r ~/.vim/ftplugin ./.vim
cp ~/.ycm_extra_conf.py ./

echo "Backing up TMUX"
# backup tmux
cp ~/.tmux.conf ./
cp -r ~/.tmux ./

echo "Backing up others (inputrc, git, ...)"
# backup others
cp ~/.inputrc ./
cp ~/.gitconfig ./
cp ~/.gitignore_global ./
