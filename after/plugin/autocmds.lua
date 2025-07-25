---@diagnostic disable: undefined-global
local autocmd = vim.api.nvim_create_autocmd

autocmd("ColorScheme", {
	callback = function ()
		-- print("Colorscheme")
		require("technicaldc.highlights")
	end
})

-- Vertically center documents when in insert mode
autocmd(
	{"InsertEnter"},
	{pattern = {"*"}, command = "norm zz" }
)

-- Highlight when yanking (copying) text
autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Make all floating window border rounded
autocmd('User', {
   pattern = 'WinNew',
   callback = function(args)
      local win_id = args.data.win_id

      -- Customize window-local settings
      local config = vim.api.nvim_win_get_config(win_id)
      config.border = 'rounded'
      vim.api.nvim_win_set_config(win_id, config)
   end,
})
