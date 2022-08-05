
vim.g.mapleader = " "

local map = vim.api.nvim_set_keymap
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

-- Cycle through buffers
map("n", "<A-C>", ":bprevious<CR>", opts)
map("n", "<A-c>", ":bnext<CR>", opts)

-- Rotate splits
-- Horizontal to vertical
map("n", "<leader>tv", "<C-w>t<C-w>H", opts)
-- Vertical to horizontal
map("n", "<leader>th", "<C-w>t<C-w>K", opts)

-- Toggle File Tree
map("n", "<leader>tt", ":NvimTreeToggle<CR>", opts)

-- Telescope
map("n", "<A-f>", ":Telescope find_files<CR>", opts)
map("n", "<A-b>", ":Telescope buffers<CR>", opts)
map("n", "<A-g>", ":Telescope git_status<CR>", opts)

-- Git Signs
map("n", "<A-S-g>", ":Gitsigns stage_buffer<CR>", opts)

-- Remap splits navigation to just ( Ctrl + hjkl)
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)
map("n", "<A-t>", "<C-w>T", opts)

-- Keybindings for split resizing
map("n", "<A-l>", ":vertical resize +2<CR>", opts)
map("n", "<A-h>", ":vertical resize -2<CR>", opts)
map("n", "<A-k>", ":resize +2<CR>", opts)
map("n", "<A-j>", ":resize -2<CR>", opts)

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
