# Start compositor
compton -f &
sleep 2

# Autostart stuff
bash /usr/local/bin/debian-2021-startup &

# Set zsh to the default shell
export SHELL=zsh

# Start the window manager
exec dwm
