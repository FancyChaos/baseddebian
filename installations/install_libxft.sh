#!/bin/bash

# Install fixed libxft library to /usr/lib/
cd /tmp/
git clone https://github.com/uditkarode/libxft-bgra
cd libxft-bgra/
sh autogen.sh --sysconfdir=/etc --prefix=/usr --mandir=/usr/share/man
sudo make install

# Copy fixed lib to /usr/lib/x86_64-linux-gnu/
sudo cp /usr/lib/libXft.so.2.3.3 /usr/lib/x86_64-linux-gnu/
sudo cp /usr/lib/libXft.so.2.3.3 /usr/lib/x86_64-linux-gnu/libXft.so.2
