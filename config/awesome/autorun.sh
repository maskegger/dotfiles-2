# Xresources
xrdb -merge ~/.Xresources

# Cursor
xsetroot -cursor_name arrow

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
