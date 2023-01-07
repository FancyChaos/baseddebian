#!/bin/bash

cd /tmp/
git clone https://github.com/fancychaos/kisswm.git
cd kisswm/

make config

# Use xsecurelock as locking app
sed -i 's/fxlock/xsecurelock/g' config.h

make
sudo make install

