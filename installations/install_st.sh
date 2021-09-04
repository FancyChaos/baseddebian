#!/bin/bash

# # Build custom st
# cd /tmp/
# git clone https://github.com/FancyChaos/st.git
# cd st/
# git fetch origin
# ./build.sh

# Build st by instantOS
cd /tmp/
git clone https://github.com/instantOS/st-instantos.git
cd st-instantos
make
sudo make install
