
vim.g.mapleader = " "

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Toggle File Tree
map("n", "<leader>tt", ":NvimTreeToggle<CR>", opts)

-- Remap splits navigation to just ( Ctrl + hjkl)
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Keybindings for split resizing
map("n", "<A-l>", ":vertical resize +2<CR>", opts)
map("n", "<A-h>", ":vertical resize -2<CR>", opts)
map("n", "<A-k>", ":resize +2<CR>", opts)
map("n", "<A-j>", ":resize -2<CR>", opts)

-- Search highlighting
map("n", "/", ":lua vim.o.hlsearch = true<CR>/", opts)
map("n", "<Esc>", ":lua vim.o.hlsearch = false<CR>", opts)

