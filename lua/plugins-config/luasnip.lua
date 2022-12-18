local ls = require("luasnip")
local types = require("luasnip.util.types")

-- For linux
require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/snippets/" })

-- For windows
-- require("luasnip.loaders.from_lua").load({ paths = "~/Appdata/Local/nvim/snippets/" })

ls.config.set_config({
	store_selection_keys = '<C-s>',
	history = true, -- keep around last snippet local to jump back
	updateevents = "TextChanged,TextChangedI", -- update changes as you type
	enable_autosnippets = true,
	ext_opts = {
		[types.choiceNode] = {
			active = {
				virt_text = { { "●", "GruvboxOrange" } },
			},
		},
	},
})
