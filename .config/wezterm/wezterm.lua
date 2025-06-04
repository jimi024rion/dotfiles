local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.automatically_reload_config = true
config.default_cwd = "/Users/jimii"

-- カラースキームの設定
config.color_scheme = "Dracula+" -- cyberpunk/catppuccin-mocha
-- ウィンドウサイズ
config.initial_rows = 40
config.initial_cols = 140
-- 背景透過設定
config.window_background_opacity = 0.85
config.macos_window_background_blur = 20
-- フォントの設定
config.use_ime = true
config.font_size = 14.0
config.font = wezterm.font_with_fallback({
    "JetBrainsMono Nerd Font",
    "Cica",
})
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

--------------------------------------------------------------------------------
-- Tab
--------------------------------------------------------------------------------
-- タイトルバーを非表示
config.window_decorations = "RESIZE"
-- タブバーの表示
config.show_tabs_in_tab_bar = true
-- タブバーが一つの時は非表示
-- config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
-- タブバーの設定
config.tab_max_width = 100
-- タブバーを下部に表示
-- config.tab_bar_at_bottom = true
-- タブバーを背景色に合わせる
config.window_background_gradient = {
    colors = { "#000000" },
}
-- タブの追加ボタンを非表示
config.show_new_tab_button_in_tab_bar = false
-- タブの閉じるボタンを非表示
config.show_close_tab_button_in_tabs = false

local SOLID_LEFT_ARROW = wezterm.nerdfonts.ple_lower_right_triangle
local SOLID_RIGHT_ARROW = wezterm.nerdfonts.ple_upper_left_triangle

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

--------------------------------------------------------------------------------
-- keybinds
--------------------------------------------------------------------------------
config.disable_default_key_bindings = true
config.keys = require("keybinds").keys
config.key_tables = require("keybinds").key_tables
config.leader = { key = "q", mods = "CTRL", timeout_milliseconds = 2000 }

return config
