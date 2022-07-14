return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use 'kyazdani42/nvim-web-devicons'
	use 'glepnir/dashboard-nvim'
	use 'ethanholz/nvim-lastplace'
	use 'neovim/nvim-lspconfig'
	use "lukas-reineke/indent-blankline.nvim"
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}
	use 'folke/tokyonight.nvim'
	use 'nvim-lualine/lualine.nvim'
	use 'kyazdani42/nvim-tree.lua'
	use 'romgrk/barbar.nvim'
end)
