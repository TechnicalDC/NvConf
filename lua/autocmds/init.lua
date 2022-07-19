
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
local autocmd = vim.api.nvim_create_autocmd

-- Vertically center documents when in insert mode
autocmd({"InsertEnter"},{pattern = {"*"}, command = "norm zz" })

-- Dashboard
autocmd({"FileType"}, 
	{
		pattern = "dashboard", 
		command = ':lua vim.api.nvim_set_keymap("n", "<leader>ff", ":Telescope find_files<CR>", { noremap = true, silent = true })'
	}
)
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

-- Telescope
autocmd({"FileType"}, 
	{
		pattern = "TelescopePrompt", 
		command = 'IndentBlanklineDisable'
	}
)
