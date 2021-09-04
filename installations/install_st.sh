#!/bin/bash

# # Build custom st
# cd /tmp/
# git clone https://github.com/FancyChaos/st.git
# cd st/
# git fetch origin
# ./build.sh

# Build st by instantOS (Custom version with "scrollback" patch)
cd /tmp/
# git clone https://github.com/instantOS/st-instantos.git
git clone https://github.com/FancyChaos/st-instantos.git
cd st-instantos/
rm config.h || true
make
sudo make install
