#!/bin/bash

echo "deb [arch=amd64] http://deb.librewolf.net $(lsb_release -sc) main" | doas tee /etc/apt/sources.list.d/librewolf.list

doas wget https://deb.librewolf.net/keyring.gpg -O /etc/apt/trusted.gpg.d/librewolf.gpg

doas apt update

doas apt install librewolf -y
