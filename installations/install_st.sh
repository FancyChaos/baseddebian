#!/bin/bash

# Build st by instantOS (Custom version with "scrollback" patch)
cd /tmp/
git clone https://github.com/FancyChaos/st-instantos.git
cd st-instantos/
rm config.h || true
make
sudo make install
