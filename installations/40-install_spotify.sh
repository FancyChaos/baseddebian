#!/bin/bash

curl -sS https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | doas apt-key add -
echo "deb http://repository.spotify.com stable non-free" | doas tee /etc/apt/sources.list.d/spotify.list
doas apt-get update -y && doas apt-get install -y spotify-client
