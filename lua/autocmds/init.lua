local autocmd = vim.api.nvim_create_autocmd

-- Vertically center documents when in insert mode
autocmd({"InsertEnter"},{pattern = {"*"}, command = "norm zz" })

autocmd({"BufEnter","BufNewfile"},{pattern = {"*.tex"}, command = "set filetype=tex"})

-- Telescope {{{
autocmd({"FileType"},
	{
		pattern = "TelescopePrompt",
		command = 'IndentBlanklineDisable'
	}
)
-- }}}

