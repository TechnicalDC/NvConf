-- lua/plugins/rose-pine.lua
return {
   "rose-pine/neovim",
   name = "rose-pine",
   config = function()
      local transparency = false
      require("rose-pine").setup({
         styles = {
            transparency = transparency,
         },
         highlight_groups = {
            StatusLine              = { fg   = "love", bg = "love", blend = 15 },
            StatusLineMode          = { fg   = "base", bg = "love" },
            StatusLineTerm          = { fg   = "love", bg = "love", blend = 15 },
            InclineNormal           = { fg   = "love", bg = "love", blend = 15 },
            InclineNormalNC         = { fg   = "love", bg = "love", blend = 15 },
            BlinkCmpSource          = { bg   = "none" },
            TelescopeSelection      = { link = "PmenuSel" },
            Folded                  = { link = "Comment" },
            -- NormalFloat             = { link = "Normal" },
            FloatBorder             = {
               fg = "surface",
               bg = transparency and "none" or "surface"
            },
            FloatTitle              = {
               fg = "base",
               bg = transparency and "none" or "foam"
            },
            WhichKeyBorder          = { link = "FloatBorder" },
            SnacksDashboardTitle    = { fg = "rose" },
            NoiceCmdline            = { link = "StatusLine" },
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
