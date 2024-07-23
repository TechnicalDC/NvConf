return {
	"tpope/vim-fugitive",
	enabled = false,
	lazy = false,
	config = function ()
		local map = vim.keymap.set
		local opts = { noremap = true, silent = true }

		local ok, wk = pcall(require, 'which-key')
		if not ok then
			return nil
		end

		wk.register({
			["<leader>"] = {
				g = {
					a = { "<cmd>Git add %<cr>", "Add the file/changes"},
					s = { "<cmd>Git stage %<cr>", "Stage the file/changes"},
					c = { function ()
						vim.ui.input({ prompt = 'Commit message:', default = 'Committed on ' .. os.date('%d-%m-%y') }, function(input)
							vim.cmd("Git commit -m '" .. input .. "'")
						end)
					end, "Commit the changes"},
					p = { "<cmd>Git push<cr>", "Push the changes"},
					P = { "<cmd>Git pull<cr>", "Pull the latest changes"},
				},
			}
		})
	end
}
