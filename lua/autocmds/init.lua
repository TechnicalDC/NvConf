
local autocmd = vim.api.nvim_create_autocmd

-- Vertically center documents when in insert mode
autocmd({"InsertEnter"},{pattern = {"*"}, command = "norm zz" })
