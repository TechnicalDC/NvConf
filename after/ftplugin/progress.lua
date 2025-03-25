---@diagnostic disable: undefined-global
local set = vim.opt_local
local ok, wk = pcall(require, 'which-key')
if not ok then
   return nil
end

-- OPTIONS
set.colorcolumn = "0"
set.conceallevel  = 1
set.tabstop       = 3
set.shiftwidth    = 3
set.softtabstop   = 3
set.commentstring = "/* %s */"
set.foldmarker     = ":,end"

-- MAPPING
wk.add({
   {
      mode = "n",
      { "<leader>ct", "mlA /*  */hhP`l", desc = "Add marker comment" }
   }
})
