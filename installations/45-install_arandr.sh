#!/bin/bash

# Clone custom arandr version
cd /tmp/
git clone https://github.com/FancyChaos/arandr.git
cd arandr

# Install docutils for python3
sudo pip install docutils

# Install arandr
sudo ./setup.py install
