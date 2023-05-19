return {
	'Shatur/neovim-ayu',
	lazy = true,
	config = function ()
		local colors = require('ayu.colors')
		colors.generate() -- Pass `true` to enable mirage
		require('ayu').setup({
			mirage = true, -- Set to `true` to use `mirage` variant instead of `dark` for dark background.
			overrides = {
				PmenuSel = {link = "lualine_a_insert"},
				TelescopeSelection = {link = "lualine_a_insert"},
				TelescopePromptBorder = { fg = "" },
				BufferTabpages = {link = "lualine_a_visual"},
			}, -- A dictionary of group names, each associated with a dictionary of parameters (`bg`, `fg`, `sp` and `style`) and colors in hex.
		})
	end
}
