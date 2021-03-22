# If running VM
vmware-user

# Keyboard repeat rate
xset r rate 200 25

# Resolution
xrandr --newmode "2560x1440"  241.500   2560 2608 2640 2720  1440 1443 1448 1481 +hsync -vsync
xrandr --addmode Virtual1 "2560x1440"
xrandr --output Virtual1 --mode 2560x1440

# Mouse cursor
xsetroot -cursor_name arrow

# QT theme
export QT_QPA_PLATFORMTHEME=qt5ct

# Wallpaper
nitrogen --restore
 
# Compositor
picom

# Music
mpd
