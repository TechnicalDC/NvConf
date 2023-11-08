return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	enabled = false,
	config = function ()
		require("ibl").setup({
			indent = {
				char = "▏",
				smart_indent_cap = true,
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
					"dashboard",
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
