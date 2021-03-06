#!/usr/bin/env bash

set -ex

setup_qemu()
{
	read -p "Do you want to setup QEMU (y/n)? " answer
	case ${answer:0:1} in
		y|Y )
			sudo apt-get install qemu-kvm qemu virt-manager virt-viewer libvirt-bin
			;;
		* )
			echo "Skipping QEMU setup"
			;;
	esac
}

echo "Installing the needed ubuntu packages"
# install needed packages
sudo apt-get update
sudo apt-get -y install vim-gnome
sudo apt-get -y install cscope
sudo apt-get -y install build-essential cmake
sudo apt-get -y install python-dev python3-dev
sudo apt-get -y install --assume-yes xclip
sudo apt-get -y install silversearcher-ag
sudo apt-get -y install tree
sudo apt-get -y install zsh
sudo apt-get -y install curl
sudo apt-get -y install libevent-dev
sudo apt-get -y install ncurses-dev
sudo apt-get -y install wget
sudo apt-get -y install htop

# setup virtualenv for python
sudo apt-get -y install python3-pip
pip3 install virtualenv --user
pip3 install virtualenvwrapper --user

echo "Setting up ZSH"
chsh -s /bin/zsh
cp ./.zshrc ~/

echo "Setting up FZF"
if [ ! -d ~/.fzf ]; then
	echo "Cloning FZF repo"
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
else
	echo "Skip cloning FZF repo, since it already exists. Instead pull"
	pushd ~/.fzf
  git pull
	popd
fi
~/.fzf/install --all

echo "Setting up oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "Setting up VIM"
# setup vim
cp ./.vimrc ~/
mkdir -p ~/tmp
if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
	echo "Cloning Vundle repo"
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
else
	echo "Skip cloning Vundle repo, since it already exists. Instead pull"
	pushd ~/.vim/bundle/Vundle.vim
  git pull
	popd
fi
vim +PluginInstall +qall

~/.vim/bundle/YouCompleteMe/install.py --clang-completer

cp ./.ycm_extra_conf.py ~/

cp -r ./.vim ~/

echo "Setting up TMUX"
# download tmux
TMUX_VERSION=2.6
wget https://github.com/tmux/tmux/releases/download/${TMUX_VERSION}/tmux-${TMUX_VERSION}.tar.gz
tar xf tmux-${TMUX_VERSION}.tar.gz
rm -f tmux-${TMUX_VERSION}.tar.gz
# compile and install tmux
cd tmux-${TMUX_VERSION}
./configure
make
sudo make install
cd -
sudo rm -rf ./tmux-${TMUX_VERSION}
# setup tmux
cp ./.tmux.conf ~/
cp -r ./.tmux ~/
if [ ! -L /usr/bin/tvim ]; then
	sudo ln -s ~/.tmux/tvim /usr/bin/tvim
fi

echo "Setting up others (inputrc, git, ...)"
# setup others
cp ./.inputrc ~/
cp ./.gitconfig ~/
cp ./.gitignore_global ~/

echo "Make sure the git config has the correct user.name and email"
echo "You need to restart your computer to activate ZSH"

setup_qemu
