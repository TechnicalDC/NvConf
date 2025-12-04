-- lua/plugins/rose-pine.lua
return {
   "rose-pine/neovim",
   name = "rose-pine",
   config = function()
      require("rose-pine").setup({
         styles = {
            transparency = true,
         },
         highlight_groups = {
            StatusLine              = { fg   = "love", bg = "love", blend = 15 },
            StatusLineMode          = { fg   = "base", bg = "love" },
            StatusLineTerm          = { fg   = "love", bg = "love", blend = 15 },
            TelescopeBorder         = { fg   = "highlight_high", bg = "none" },
            TelescopeNormal         = { bg   = "none" },
            TelescopePromptNormal   = { bg   = "base" },
            TelescopeResultsNormal  = { fg   = "subtle", bg = "none" },
            TelescopeSelectionCaret = { fg   = "rose", bg = "none" },
            BlinkCmpSource          = { bg   = "none" },
            TelescopeSelection      = { link = "PmenuSel" },
            NormalFloat             = { link = "Normal" },
            FloatBorder             = { bg   = "none" },
            FloatTitle              = { bg   = "none" },
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
