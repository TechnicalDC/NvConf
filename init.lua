---@diagnostic disable: undefined-global
--      							__           
-- .-----.-----.-----.--.--.|__|.--------.
-- |     |  -__|  _  |  |  ||  ||        |
-- |__|__|_____|_____|\___/ |__||__|__|__|
-- 
-- Github: https://github.com/TechnicalDC/NvConf

-- REQUIRED
vim.g.mapleader		= " "
vim.g.maplocalleader = " "

-- LAZY BOOTSTRAP
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup("plugins")

-- REQUIRED
require("options")
require("highlights")
require("mappings")
require("autocmds")

vim.cmd.colorscheme("onedark")
