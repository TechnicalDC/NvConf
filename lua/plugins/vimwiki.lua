return {
	'vimwiki/vimwiki',
	enabled = true,
	lazy = true,
	keys = {
		{ "<leader>ww", "<cmd>VimwikiIndex<cr>", desc = "Open vimwiki homepage" },
		{ "<leader>wi", "<cmd>VimwikiDiaryIndex<cr>", desc = "Open vimwiki diary" },
	},
	init = function ()

		-- Work Wiki Setup
		local path = {}
		path.work = {
			path = '~/Documents/My Docs/',
			auto_diary_index = 1,
			list_margin = 0,
		}
		path.home = {
			path = '~/VimWiki/',
			auto_diary_index = 1,
			list_margin = 0,
		}

		vim.g.vimwiki_list = { path.work }
	end
}
