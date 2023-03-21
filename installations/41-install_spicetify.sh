#!/bin/bash

cd /tmp/

# Setup our PATH and adjust permissions for spotify
export PATH=$PATH:/home/${USER}/.spicetify
sudo chown -R ${USER}:root /usr/share/spotify/

# Download and install spicetify
curl -fsSL https://raw.githubusercontent.com/spicetify/spicetify-cli/master/install.sh | sh
# Backup spotify (Required first command)
spicetify backup apply

# Download and install spicetify marketplace
curl -fsSL https://raw.githubusercontent.com/spicetify/spicetify-marketplace/main/resources/install.sh | sh

# Install Nord-Spotify theme
curl -fsSL https://raw.githubusercontent.com/Tetrax-10/Nord-Spotify/master/install-scripts/install.sh | sh
