# Pre-flight checks
sh ~/.config/awesome/preflightchecks.sh

# Xresources
xrdb -merge ~/.Xresources

# Cursor
xsetroot -cursor_name arrow

# Mopidy
pgrep -x mopidy > /dev/null || mopidy &

# Gestures
touchegg &

# Kmonad
kmonad ~/.config/kmonad/kmonad.kbd

# Applets
nm-applet &
blueman-applet &
 
# Compositor
picom &

# Emacs daemon
emacs --daemon
