return {
	"SmiteshP/nvim-navic",
	config = function ()
		local navic = require("nvim-navic")

		navic.setup {
			icons = {
				Array         = "󰅪 ",
				Boolean       = "◩ ",
				Class         = "󰌗 ",
				Constant      = "󰏿 ",
				Constructor   = " ",
				Enum          = "",
				EnumMember    = " ",
				Event         = " ",
				Field         = " ",
				File          = "󰈙 ",
				Function      = "󰊕 ",
				Interface     = " ",
				Key           = "󰌋 ",
				Method        = "m ",
				Module        = " ",
				Namespace     = " ",
				Null          = "󰟢 ",
				Number        = "󰎠 ",
				Object        = "󰅩 ",
				Operator      = "󰆕 ",
				Package       = " ",
				Property      = " ",
				String        = "󰀬 ",
				Struct        = " ",
				TypeParameter = "󰊄 ",
				Variable      = "󰆧 ",
			},
			lsp = {
				auto_attach = false,
				preference = nil,
			},
			highlight = false,
			separator = " > ",
			depth_limit = 0,
			depth_limit_indicator = "..",
			safe_output = true,
			click = false
		}
	end
}
