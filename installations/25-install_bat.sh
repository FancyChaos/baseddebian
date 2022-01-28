#!/bin/bash

cd /tmp/
wget https://github.com/sharkdp/bat/releases/download/v0.19.0/bat_0.19.0_amd64.deb
sudo dpkg -i bat*.deb
