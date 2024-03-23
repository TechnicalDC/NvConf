---@diagnostic disable: undefined-global
local autocmd = vim.api.nvim_create_autocmd

-- Vertically center documents when in insert mode
autocmd(
	{"InsertEnter"},
	{pattern = {"*"}, command = "norm zz" }
)
autocmd(
	{"BufEnter","BufNewfile"},
	{pattern = {"*.tex"}, command = "set filetype=tex"}
)
autocmd(
	{"BufEnter","BufNewfile"},
	{pattern = {"*.md"}, command = "set filetype=markdown"}
)
autocmd(
	{"BufEnter","BufNewfile"},
	{pattern = {"*.i","*.cls","*.p"}, command = "set filetype=progress"}
)
autocmd(
	{"BufEnter","BufNewfile"},
	{pattern = {"*.i","*.cls","*.p"}, command = "set commentstring=\\ /*\\ %s\\ */"}
)
autocmd({'BufWritePre'},{
	pattern = "*",
	command = [[%s/\s\+$//e]],
})

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
