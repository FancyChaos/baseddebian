#!/bin/bash

cd /tmp/

git clone https://github.com/neovim/neovim.git
cd neovim/
git checkout tags/v0.8.2
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install

cd /tmp/

### Install neovim plugins
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
pip3 install --user neovim || pip install --user neovim

mkdir -p $HOME/.config/nvim/plugged/ || true

nvim -c PlugInstall -c UpdateRemotePlugins -c quitall
