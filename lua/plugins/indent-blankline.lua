return {
	"lukas-reineke/indent-blankline.nvim",
	config = function ()
		require("indent_blankline").setup {
			-- for example, context is off by default, use this to turn it on
			show_current_context = false,
			show_current_context_start = false,
		}
	end
}
