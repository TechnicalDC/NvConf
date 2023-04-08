return {
	"catppuccin/nvim",
	'Mofiqul/dracula.nvim',
	'folke/tokyonight.nvim',
	'navarasu/onedark.nvim',
	'Shatur/neovim-ayu',
	lazy = false,
	config = function ()
		require('ayu').setup({
			mirage = true, -- Set to `true` to use `mirage` variant instead of `dark` for dark background.
			overrides = {}, -- A dictionary of group names, each associated with a dictionary of parameters (`bg`, `fg`, `sp` and `style`) and colors in hex.
		})
		-- vim.cmd.colorscheme("ayu")
	end
}
