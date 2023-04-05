<div class="class" align="center">
	<image class="banner" src="images/banner.png" style="width:400px;height:auto;">

My own lua based [neovim](https://neovim.org/) configuration.
</div>

## Plugins

* alpha
* lazy.nvim
* nvim-autopairs
* mason.nvim
	- mason-lspconfig.nvim
	- nvim-lspconfig
* lualine
* noice.nvim
* nui.nvim
* nvim-tree
* gitsigns
* barbar
* telescope
	- telescope-ui-select.nvim
	- telescope-file-browser.nvim
* indent-blankline
* nvim-treesitter
* nvim-web-devicons
* nvim-notify
* gitsigns
* nvim-cmp
  - cmp-nvim-lsp
  - cmp-nvim-lua
  - cmp-buffer
  - cmp-path
  - cmp-cmdline
  - cmp_luasnip
* LuaSnip
* Comment.nvim
* plenary.nvim
* tmux.nvim
* emmet-vim

## Colorschemes

* [catppuccin](https://github.com/catppuccin/nvim)
* [dracula.nvim](https://github.com/Mofiqul/dracula.nvim)
* [tokyonight.nvim](https://github.com/folke/tokyonight.nvim)
* [onedark.nvim](https://github.com/navarasu/onedark.nvim)

## Installation
```bash
# Linux
git clone https://github.com/TechnicalDC/NvConf ~/.config/nvim

# Windows
git clone https://github.com/TechnicalDC/NvConf ~/Appdata/Local/nvim

# Unix-like
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
 
# Windows
git clone https://github.com/wbthomason/packer.nvim "$env:LOCALAPPDATA\nvim-data\site\pack\packer\start\packer.nvim"
```

After intalling `packer.nvim`, open nvim and run `:PackerSync` to install the plugins.

> Note: On first run, it will give errors but after running `PackerSync` it will launch without any error.

## Screenshots

![neovim](https://github.com/TechnicalDC/NvConf/blob/main/images/screenshot.png)
