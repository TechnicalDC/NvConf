return {
	'vimwiki/vimwiki',
	enabled = true,
	init  = function ()
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

		vim.g.vimwiki_list = { path.home }
	end
}
