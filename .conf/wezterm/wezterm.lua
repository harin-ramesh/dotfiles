local wezterm = require("wezterm")

return {
  front_end = "OpenGL",
  enable_wayland = false,
  color_scheme = "catppuccin-mocha",
  hide_tab_bar_if_only_one_tab = true,

  -- Window padding
  window_padding = {
    left = 0,
    right = 0,
    top = 5,
    bottom = 0,
  },

  -- Transparency
  window_background_opacity = 0.85,  -- 0.0 = fully transparent, 1.0 = fully opaque

  -- Optional: dim inactive panes for better focus
  inactive_pane_hsb = {
    saturation = 0.9,  -- reduce saturation of inactive panes
    brightness = 0.8,  -- reduce brightness
  },
}
