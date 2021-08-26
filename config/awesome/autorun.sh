# Xresources
xrdb -merge ~/.Xresources

# Mopidy
mopidy &

# Applets
pkill nm-applet
nm-applet &
pkill blueman-applet
blueman-applet &
 
# Compositor
picom --experimental-backends &

# Emacs daemon
pgrep -x emacs > /dev/null || emacs --daemon
