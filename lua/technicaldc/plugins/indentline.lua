-- Alternatives: ~
-- • left aligned solid
-- • `▏`
-- • `▎` (default)
-- • `▍`
-- • `▌`
-- • `▋`
-- • `▊`
-- • `▉`
-- • `█`
-- • center aligned solid
-- • `│`
-- • `┃`
-- • right aligned solid
-- • `▕`
-- • `▐`
-- • center aligned dashed
-- • `╎`
-- • `╏`
-- • `┆`
-- • `┇`
-- • `┊`
-- • `┋`
-- • center aligned double
-- • `║`
--
--
return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
   event = { "BufReadPre", "BufNewFile" },
	config = function ()
		require("ibl").setup({
			indent = {
				char = "│",
				tab_char = "│",
			},
			whitespace = {
				remove_blankline_trail = false,
			},
			scope = { enabled = false },
			exclude = {
				filetypes = {
					"markdown"
				}
			}
		})
	end
}
