#!/bin/bash

# Install zsh
sudo apt install zsh -y

### Cant manage to install oh my zsh automatically, dont care for now
# Install oh my zsh
#export CHSH=yes
#export RUNZSH=no
#sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Set zsh as default shell (Also set SHELL in .xinitrc)
sudo chsh -s $(which zsh)
