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
            WinBar                  = { bg   = "none" },
            WinBarNC                = { bg   = "none" },
            BlinkCmpSource          = { bg   = "none" },
            TelescopeSelection      = { link = "PmenuSel" },
         },
      })
   end
}
