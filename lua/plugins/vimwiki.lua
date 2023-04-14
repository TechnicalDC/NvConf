return {
	'vimwiki/vimwiki',
	enabled = true,
	init  = function ()
		-- Work Wiki Setup
		local work = {
			path = '~/Documents/My Docs/',
			auto_diary_index = 1,
			list_margin = 0,
		}
		vim.g.vimwiki_list = { work }
	end
}
