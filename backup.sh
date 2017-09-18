#!/usr/bin/env bash

# backup vim
cp ~/.vimrc ./
mkdir -p ./.vim
cp -r ~/.vim/plugin ./.vim
cp -r ~/.vim/ftplugin ./.vim
cp ~/.ycm_extra_conf.py ./

# backup tmux
cp ~/.tmux.conf ./
cp -r ~/.tmux ./

# backup others
cp ~/.inputrc ./
