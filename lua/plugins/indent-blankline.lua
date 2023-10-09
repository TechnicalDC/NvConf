return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	config = function ()
		require("ibl").setup({
			indent = {
				char = "▏",
				smart_indent_cap = false,
			},
			whitespace = {
				remove_blankline_trail = false,
			},
			scope = { enabled = false },
			exclude = {
				filetypes = {
					"lspinfo",
					"packer",
					"checkhealth",
					"help",
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
