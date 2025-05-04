local wezterm = require 'wezterm'
local config = wezterm.config_builder()
local act = wezterm.action

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

config.font = wezterm.font_with_fallback {
    'Dank Mono',
    'Source Han Sans KR',
    'Source Han Sans JP',
    'Source Han Sans CN',
    'Source Han Sans TW',
}
config.font_size = 14.0

config.enable_scroll_bar = true
config.force_reverse_video_cursor = true
config.hide_tab_bar_if_only_one_tab = true

config.keys = {
    {
        key = 'Enter',
        mods = 'ALT',
        action = wezterm.action.DisableDefaultAssignment,
    },
}

-- Fix scroll speed on Wayland
config.mouse_bindings = {
    {
        event = { Down = { streak = 1, button = { WheelUp = 1 } } },
        mods = 'NONE',
        alt_screen = false,
        action = act.ScrollByLine(-3),
    },
    {
        event = { Down = { streak = 1, button = { WheelDown = 1 } } },
        mods = 'NONE',
        alt_screen = false,
        action = act.ScrollByLine(3),
    },
}

return config
