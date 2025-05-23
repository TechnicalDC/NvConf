local palette = require("mini.hues").make_palette()
local inactive_bg = palette.bg_mid

local modes = {}

modes.normal = {
    a = { bg = palette.bg_mid2, fg = palette.fg_mid },
    b = { bg = palette.bg_mid, fg = palette.fg_mid },
    c = { bg = palette.bg_mid, fg = palette.fg_mid },
}

modes.insert = {
    a = { bg = palette.green, fg = palette.bg_mid },
    b = { bg = palette.bg_mid, fg = palette.fg_mid },
}

modes.command = {
    a = { bg = palette.orange, fg = palette.bg_mid },
    b = { bg = palette.bg_mid, fg = palette.fg_mid }
}

modes.visual = {
    a = { bg = palette.cyan, fg = palette.bg_mid },
    b = { bg = palette.bg_mid, fg = palette.fg_mid },
}

modes.replace = {
    a = { bg = palette.purple, fg = palette.bg_mid },
    b = { bg = palette.bg_mid, fg = palette.fg_mid },
}

modes.inactive = {
    a = { bg = inactive_bg, fg = palette.fg_mid },
    b = { bg = inactive_bg, fg = palette.fg_mid },
    c = { bg = inactive_bg, fg = palette.fg_mid },
}

return modes
