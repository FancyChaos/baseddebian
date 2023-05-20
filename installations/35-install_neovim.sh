#!/bin/bash

cd /tmp/

git clone https://github.com/neovim/neovim.git
cd neovim/
git checkout tags/v0.9.0
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install

cd /tmp/

### Install neovim plugins
pip3 install --user neovim || pip install --user neovim


# Install lazyvim
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak

git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git

# Set shiftwidth to 4
cat <<EOF >> ~/.config/nvim/lua/config/options.lua
local opt = vim.opt
opt.shiftwidth = 4
EOF
