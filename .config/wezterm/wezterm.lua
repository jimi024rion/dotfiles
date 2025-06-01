local wezterm = require 'wezterm'
local config = wezterm.config_builder()

local SOLID_LEFT_ARROW = wezterm.nerdfonts.ple_lower_right_triangle
local SOLID_RIGHT_ARROW = wezterm.nerdfonts.ple_upper_left_triangle

config.automatically_reload_config = true

-- default cwd
config.default_cwd = "/Users/jimii"

-- window size
config.initial_rows = 40
config.initial_cols = 140

-- カラースキームの設定
-- config.color_scheme = 'catppuccin-mocha'
-- config.color_scheme = "cyberpunk"
config.color_scheme = "Dracula+"

-- フォントの設定
config.font = wezterm.font_with_fallback({
    "JetBrainsMono Nerd Font",
    "Cica",
})
config.font_size = 12.0
config.use_ime = true

-- カーソル設定
config.default_cursor_style = "SteadyBlock"

-- カラー設定
config.colors = {
    cursor_fg = "#11111b",
    cursor_bg = "#59c2c6",
    cursor_border = "#59c2c6",
    tab_bar = {
        inactive_tab_edge = "none",
        background = "none",
    },
}

-- 背景透過設定
config.window_background_opacity = 0.85
config.macos_window_background_blur = 20

-- タブバーの設定
config.use_fancy_tab_bar = false
config.tab_max_width = 100
config.window_decorations = "RESIZE"
-- config.hide_tab_bar_if_only_one_tab = true
-- config.tab_bar_at_bottom = true
config.window_background_gradient = { -- タブバーを背景と同じ色にする
    colors = { "#000000" },
}
config.show_new_tab_button_in_tab_bar = false
config.show_close_tab_button_in_tabs = false

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
    local background = "#5c6d74"
    local foreground = "#FFFFFF"
    if tab.is_active then
        background = "#ae8b2d"
        foreground = "#FFFFFF"
    end
    local edge_background = "none"
    local edge_foreground = background

    local title = "   " .. wezterm.truncate_right(tab.active_pane.title, max_width - 1) .. "   "

    return {
        { Background = { Color = edge_background } },
        { Foreground = { Color = edge_foreground } },
        { Text = SOLID_LEFT_ARROW },
        { Background = { Color = background } },
        { Foreground = { Color = foreground } },
        { Text = title },
        { Background = { Color = edge_background } },
        { Foreground = { Color = edge_foreground } },
        { Text = SOLID_RIGHT_ARROW },
    }
end)

-- tabline.wez
-- local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")
-- tabline.setup({
--     options = {
--         -- theme = "catppuccin-mocha",
--         theme = "cyberpunk",
--         -- theme = "Cobalt Neon",
--         section_separators = {
--             left = wezterm.nerdfonts.ple_upper_left_triangle,
--             right = wezterm.nerdfonts.ple_lower_right_triangle,
--         },
--         component_separators = {
--             left = wezterm.nerdfonts.ple_forwardslash_separator,
--             right = wezterm.nerdfonts.ple_forwardslash_separator,
--         },
--         tab_separators = {
--             left = wezterm.nerdfonts.ple_upper_left_triangle,
--             right = wezterm.nerdfonts.ple_lower_right_triangle,
--         },
--         -- color_overrides = {
--         theme_overrides = {
--             tab = {
--                 active = { fg = "#091833", bg = "#59c2c6" },
--             },
--         },
--     },
--     sections = {
--         tab_active = {
--             -- "index",
--             -- { "process", padding = { left = 0, right = 1 } },
--             "",
--             { "cwd",    padding = { left = 1, right = 0 } },
--             { "zoomed", padding = 1 },
--         },
--         tab_inactive = {
--             -- "index",
--             -- { "process", padding = { left = 0, right = 1 } },
--             "󰉋",
--             { "cwd",    padding = { left = 1, right = 0 } },
--             { "zoomed", padding = 1 },
--         },
--     },
-- })

config.keys = require("keybinds").keys
config.key_tables = require("keybinds").key_tables

return config
