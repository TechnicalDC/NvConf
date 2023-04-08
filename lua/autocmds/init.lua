local map = vim.api.nvim_set_keymap
local autocmd = vim.api.nvim_create_autocmd

-- Vertically center documents when in insert mode
autocmd({"InsertEnter"},{pattern = {"*"}, command = "norm zz" })

autocmd({"BufEnter","BufNewfile"},{pattern = {"*.tex"}, command = "set filetype=tex"})

-- Dashboard {{{
autocmd({"FileType"}, 
	{
		pattern = "dashboard", 
		command = ':lua vim.api.nvim_set_keymap("n", "<leader>ff", ":Telescope find_files<CR>", { noremap = true, silent = true })'
	}
)
-- autocmd({"FileType"}, 
-- 	{
-- 		pattern = "dashboard", 
-- 		command = ':lua vim.api.nvim_set_keymap("n", "<leader>fb", ":Telescope find_browser<CR>", { noremap = true, silent = true })'
-- 	}
-- )
autocmd({"FileType"}, 
	{
		pattern = "dashboard", 
		command = ':lua vim.api.nvim_set_keymap("n", "<leader>fh", ":Telescope oldfiles<CR>", { noremap = true, silent = true })'
	}
)
autocmd({"FileType"}, 
	{
		pattern = "dashboard", 
		command = ':lua vim.api.nvim_set_keymap("n", "<leader>cn", ":DashboardNewFile<CR>", { noremap = true, silent = true })'
	}
)
autocmd({"FileType"}, 
	{
		pattern = "dashboard", 
		command = ':lua vim.api.nvim_set_keymap("n", "q", ":q!<CR>", { noremap = true })'
	}
)
-- }}}

-- Telescope {{{
autocmd({"FileType"}, 
	{
		pattern = "TelescopePrompt", 
		command = 'IndentBlanklineDisable'
	}
)
-- }}}

-- Barbar {{{
-- autocmd('BufWinEnter', {
--   pattern = '*',
--   callback = function()
--     if vim.bo.filetype == 'NvimTree' then
--       require'bufferline.api'.set_offset(31, 'FileTree')
--     end
--   end
-- })
--
-- autocmd('BufWinLeave', {
--   pattern = '*',
--   callback = function()
--     if vim.fn.expand('<afile>'):match('NvimTree') then
--       require'bufferline.api'.set_offset(0)
--     end
--   end
-- })
-- -- }}}
