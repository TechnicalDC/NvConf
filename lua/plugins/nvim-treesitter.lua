return {
	'nvim-treesitter/nvim-treesitter',
	build = ':TSUpdate',
	init = function ()
		local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
		parser_config.abl = {
			install_info = {
				url = "https://github.com/usagi-coffee/tree-sitter-abl", -- local path or git repo
				files = {"src/parser.c"}, -- note that some parsers also require src/scanner.c or src/scanner.cc
				-- optional entries:
				branch = "master", -- default branch in case of git repo if different from master
				generate_requires_npm = false, -- if stand-alone parser without npm dependencies
				requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
			},
			filetype = "progress", -- if filetype does not match the parser name
		}
	end,
	config = function ()
		require'nvim-treesitter.configs'.setup {
			-- A list of parser names, or "all"
			ensure_installed = { "c", "lua", "python", "json", "http"},

			-- Install parsers synchronously (only applied to `ensure_installed`)
			sync_install = false,

			-- Automatically install missing parsers when entering buffer
			auto_install = true,

			-- List of parsers to ignore installing (for "all")
			ignore_install = { "javascript" },

			highlight = {
				-- `false` will disable the whole extension
				enable = true,

				-- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
				-- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
				-- the name of the parser)
				-- list of language that will be disabled
				disable = { "c", "rust" },

				-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
				-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
				-- Using this option may slow down your editor, and you may see some duplicate highlights.
				-- Instead of true it can also be a list of languages
				additional_vim_regex_highlighting = {"org"},
			},
			incremental_selection = {
				disable = {},
				enable = true,
				keymaps = {
					init_sclection = "gnn",
					node_decremental = "grm",
					node_incremental = "grn",
					scope_incremental = "grc"
				},
				module_path = "nvim-treesitter.incremental_selection"
			},
		}

	end
}
