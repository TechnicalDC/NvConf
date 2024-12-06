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
autocmd('User', {
   pattern = 'MiniFilesWindowOpen',
   callback = function(args)
      local win_id = args.data.win_id

      -- Customize window-local settings
      local config = vim.api.nvim_win_get_config(win_id)
      config.border, config.title_pos = 'rounded', 'left'
      vim.api.nvim_win_set_config(win_id, config)
   end,
})
autocmd('User', {
   pattern = 'MiniFilesWindowUpdate',
   callback = function(args)
      local config = vim.api.nvim_win_get_config(args.data.win_id)

      -- Ensure fixed height
      config.height = 15

      -- Ensure title padding
      if config.title[#config.title][1] ~= ' ' then
         table.insert(config.title, { ' ', 'NormalFloat' })
      end
      if config.title[1][1] ~= ' ' then
         table.insert(config.title, 1, { ' ', 'NormalFloat' })
      end

      vim.api.nvim_win_set_config(args.data.win_id, config)
   end,
})
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
      print("autocmd")
      vim.opt_local.statuscolumn = ""
end})

