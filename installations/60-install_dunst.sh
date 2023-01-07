#!/bin/bash

cd /tmp/
git clone https://github.com/dunst-project/dunst.git
cd dunst

make WAYLAND=0
sudo make install WAYLAND=0
