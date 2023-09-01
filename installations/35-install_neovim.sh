#!/bin/bash

cd /tmp/

git clone https://github.com/neovim/neovim.git
cd neovim/
git checkout tags/v0.9.1
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
