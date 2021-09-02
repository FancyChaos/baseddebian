#!/bin/bash

### Install fish
sudo apt install -y fish-common fish

### install oh-my-fish
cd /tmp/
curl -L github.com/oh-my-fish/oh-my-fish/raw/master/bin/install > /tmp/omf_install
chmod +x /tmp/omf_install
./omf_install --noninteractive
