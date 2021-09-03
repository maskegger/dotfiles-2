# Xresources
xrdb -merge ~/.Xresources

# Mopidy
pgrep -x mopidy > /dev/null || mopidy &

# Gestures
touchegg &

# Applets
nm-applet &
blueman-applet &
 
# Compositor
picom &

# Emacs daemon
emacs --daemon
