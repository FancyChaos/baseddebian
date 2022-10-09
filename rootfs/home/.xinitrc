# Load Xresources
xrdb -merge ~/.Xresources

# Source custom exports
. /etc/fos/config/fos_shell_settings

# Set java paremeter to fix display issue with intellij
export _JAVA_AWT_WM_NONREPARENTING=1
export AWT_TOOLKIT=MToolkit

# Start compositor
picom --unredir-if-possible --experimental-backends --vsync &

# Start ssh-agent
eval `ssh-agent -s`

# Start notification daemon
dunst &

# Set wallpaper
fwallpaper

# Start kissbar and kisswm
kissbar -wn &
dbus-launch --exit-with-session kisswm
