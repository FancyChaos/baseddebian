#!/bin/bash

cd /tmp/

git clone https://github.com/FancyChaos/yst.git

cd yst/

make
doas make install

