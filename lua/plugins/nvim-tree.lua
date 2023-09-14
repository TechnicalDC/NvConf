return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = true,
	dependencies = {
		'kyazdani42/nvim-web-devicons'
	},
	keys = {
		{ "<leader>tt", "<cmd>NvimTreeToggle<cr>", desc = "Open vimwiki homepage" },
	},
	config = function()
		require("nvim-tree").setup {
			sort_by = "case_sensitive",
			view = {
				width = 30,
			},
			renderer = {
				group_empty = true,
			},
			filters = {
				dotfiles = true,
			},}
		end,
	}
