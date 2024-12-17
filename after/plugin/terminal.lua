---@diagnostic disable: undefined-global
local autocmd = vim.api.nvim_create_autocmd

autocmd('TermOpen', {
  desc = 'Autocmd for terminal',
  group = vim.api.nvim_create_augroup('custom-terminal', { clear = true }),
  callback = function()
     vim.opt_local.statuscolumn = ""
     vim.opt_local.number = false
     vim.opt_local.relativenumber = false
  end,
})

vim.keymap.set('n', '<leader>tt', function ()
   vim.cmd.new()
   vim.cmd.terminal()
end, { desc = "Toggle built-in terminal" })
