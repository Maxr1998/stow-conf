local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.window_padding = {
    left = 0,
    right = 8,
    top = 0,
    bottom = 0,
}

config.colors = {
    foreground = 'white',
    background = 'black',

    cursor_bg = 'white',
    cursor_fg = 'black',
    cursor_border = 'white',

    selection_fg = 'black',
    selection_bg = 'white',

    scrollbar_thumb = '#6C6C6C',

    split = '#444444',

    ansi = {
        '#75715E',
        '#F92672',
        '#A6E22E',
        '#F4BF75',
        '#66D9EF',
        '#AE81FF',
        '#2AA198',
        '#F9F9F5',
    },
    brights = {
        '#272822',
        '#F92672',
        '#A6E22E',
        '#F4BF75',
        '#66D9EF',
        '#AE81FF',
        '#2AA198',
        '#F9F9F5',
    },

    -- Set arbitrary colors in the range from 16 to 255
    --indexed = { [136] = '#af8700' },
}


config.font = wezterm.font 'Dank Mono'
config.font_size = 14.0

config.enable_scroll_bar = true
config.force_reverse_video_cursor = true
config.hide_tab_bar_if_only_one_tab = true

return config
