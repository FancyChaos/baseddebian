#!/bin/bash

### Install newest fixed version of libxft
### No idea if I've done this right but it works
echo "Installing libxft..."
chmod +x installations/install_libxft.sh 
bash installations/install_libxft.sh 
echo "Installed: libxft"

### Install dwm
echo "Installing dwm..."
chmod +x installations/install_dwm.sh
bash installations/install_dwm.sh
echo "Installed: dwm"

### Install st
echo "Installing st..."
chmod +x installations/install_st.sh
bash installations/install_st.sh
echo "Installed: st"

### Install dwmblocks
echo "Installing dwblocks..."
chmod +x installations/install_dwmblocks.sh
bash installations/install_dwmblocks.sh
echo "Installed: dwblocks"

### Install zsh
echo "Installing zsh..."
chmod +x installations/install_zsh.sh
bash installations/install_zsh.sh
echo "Installed: zsh"

### Install bat
echo "Installing bat..."
chmod +x installations/install_bat.sh
bash installations/install_bat.sh
echo "Installed: bat"

### Install logo-ls
echo "Installing logo-ls..."
chmod +x installations/install_logo-ls.sh
bash installations/install_logo-ls.sh
echo "Installed: logo-ls"

### Install neovim
echo "Installing neovim..."
chmod +x installations/install_neovim.sh
bash installations/install_neovim.sh
echo "Installed: neovim"

### Install fonts
echo "Installing fonts..."
chmod +x installations/install_fonts.sh
bash installations/install_fonts.sh
echo "Installed: fonts"
