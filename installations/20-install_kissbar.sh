#!/bin/bash

cd /tmp/

git clone https://github.com/fancychaos/kissbar.git

cd kissbar/
mv config.mk.linux config.mk

make
doas make install

