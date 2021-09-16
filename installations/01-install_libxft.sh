#!/bin/bash

# Install fixed libxft library to /usr/lib/
cd /tmp/
git clone https://github.com/uditkarode/libxft-bgra
cd libxft-bgra/
sh autogen.sh --sysconfdir=/etc --prefix=/usr --mandir=/usr/share/man
sudo make install

# Link fixed files
sudo rm /usr/lib/x86_64-linux-gnu/libXft.so.2.3.3 || true
sudo rm /usr/lib/x86_64-linux-gnu/libXft.so.2 || true
sudo rm /usr/lib/x86_64-linux-gnu/libXft.so || true

sudo ln -s /usr/lib/libXft.so.2.3.3 /usr/lib/x86_64-linux-gnu/libXft.so.2.3.3
sudo ln -s /usr/lib/libXft.so.2.3.3 /usr/lib/x86_64-linux-gnu/libXft.so.2
sudo ln -s /usr/lib/libXft.so.2.3.3 /usr/lib/x86_64-linux-gnu/libXft.so
