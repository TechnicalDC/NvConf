-- lua/plugins/rose-pine.lua
return {
   "rose-pine/neovim",
   name = "rose-pine",
   config = function()
      local transparency = false
      require("rose-pine").setup({
         styles = {
            transparency = transparency,
            -- bold = false,
            -- italic = false,
         },
         highlight_groups = {
            StatusLine            = { fg = "subtle", bg  = "surface" },
            StatusLineTerm        = { fg = "subtle", bg  = "surface" },
            StatusLineMode        = { fg = "surface", bg = "iris", bold = true },
            StatusLineModeNormal  = { fg = "surface", bg = "love", bold = true },
            StatusLineModeVisual  = { fg = "surface", bg = "rose", bold = true },
            StatusLineModeInsert  = { fg = "surface", bg = "foam", bold = true },
            StatusLineModeCommand = { fg = "surface", bg = "gold", bold = true },

            ["@markup.link.label.markdown_inline"] = { fg = "foam", underline = true },

            BlinkCmpSource          = { bg   = "none" },

            Folded                  = { link = "Comment" },
            -- NormalFloat             = { link = "Normal" },
            FloatBorder             = {
               fg = "surface",
               bg = transparency and "none" or "surface"
            },
            FloatTitle              = {
               fg = "surface",
               bg = transparency and "none" or "rose"
            },

            SnacksPickerPreviewBorder = {
               fg = "highlight_high",
               bg = transparency and "none" or "surface"
            },
            SnacksInputBorder        = { link = "FloatBorder" },
            SnacksInputTitle         = { link = "FloatTitle" },
            SnacksInputNormal        = { link = "NormalFloat" },
            SnacksDashboardTitle     = { fg   = "rose" },
            SnacksPickerPreviewTitle = { fg   = "base", bg = "rose" },

            MiniFilesTitleFocused    = { fg   = "base", bg = "love" },

            WhichKeyBorder           = { link = "FloatBorder" },

            -- RenderMarkdownLink       = { fg = "foam", underline = true },
            -- RenderMarkdownH2         = { fg = "foam", reverse = true },
            MarkdownH1Bg       = { fg = "base", bg = "iris" },
            MarkdownH2Bg       = { fg = "base", bg = "foam" },
            MarkdownH3Bg       = { fg = "base", bg = "rose" },
            MarkdownH4Bg       = { fg = "base", bg = "gold" },
            MarkdownH5Bg       = { fg = "base", bg = "love" },
            MarkdownH6Bg       = { fg = "base", bg = "pine" },
            MarkdownH1         = { fg = "base", bg = "iris" },
            MarkdownH2         = { fg = "base", bg = "foam" },
            MarkdownH3         = { fg = "base", bg = "rose" },
            MarkdownH4         = { fg = "base", bg = "gold" },
            MarkdownH5         = { fg = "base", bg = "love" },
            MarkdownH6         = { fg = "base", bg = "pine" },

            NoiceCmdline               = { link = "StatusLine" },
            NoiceCmdlineIcon           = { link = "StatusLineModeInsert" },
            NoiceCmdlineIconCmdline    = { link = "StatusLineModeInsert" },
            NoiceCmdlineIconCalculator = { link = "StatusLineModeInsert" },
            NoiceCmdlineIconFilter     = { link = "StatusLineModeInsert" },
            NoiceCmdlineIconLua        = { link = "StatusLineModeInsert" },
            NoiceCmdlineIconInput      = { link = "StatusLineModeInsert" },
            NoiceCmdlineIconHelp       = { link = "StatusLineModeInsert" },
            NoiceCmdlineIconSearch     = { link = "StatusLineModeInsert" },
         },
      })
   end
}
