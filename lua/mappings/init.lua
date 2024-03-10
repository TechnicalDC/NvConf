
local map = vim.keymap.set
local opts = { noremap = true, silent = true }
local extra_opts = { noremap = true, silent = true, expr = true }

-- luasnip mapping
map("i", "<c-j>", "<cmd>lua require'luasnip'.jump(1)<CR>", opts)
map("i", "<c-k>", "<cmd>lua require'luasnip'.jump(-1)<CR>", opts)
map("s", "<c-j>", "<cmd>lua require'luasnip'.jump(1)<CR>", opts)
map("s", "<c-k>", "<cmd>lua require'luasnip'.jump(-1)<CR>", opts)

map("i", "<c-n>", "<cmd>lua require'luasnip'.change_choice(1)<cr>", opts)
map("i", "<c-p>", "<cmd>lua require'luasnip'.change_choice(-1)<cr>", opts)
map("s", "<c-n>", "<cmd>lua require'luasnip'.change_choice(1)<cr>", opts)
map("s", "<c-p>", "<cmd>lua require'luasnip'.change_choice(-1)<cr>", opts)

-- Must have
map("n", "Y", "y$", opts)
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)
map("n", "<leader>y", "maggVGy`a", opts)

-- Jumplist mutation
map("n", "j", "(v:count > 5 ? \"m'\" . v:count : \"\") . 'j'", extra_opts)
map("n", "k", "(v:count > 5 ? \"m'\" . v:count : \"\") . 'k'", extra_opts)

-- Rotate splits
-- Horizontal to vertical
map("n", "<leader>tv", "<C-w>t<C-w>H", opts)
-- Vertical to horizontal
map("n", "<leader>th", "<C-w>t<C-w>K", opts)

-- Git Signs
map("n", "<A-S-g>", ":Gitsigns stage_buffer<CR>", opts)

-- Remap splits navigation to just ( Ctrl + hjkl)
-- map("n", "<C-h>", "<C-w>h", opts)
-- map("n", "<C-j>", "<C-w>j", opts)
-- map("n", "<C-k>", "<C-w>k", opts)
-- map("n", "<C-l>", "<C-w>l", opts)
map("n", "<A-t>", "<C-w>T", opts)
map("n", "<A-=>", "<C-w>=", opts)

-- mapping for navigating buffers
map("n", "gb", "<cmd>bnext<CR>", opts)
map("n", "gB", "<cmd>bprevious<CR>", opts)

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

-- Keybindings for split resizing
-- map("n", "<A-l>", ":vertical resize +2<CR>", opts)
-- map("n", "<A-h>", ":vertical resize -2<CR>", opts)
-- map("n", "<A-k>", ":resize +2<CR>", opts)
-- map("n", "<A-j>", ":resize -2<CR>", opts)

-- Search highlighting
map("n", "/", ":lua vim.o.hlsearch = true<CR>/", opts)
map("n", "<Esc>", ":lua vim.o.hlsearch = false<CR>", opts)

-- Keeping it centered
map("n", "n", "nzzzv", opts)
map("n", "N", "Nzzzv", opts)
map("n", "}", "}zzzv", opts)
map("n", "{", "{zzzv", opts)
map("n", "J", "mzJ`z", opts)

-- Moving text
map("v", "J", ":m '>+1<CR>gv=gv", opts)
map("v", "K", ":m '<-2<CR>gv=gv", opts)
map("n", "<leader>j", ":m .+1<CR>==", opts)
map("n", "<leader>k", ":m .-2<CR>==", opts)
map("i", "<A-S-j>", "<Esc>:m .+1<CR>==i", opts)
map("i", "<A-S-k>", "<Esc>:m .-2<CR>==i", opts)

-- Enable and disable spell checker
map("n", "<leader>s", ":setlocal spell!<CR>", opts)

map("n", "<leader>co", "<cmd>copen<CR>", opts)
map("n", "<leader>cc", "<cmd>cclose<CR>", opts)
map("n", "<leader>cf", "<cmd>cfirst<CR>", opts)
map("n", "<leader>cl", "<cmd>clast<CR>", opts)
map("n", "<leader>cn", "<cmd>cnext<CR>", opts)
map("n", "<leader>cp", "<cmd>cprev<CR>", opts)

-- TODO Comments
-- map("n", "]t", function()
--   require("todo-comments").jump_next()
-- end, opts)
-- map("n", "[t", function()
--   require("todo-comments").jump_prev()
-- end, opts)

map("n", "<leader>dt", "<cmd>diffthis<CR>", opts)
