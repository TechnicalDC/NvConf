---@diagnostic disable: undefined-doc-name
return {
	"folke/noice.nvim",
	dependencies = {
		'stevearc/dressing.nvim',
		"MunifTanjim/nui.nvim",
		'rcarriga/nvim-notify'
	},
	enabled = true,
	config = function ()
		require("plugins.ui-configs.dressing")
		require("plugins.ui-configs.noice-ui")
		require("plugins.ui-configs.notify")
	end
}
