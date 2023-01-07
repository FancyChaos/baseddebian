#!/bin/bash

cd /tmp/

git clone https://github.com/dunst-project/dunst.git
cd dunst
make
sudo make install
