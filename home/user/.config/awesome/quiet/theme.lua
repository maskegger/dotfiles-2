---------------------------
-- Default awesome theme --
---------------------------

local rnotification = require("ruled.notification")

local gfs = require("gears.filesystem")
local themes_path = gfs.get_themes_dir()

local theme = dofile(themes_path .. "default/theme.lua")

local naughty = require("naughty")
local nconf = naughty.config

-- Fonts

theme.font = "Iosevka 10"

-- Backgrounds

theme.bg_normal = "#1F252A"
theme.bg_focus = "#1F252A"
theme.bg_urgent = "#FF8080"
theme.bg_minimize = "#1F252A"
theme.bg_systray = "#1F252A"

-- Foregrounds

theme.fg_normal = "#D5D5D5"
theme.fg_focus = "#80D1FF"
theme.fg_urgent = "#D5D5D5"
theme.fg_minimize = "#C780FF"

-- Gap and borders

theme.useless_gap = 20
theme.border_width = 0
theme.border_color_normal = "#1F252A"
theme.border_color_active = "#80D1FF"
theme.border_color_marked = "#C780FF"

-- Taglist
theme.taglist_bg = "#1F252A"
theme.taglist_bg_empty = "#1F252A"
theme.taglist_bg_occupied = "#1F252A"

theme.taglist_fg = "#80D1FF"
theme.taglist_fg_empty = "#D5D5D5"
theme.taglist_fg_occupied = "#97D59B"

-- Tasklist

theme.tasklist_bg_normal = "#1F252A"
theme.tasklist_align = "center"
theme.tasklist_disable_task_name = false
theme.tasklist_disable_icon = true

-- Titlebar

theme.titlebar_size = 80
theme.titlebar_height = 80
theme.titlebar_bg_focus = "#384149"
theme.titlebar_bg_normal = "#1F252A"

theme.titlebar_close_button_normal = gfs.get_configuration_dir() .. "quiet/titlebar/inactive.png"
theme.titlebar_close_button_focus  = gfs.get_configuration_dir() .. "quiet/titlebar/close.png"

theme.titlebar_minimize_button_normal = gfs.get_configuration_dir() .. "quiet/titlebar/inactive.png"
theme.titlebar_minimize_button_focus  = gfs.get_configuration_dir() .. "quiet/titlebar/minimize.png"

theme.titlebar_ontop_button_normal_inactive = gfs.get_configuration_dir() .. "quiet/titlebar/inactive.png"
theme.titlebar_ontop_button_focus_inactive  = gfs.get_configuration_dir() .. "quiet/titlebar/ontop.png"
theme.titlebar_ontop_button_normal_active = gfs.get_configuration_dir() .. "quiet/titlebar/inactive.png"
theme.titlebar_ontop_button_focus_active  = gfs.get_configuration_dir() .. "quiet/titlebar/ontop.png"

theme.titlebar_sticky_button_normal_inactive = gfs.get_configuration_dir() .. "quiet/titlebar/inactive.png"
theme.titlebar_sticky_button_focus_inactive  = gfs.get_configuration_dir() .. "quiet/titlebar/sticky.png"
theme.titlebar_sticky_button_normal_active = gfs.get_configuration_dir() .. "quiet/titlebar/inactive.png"
theme.titlebar_sticky_button_focus_active  = gfs.get_configuration_dir() .. "quiet/titlebar/sticky.png"

theme.titlebar_floating_button_normal_inactive = gfs.get_configuration_dir() .. "quiet/titlebar/inactive.png"
theme.titlebar_floating_button_focus_inactive  = gfs.get_configuration_dir() .. "quiet/titlebar/floating.png"
theme.titlebar_floating_button_normal_active = gfs.get_configuration_dir() .. "quiet/titlebar/inactive.png"
theme.titlebar_floating_button_focus_active  = gfs.get_configuration_dir() .. "quiet/titlebar/floating.png"

