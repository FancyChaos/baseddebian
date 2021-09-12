# Start compositor
picom &
sleep 2

# Source custom exports
. ~/.custom_exports

# Autostart stuff
bash /usr/local/bin/debian-2021-startup &

# Start ssh-agent
eval `ssh-agent -s`

# Start the window manager
exec dwm
