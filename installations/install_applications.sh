#!/bin/bash

### Install dwm
echo "Installing FancyChao's custom dwm..."
chmod +x installations/install_dwm.sh
bash installations/install_dwm.sh
echo "Installed: dwm"

### Install st
echo "Installing FancyChao's custom st..."
chmod +x installations/install_st.sh
bash installations/install_st.sh
echo "Installed: st"

### Install fish shell
echo "Installing fish and omf..."
chmod +x installations/install_fish.sh
bash installations/install_fish.sh
echo "Installed: fish and omf..."

### Install bat
echo "Installing bat..."
chmod +x installations/install_bat.sh
bash installations/install_bat.sh
echo "Installed: bat"

### Install neovim
echo "Installing neovim..."
chmod +x installations/install_neovim.sh
bash installations/install_neovim.sh
echo "Installed: neovim"