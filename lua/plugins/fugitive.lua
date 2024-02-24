return {
	"tpope/vim-fugitive",
	enabled = true,
	lazy = false,
	-- cmd = "Git",
	config = function ()
		local map = vim.keymap.set
		local opts = { noremap = true, silent = true }
		map("n","<leader>ga", "<cmd>Git add %<cr>", opts)
		map("n","<leader>gs", "<cmd>Git stage %<cr>", opts)
		map("n","<leader>gc", function ()
			vim.ui.input({ prompt = 'Commit message:', default = 'Committed on ' .. os.date('%d-%m-%y') }, function(input)
				vim.cmd("Git commit -m '" .. input .. "'")
			end)
		end, opts)
		map("n","<leader>gp", "<cmd>Git push<cr>", opts)
		map("n","<leader>gP", "<cmd>Git pull<cr>", opts)
	end
}
