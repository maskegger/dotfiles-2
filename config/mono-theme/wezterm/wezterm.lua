local wezterm = require 'wezterm';

return {
  front_end = "OpenGL",
  font = wezterm.font({'Iosevka', stretch="UltraCondensed", weight="Regular"}),
  font_size = 11,
  colors = {
      foreground = "#ffffff",
      background = "#000000",
      cursor_bg = "#ffffff",
      cursor_fg = "#ffffff",
      cursor_border = "#ffffff",
      selection_fg = "#000000",
      selection_bg = "#ffffff",
      scrollbar_thumb = "#ffffff",
      split = "#ffffff",
      ansi = {"#444444", "#444444", "#444444", "#444444", "#444444", "#444444", "#444444", "#444444"},
      brights = {"#444444", "#444444", "#444444", "#444444", "#444444", "#444444", "#444444", "#444444"},
      indexed = {[136] = "#ffffff"},
  },
  window_padding = {
    left = 30,
    right = 30,
    top = 30,
    bottom = 30,
  },
  enable_tab_bar = false,
  default_cursor_style = "BlinkingBar",
}
