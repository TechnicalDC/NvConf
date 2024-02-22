return {
	'nvim-treesitter/nvim-treesitter',
	build = ':TSUpdate',
	-- init = function ()
	-- 	local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
	-- 	parser_config.abl = {
	-- 		install_info = {
	-- 			url = "https://github.com/usagi-coffee/tree-sitter-abl", -- local path or git repo
	-- 			files = {"src/parser.c"}, -- note that some parsers also require src/scanner.c or src/scanner.cc
	-- 			-- optional entries:
	-- 			branch = "master", -- default branch in case of git repo if different from master
	-- 			generate_requires_npm = false, -- if stand-alone parser without npm dependencies
	-- 			requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
	-- 		},
	-- 		filetype = "progress", -- if filetype does not match the parser name
	-- 	}
	-- end,
	config = function ()
		require'nvim-treesitter.configs'.setup {
			-- A list of parser names, or "all"
			ensure_installed = { "lua", "python", "json", "http", "typescript" },
			sync_install = false,
			auto_install = true,
			ignore_install = { "javascript" },

			highlight = {
				-- `false` will disable the whole extension
				enable = true,
				disable = { "c", "rust" },
				additional_vim_regex_highlighting = {"org"},
			},
			incremental_selection = {
				disable = {},
				enable = true,
				keymaps = {
					init_selection = "gnn",
					node_decremental = "grm",
					node_incremental = "grn",
					scope_incremental = "grc"
				},
				module_path = "nvim-treesitter.incremental_selection"
			},
		}
	end
}
