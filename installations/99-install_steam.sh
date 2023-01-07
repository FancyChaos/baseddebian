#!/bin/bash

sudo dpkg --add-architecture i386
sudo apt update
sudo apt -y install steam
sudo apt -y install mesa-vulkan-drivers libglx-mesa0:i386 mesa-vulkan-drivers:i386 libgl1-mesa-dri:i386
