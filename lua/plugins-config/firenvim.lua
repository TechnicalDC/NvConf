
vim.cmd([[
let g:firenvim_config = { 
	\ 'globalSettings': {
		\ 'alt': 'all',
	\  },
	\ 'localSettings': {
		\ '.*': {
			\ 'cmdline': 'neovim',
			\ 'content': 'text',
			\ 'priority': 0,
			\ 'selector': 'textarea',
			\ 'takeover': 'always',
		\ },
		\ 'https?://.*\.chatovod\.com/.*': {
			\ 'cmdline': 'neovim',
			\ 'content': 'text',
			\ 'priority': 0,
			\ 'selector': 'textarea',
			\ 'takeover': 'never',
		\ },
	\ }
\ }
]])
