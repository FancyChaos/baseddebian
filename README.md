# debian-2021
My own scripts to setting up an dwm environment from a freshly installed Debian Bullseye (11)

## Installation

 1. Install a new Debian Bullseye (11) base system
 2. Open your Terminal and install git
	> sudo apt install git
 3. Clone this repository and move into it
	> git clone https://github.com/FancyChaos/debian-2021.git && cd debian-2021
 4. Make the run.sh script executable and run it
	> chmod +x bin/run.sh && bin/run.sh

	The **run.sh** script will create an **install.log** file inside the cloned repository which will include all actions done by the scripts.

After the automatic reboot you will end up in a default tty terminal. Just login and execute `startx` to startup the system.

## Thanks to
Big thanks to anyone I stole scripts, wallpapers or snippets from.
