---@diagnostic disable: undefined-global
local autocmd = vim.api.nvim_create_autocmd

-- Vertically center documents when in insert mode
autocmd(
	{"InsertEnter"},
	{pattern = {"*"}, command = "norm zz" }
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

-- MINI FILES {{{
-- }}}
-- MINI INDENT {{{
autocmd({"Filetype"}, {
   pattern = {"dashboard"},
   callback = function (args)
      vim.b.miniindentscope_disable = true
   end
})
-- }}}
autocmd("User",{
   pattern = "MiniStarterOpened",
   callback = function(args)
      vim.opt_local.statuscolumn = ""
end})

