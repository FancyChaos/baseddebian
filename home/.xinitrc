# Start compositor
picom --unredir-if-possible --experimental-backends --vsync &
sleep 2

# Source custom exports
. $HOME/.custom_settings

# Autostart stuff
debian-2021-startup &

# Start ssh-agent
eval `ssh-agent -s`

# Start the window manager
dbus-launch --exit-with-session dwm
