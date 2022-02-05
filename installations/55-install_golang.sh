#!/bin/bash

golink="https://go.dev/dl/go1.17.6.linux-amd64.tar.gz"

sudo rm -rf /usr/local/go/ || true
wget -qO- "$golink" | sudo tar xvz -C /usr/local/
