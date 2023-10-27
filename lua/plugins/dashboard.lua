return {
	'nvimdev/dashboard-nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	enabled = true,
	config = function()
		-- local theme = require('plugins.dashboard-theme.landing')
		local theme = require('plugins.dashboard-theme.hyper')
		require('dashboard').setup (theme)
	end,
}
