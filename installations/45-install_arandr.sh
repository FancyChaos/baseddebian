#!/bin/bash

# Clone custom arandr version
cd /tmp/
git clone https://github.com/FancyChaos/arandr.git
cd arandr

# Install docutils for python3
doas pip install docutils

# Install arandr
doas ./setup.py install
