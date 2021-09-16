local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local naughty = require("naughty")

local y = wibox.widget {
    max_value = 100,
    value = 50,
    forced_height = 10,
    margins = {top = 0, bottom = 0},
    forced_width = 200,
    shape = gears.shape.bar,
    bar_shape = gears.shape.bar,
    color = "#384149",
    background_color = "#181e23",
    border_width = 3,
    border_color = "#384149",
    widget = wibox.widget.progressbar
}

-- or you can use `y` directly
local x = wibox {
  widget = y,
  width = 200,
  height = 50,
  visible = true,
  shape = gears.shape.bar,
  screen = awful.screen.focused()
}

-- for placement (it will be left left by default)
awful.placement.centered(x)
