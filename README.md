<div class="class" align="center">
	<image class="banner" src="images/banner.png" style="width:400px;height:auto;">

My own lua based [neovim](https://neovim.org/) configuration.
</div>

## Plugins

* dashboard-nvim
* packer.nivm
* nvim-lastplace
* nvim-autopairs
* nvim-lspconfig
* lualine
* nvim-tree
* gitsigns
* bufferline
* telescope
* telescope-ui-select.nvim
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
* nvim-surround
* plenary.nvim
* neorg
* emmet-vim

## Colorschemes

* nvim-base16

## Installation
```bash
git clone https://github.com/TechnicalDC/NvConf ~/.config/nvim

# Unix-like
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
 
# Windows
git clone https://github.com/wbthomason/packer.nvim "$env:LOCALAPPDATA\nvim-data\site\pack\packer\start\packer.nvim"
```

After intalling `packer.nvim`, open nvim and run `:PackerSync` to install the plugins.

> Note: On first run, it will give errors but after running `PackerSync` it will launch without any error.

## Screenshots

![neovim](https://github.com/TechnicalDC/NvConf/blob/main/images/neovim.gif)
