#!/bin/bash

cd /tmp/

### Install neovim v.0.5.0
git clone https://github.com/neovim/neovim.git
cd neovim/
git checkout tags/v0.6.1
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install

cd /tmp/

### Install neovim plugins
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
pip3 install --user neovim

mkdir -p $HOME/.config/nvim/plugged/ || true

nvim -c PlugInstall -c UpdateRemotePlugins -c quitall
