# Start compositor
picom --unredir-if-possible --experimental-backends --vsync &
sleep 2

# Source custom exports
. /etc/fos/config/fos_bash_settings

# Autostart stuff
./etc/fos/system/fstartup &

# Start ssh-agent
eval `ssh-agent -s`

# start dwmblocks
dwmblocks &

# Start the window manager
dbus-launch --exit-with-session dwm
