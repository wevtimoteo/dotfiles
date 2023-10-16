-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- UI
config.enable_tab_bar = false
config.enable_scroll_bar = false
config.use_fancy_tab_bar = false

-- Appearance
config.color_scheme = "Catppuccin Macchiato"
--config.color_scheme = "purplepeter"

config.font = wezterm.font("FiraCodeGG Nerd Font")
config.font_size = 13

-- Notifications
config.audible_bell = "Disabled"

-- Window
config.window_close_confirmation = "AlwaysPrompt"
config.window_padding = {
	left = 2,
	right = 2,
	top = 2,
	bottom = 2,
}

return config
