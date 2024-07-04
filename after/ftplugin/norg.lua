---@diagnostic disable: undefined-global
local ok, wk = pcall(require, 'which-key')

-- vim.opt.foldcolumn		= "3"

if ok then
   wk.register({
      ["<leader>"] = {
         t = { c = { "<cmd>Neorg toc right<cr>" , "Open Neorg TOC" } }
      }
   })
end
