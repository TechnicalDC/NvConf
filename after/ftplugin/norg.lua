---@diagnostic disable: undefined-global
local ok, wk = pcall(require, 'which-key')
local set = vim.opt

-- vim.opt.foldcolumn		= "3"
set.listchars	  = "tab:  "

-- if ok then
--    wk.add({
--       {
--          mode =  "n",
--          {"<leader>tc", "<cmd>Neorg toc right<cr>" , desc = "Open Neorg TOC" }
--       }
--    })
-- end
