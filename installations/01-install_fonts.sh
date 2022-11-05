#!/bin/bash
# Install fonts
# This takes a long time rn, because we clone the whole nerd font repo

# Clone repo into the main repo
cd $SCRIPTPATH
if [ -d nerd-fonts ]
then
    cd nerd-fonts/
    git pull origin master
else
    git clone --depth 1 https://github.com/ryanoasis/nerd-fonts.git
    cd nerd-fonts/
fi

chmod +x install.sh
# Install fonts of choice here
./install.sh -q FiraCode
./install.sh -q FiraMono
./install.sh -q Hack

# Other fonts/emoji stuff
doas apt install -y fonts-noto-color-emoji fonts-font-awesome
