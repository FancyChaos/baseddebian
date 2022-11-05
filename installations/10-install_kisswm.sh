#!/bin/bash

cd /tmp/

git clone https://github.com/fancychaos/kisswm.git

cd kisswm/
mv config.mk.linux config.mk

make
doas make install

