#!/bin/bash

cd /tmp/

# Setup our PATH and adjust permissions for spotify
export PATH=$PATH:/home/${USER}/.spicetify
chown -R ${USER}:root /usr/share/spotify/

# Download and install spicetify
curl -fsSL https://raw.githubusercontent.com/spicetify/spicetify-cli/master/install.sh | sh
curl -fsSL https://raw.githubusercontent.com/spicetify/spicetify-marketplace/main/resources/install.sh | sh

# Install chosen theme
curl -fsSL https://raw.githubusercontent.com/Tetrax-10/Nord-Spotify/master/install-scripts/install.sh | sh
#curl -fsSL https://raw.githubusercontent.com/NYRI4/Comfy-spicetify/main/install.sh | sh
