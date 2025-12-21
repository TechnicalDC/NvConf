-- lua/plugins/rose-pine.lua
return {
   "rose-pine/neovim",
   name = "rose-pine",
   config = function()
      local transparency = false
      require("rose-pine").setup({
         styles = {
            transparency = transparency,
            bold = true,
            italic = false,
         },
         highlight_groups = {
            StatusLine      = { fg = "subtle", bg  = "surface" },
            StatusLineMode  = { fg = "surface", bg = "subtle", bold = true },
            StatusLineTerm  = { fg = "subtle", bg  = "surface" },
            InclineNormal   = { fg = "subtle", bg  = "surface" },
            InclineNormalNC = { fg = "subtle", bg  = "surface" },
            BlinkCmpSource          = { bg   = "none" },
            TelescopeSelection      = { link = "PmenuSel" },
            Folded                  = { link = "Comment" },
            -- NormalFloat             = { link = "Normal" },
            FloatBorder             = {
               fg = "surface",
               bg = transparency and "none" or "surface"
            },
            FloatTitle              = {
               fg = "surface",
               bg = transparency and "none" or "subtle"
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
            MiniFilesTitleFocused    = { fg   = "base", bg = "rose" },
            WhichKeyBorder           = { link = "FloatBorder" },
            NoiceCmdline             = { link = "StatusLine" },
            NoiceCmdlineIcon    = { link = "StatusLineMode" },
            NoiceCmdlineIconCmdline    = { link = "StatusLineMode" },
            NoiceCmdlineIconCalculator = { link = "StatusLineMode" },
            NoiceCmdlineIconFilter     = { link = "StatusLineMode" },
            NoiceCmdlineIconLua        = { link = "StatusLineMode" },
            NoiceCmdlineIconInput      = { link = "StatusLineMode" },
            NoiceCmdlineIconHelp       = { link = "StatusLineMode" },
            NoiceCmdlineIconSearch     = { link = "StatusLineMode" },
         },
      })
   end
}
