-- • left aligned solid
--   • `▏`
--   • `▎` (default)
--   • `▍`
--   • `▌`
--   • `▋`
--   • `▊`
--   • `▉`
--   • `█`
-- • center aligned solid
--   • `│`
--   • `┃`
-- • right aligned solid
--   • `▕`
--   • `▐`
-- • center aligned dashed
--   • `╎`
--   • `╏`
--   • `┆`
--   • `┇`
--   • `┊`
--   • `┋`
-- • center aligned double
--   • `║`

return {
   "lukas-reineke/indent-blankline.nvim",
   main = "ibl",
   enabled = true,
   config = function ()
      require("ibl").setup({
         indent = {
            char = "│",
            smart_indent_cap = true,
         },
         whitespace = {
            remove_blankline_trail = true,
         },
         scope = { enabled = false },
         exclude = {
            filetypes = {
               "lspinfo",
               "packer",
               "checkhealth",
               "help",
               "dashboard",
               "man",
               "gitcommit",
               "TelescopePrompt",
               "TelescopeResults",
               "lazy",
               "alpha",
               "norg"
            }
         }
      })
   end
}
