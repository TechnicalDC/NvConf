---@diagnostic disable: undefined-global
local autocmd = vim.api.nvim_create_autocmd

-- autocmd("ColorScheme", {
-- 	callback = function ()
-- 		require("technicaldc.highlights")
-- 	end
-- })

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

-- Auto resize the split on window resize
autocmd("VimResized", {
   callback = function ()
      vim.cmd("tabdo wincmd =")
   end
})

-- Create directories when saving files
autocmd("BufWritePre", {
   callback = function ()
      local dir = vim.fn.expand('<afile>:p:h')
      if vim.fn.isdirectory(dir) == 0 then
         vim.fn.mkdir(dir, 'p')
      end
   end
})
