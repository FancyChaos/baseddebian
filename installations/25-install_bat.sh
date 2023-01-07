#!/bin/bash

cd /tmp/
wget https://github.com/sharkdp/bat/releases/download/v0.22.1/bat_0.22.1_amd64.deb
sudo apt-get install -y /tmp/bat*.deb