theme.titlebar_maximized_button_normal_inactive = gfs.get_configuration_dir() .. "quiet/titlebar/inactive.png"
theme.titlebar_maximized_button_focus_inactive  = gfs.get_configuration_dir() .. "quiet/titlebar/maximize.png"
theme.titlebar_maximized_button_normal_active = gfs.get_configuration_dir() .. "quiet/titlebar/inactive.png"
theme.titlebar_maximized_button_focus_active  = gfs.get_configuration_dir() .. "quiet/titlebar/maximize.png"

-- Wallpaper

theme.wallpaper = "~/Pictures/Wallpaper/Cove.jpg"

-- Layout icons

theme.layout_fairh = gfs.get_configuration_dir() .. "quiet/layouts/fairhw.png"
theme.layout_fairv = gfs.get_configuration_dir() .. "quiet/layouts/fairvw.png"
theme.layout_floating  = gfs.get_configuration_dir() .. "quiet/layouts/floatingw.png"
theme.layout_magnifier = gfs.get_configuration_dir() .. "quiet/layouts/magnifierw.png"
theme.layout_max = gfs.get_configuration_dir() .. "quiet/layouts/maxw.png"
theme.layout_fullscreen = gfs.get_configuration_dir() .. "quiet/layouts/fullscreenw.png"
theme.layout_tilebottom = gfs.get_configuration_dir() .. "quiet/layouts/tilebottomw.png"
theme.layout_tileleft   = gfs.get_configuration_dir() .. "quiet/layouts/tileleftw.png"
theme.layout_tile = gfs.get_configuration_dir() .. "quiet/layouts/tilew.png"
theme.layout_tiletop = gfs.get_configuration_dir() .. "quiet/layouts/tiletopw.png"
theme.layout_spiral  = gfs.get_configuration_dir() .. "quiet/layouts/spiralw.png"
theme.layout_dwindle = gfs.get_configuration_dir() .. "quiet/layouts/dwindlew.png"
theme.layout_cornernw = gfs.get_configuration_dir() .. "quiet/layouts/cornernww.png"
theme.layout_cornerne = gfs.get_configuration_dir() .. "quiet/layouts/cornernew.png"
theme.layout_cornersw = gfs.get_configuration_dir() .. "quiet/layouts/cornersww.png"
theme.layout_cornerse = gfs.get_configuration_dir() .. "quiet/layouts/cornersew.png"

-- Edge snap

theme.snap_bg = "#1F252A"
theme.snap_border_width = "0"

-- Icon theme

theme.icon_theme = "Papirus"

-- Hotkey popup

local gears = require("gears")

local rounded_rect = function(cr, width, height)
    gears.shape.rounded_rect(cr, width, height, 75)
end

theme.hotkeys_font = "Iosevka 11"
theme.hotkeys_description_font = "Iosevka 9"
theme.hotkeys_modifiers_fg = "#80D1FF"
theme.hotkeys_shape = rounded_rect
theme.hotkeys_border_width = 15
theme.hotkeys_group_margin = 50
theme.hotkeys_border_color = "#1F252A"

-- Notifications

theme.notification_font = "Iosevka 11"
theme.notification_bg = "#1F252A"
theme.notification_fg = "#D5D5D5"
theme.notification_margin = "24"

theme.notification_width = 300
theme.notification_height = 50
theme.notification_max_width = 400

theme.notification_shape = function(cr, w, h)
   gears.shape.rounded_rect(cr, w, h, 6)
end

nconf.padding = 15

-- Wibar

theme.wibar_bg = "#1F252A"
theme.wibar_width = 300
theme.wibar_stretch = false
theme.wibar_shape = rounded_rect
theme.tasklist_disable_icon = true

-- Set different colors for urgent notifications.

rnotification.connect_signal('request::rules', function()
    rnotification.append_rule {
        rule       = { urgency = 'critical' },
        properties = { bg = '#ff8080', fg = '#ffffff' }
    }
end)

return theme
