local colors = require("onedarkpro.helpers").get_colors("onedark_dark")
local config = require("onedarkpro.config")

local myOnedarkPro = {}

myOnedarkPro.normal = {
    a = {
       bg = config.options.lualine_transparency and colors.none or colors.green,
       fg = config.options.lualine_transparency and colors.green or colors.bg
    },
    b = {
       bg = config.options.lualine_transparency and colors.none or colors.fg_gutter,
       fg = colors.blue
    },
    c = {
       bg = config.options.lualine_transparency and colors.none or colors.bg_statusline,
       fg = colors.fg
    },
}

myOnedarkPro.insert = {
    a = {
       bg = config.options.lualine_transparency and colors.none or colors.blue,
       fg = config.options.lualine_transparency and colors.blue or colors.bg
    },
    b = {
       bg = config.options.lualine_transparency and colors.none or colors.fg_gutter,
       fg = colors.blue
    },
}

myOnedarkPro.command = {
    a = {
       bg = config.options.lualine_transparency and colors.none or colors.purple,
       fg = config.options.lualine_transparency and colors.purple or colors.bg
    },
    b = {
       bg = config.options.lualine_transparency and colors.none or colors.fg_gutter,
       fg = colors.blue
    },
}

myOnedarkPro.visual = {
    a = {
       bg = config.options.lualine_transparency and colors.none or colors.yellow,
       fg = config.options.lualine_transparency and colors.yellow or colors.bg
    },
    b = {
       bg = config.options.lualine_transparency and colors.none or colors.fg_gutter,
       fg = colors.blue
    },
}

myOnedarkPro.replace = {
    a = {
       bg = config.options.lualine_transparency and colors.none or colors.red,
       fg = config.options.lualine_transparency and colors.red or colors.bg
    },
    b = {
       bg = config.options.lualine_transparency and colors.none or colors.fg_gutter,
       fg = colors.blue
    },
}

local inactive_bg = config.options.highlight_inactive_windows and colors.color_column or colors.bg
myOnedarkPro.inactive = {
    a = {
       bg = inactive_bg,
       fg = colors.blue
    },
    b = {
       bg = inactive_bg,
       fg = colors.fg_gutter_inactive, gui = "bold"
    },
    c = {
       bg = config.options.lualine_transparency and colors.none or inactive_bg,
       fg = colors.fg_gutter_inactive
    },
}

return myOnedarkPro
