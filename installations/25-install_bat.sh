#!/bin/bash

cd /tmp/
wget https://github.com/sharkdp/bat/releases/download/v0.23.0/bat_0.23.0_amd64.deb
sudo apt-get install -y /tmp/bat*.deb
