#!/bin/bash
curl -fsSL https://deb.nodesource.com/setup_18.x | doas -E bash - &&\
doas apt-get install -y nodejs
