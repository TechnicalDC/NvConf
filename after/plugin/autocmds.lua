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

-- autocmd("ColorScheme", {
--    group = vim.api.nvim_create_augroup("wezterm_colorscheme", { clear = true }),
--    callback = function(args)
--       local color_scheme = require('base16-colorscheme').colors
--       if not color_scheme then
--          return
--       end
--
--       -- exporting ColorScheme to custom wezterm module
--       local filename = ""
--       if vim.fn.has("win32") == 1 then
--          filename = vim.fn.expand("~\\.wezterm\\colors.lua")
--       else
--          filename = vim.fn.expand("~/.config/wezterm/colors.lua")
--       end
--
--       assert(type(filename) == "string")
--       local file = io.open(filename, "w")
--       assert(file)
--       file:write("return " ..  vim.inspect(color_scheme))
--       file:close()
--    end,
-- })
