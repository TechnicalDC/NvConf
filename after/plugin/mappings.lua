---@diagnostic disable: undefined-global
local map = vim.keymap.set
local opts = { noremap = true, silent = true }
-- local extra_opts = { noremap = true, silent = true, expr = true }

local ok, wk = pcall(require, 'which-key')
if not ok then
   return nil
end

wk.add({
   {
      mode = "n",
      { "<leader>Y", "maggVGy`a",                       desc = "Copy entire content"},
      { "<leader>s", ":setlocal spell!<CR>",            desc = "Toggle spell checker"},
      { "Y",         "y$",                              desc = "Copy text till end of line"},
      { "<BS>",      "^",                               desc = "Move to first non-blank character"},
      { "gb",        ":bnext<cr>",                      desc = "Jump to next buffer"},
      { "gB",        ":bprevious<cr>",                  desc = "Jump to previous buffer"},
      {"<Esc>",      ":lua vim.o.hlsearch = false<CR>", desc = "Disable incremental search highlighting"},

      -- Quickfix
      { "<leader>co", "<cmd>copen<cr>",  desc = "Open quickfix list"},
      { "<leader>cc", "<cmd>cclose<cr>", desc = "Close quickfix list"},
      { "<leader>cf", "<cmd>cfirst<cr>", desc = "Go to first item in quickfix list"},
      { "<leader>cl", "<cmd>clast<cr>",  desc = "Go to last item in quickfix list"},
      { "<leader>cn", "<cmd>cnext<cr>",  desc = "Go to next item in quickfix list"},
      { "<leader>cp", "<cmd>cprev<cr>",  desc = "Go to previous item in quickfix list"},

      { "<A-=>", "<C-w>=", desc = "Equal the split size" },
      { "<leader>dt", "<cmd>diffthis<CR>", desc = "Toggle diff for current buffer" },
      { "<leader>th", "<C-w>t<C-w>K",      desc = "Turn vertical splits to horizontal" },
      { "<leader>tv", "<C-w>t<C-w>H",      desc = "Turn horizontal splits to vertical" },
   },
   {
      mode = "v",
      { "<", "<gv", desc = "Indent inwards"},
      { ">", ">gv", desc = "Indent outwards"},
   }
})

-- luasnip mapping
map("i", "<c-j>", "<cmd>lua require'luasnip'.jump(1)<CR>", opts)
map("i", "<c-k>", "<cmd>lua require'luasnip'.jump(-1)<CR>", opts)
map("s", "<c-j>", "<cmd>lua require'luasnip'.jump(1)<CR>", opts)
map("s", "<c-k>", "<cmd>lua require'luasnip'.jump(-1)<CR>", opts)

map("i", "<c-n>", "<cmd>lua require'luasnip'.change_choice(1)<cr>", opts)
map("i", "<c-p>", "<cmd>lua require'luasnip'.change_choice(-1)<cr>", opts)
map("s", "<c-n>", "<cmd>lua require'luasnip'.change_choice(1)<cr>", opts)
map("s", "<c-p>", "<cmd>lua require'luasnip'.change_choice(-1)<cr>", opts)


-- TMUX {{{
-- map("n", "<C-h>", ":lua require('tmux').move_left()<CR>", opts)
-- map("n", "<C-j>", ":lua require('tmux').move_bottom()<CR>", opts)
-- map("n", "<C-k>", ":lua require('tmux').move_top()<CR>", opts)
-- map("n", "<C-l>", ":lua require('tmux').move_right()<CR>", opts)
--
-- map("n", "<A-l>", ":lua require('tmux').resize_right()<CR>", opts)
-- map("n", "<A-h>", ":lua require('tmux').resize_left()<CR>", opts)
-- map("n", "<A-k>", ":lua require('tmux').resize_top()<CR>", opts)
-- map("n", "<A-j>", ":lua require('tmux').resize_bottom()<CR>", opts)
-- -- }}}

-- SMART SPLITS {{{{
vim.keymap.set('n', '<A-h>', require('smart-splits').resize_left)
vim.keymap.set('n', '<A-j>', require('smart-splits').resize_down)
vim.keymap.set('n', '<A-k>', require('smart-splits').resize_up)
vim.keymap.set('n', '<A-l>', require('smart-splits').resize_right)
-- moving between splits
vim.keymap.set('n', '<C-h>', require('smart-splits').move_cursor_left)
vim.keymap.set('n', '<C-j>', require('smart-splits').move_cursor_down)
vim.keymap.set('n', '<C-k>', require('smart-splits').move_cursor_up)
vim.keymap.set('n', '<C-l>', require('smart-splits').move_cursor_right)
-- swapping buffers between windows
-- vim.keymap.set('n', '<leader><leader>h', require('smart-splits').swap_buf_left)
-- vim.keymap.set('n', '<leader><leader>j', require('smart-splits').swap_buf_down)
-- vim.keymap.set('n', '<leader><leader>k', require('smart-splits').swap_buf_up)
-- vim.keymap.set('n', '<leader><leader>l', require('smart-splits').swap_buf_right)
-- }}}}

-- Moving text
map("i", "<A-S-j>", "<Esc>:m .+1<CR>==i", opts)
map("i", "<A-S-k>", "<Esc>:m .-2<CR>==i", opts)

