-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

--## This is where you actually apply your config choices ##--

-- Define 'act' to simplify action references in keybindings
-- This allows us to use 'act' as a shorthand for wezterm.action, making the code more readable.
local act = wezterm.action 

-- Set the color theme. Here using built in but can also be completely custom:
-- config.color_scheme = 'cyberpunk'
-- config.color_scheme = 'Catppuccin Macchiato'
-- config.color_scheme = 'Catppuccin Mocha'
config.color_scheme = 'Dracula'

-- Set background opacity, 0-1:
config.window_background_opacity = 0.8

-- Hide the tab bar if only one tab open:
config.hide_tab_bar_if_only_one_tab = true

-- Fancy tab bar enables a more visually appealing tab bar.
config.use_fancy_tab_bar = true

-- Enable/disable the scroll bar
config.enable_scroll_bar = true

-- Set the scrollback lines
-- This controls how many lines are kept in memory for scrolling back.
config.scrollback_lines = 5000

-- Dont know what these settings does does?`:
config.window_decorations = "RESIZE"

-- Adds padding around the terminal content for better visual spacing:
config.window_padding = {
    left = 5,
    right = 5,
    top = 5,
    bottom = 5,
}


-- and finally, return the configuration to wezterm
return config
