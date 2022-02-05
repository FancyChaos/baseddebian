# Set java paremeter to fix display issue with intellij
export _JAVA_AWT_WM_NONREPARENTING=1
export AWT_TOOLKIT=MToolkit

# Start compositor
picom --unredir-if-possible --experimental-backends --vsync &
sleep 2

# Source custom exports
. /etc/fos/config/fos_shell_settings

# Autostart stuff
/etc/fos/system/fstartup &

# Start ssh-agent
eval `ssh-agent -s`

# start dwmblocks
dwmblocks &

# Start the window manager
dbus-launch --exit-with-session dwm
