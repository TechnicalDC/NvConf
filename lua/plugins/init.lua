return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use 'kyazdani42/nvim-web-devicons'
	use 'glepnir/dashboard-nvim'
	use 'ethanholz/nvim-lastplace'
	use 'neovim/nvim-lspconfig'
	use 'lewis6991/gitsigns.nvim'
	use 'nvim-orgmode/orgmode'
	use 'rcarriga/nvim-notify'
	use "lukas-reineke/indent-blankline.nvim"
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}
	use 'folke/tokyonight.nvim'
	use 'AlphaTechnolog/pywal.nvim'
	use {
		'nvim-telescope/telescope.nvim',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	use 'nvim-lualine/lualine.nvim'
	use 'kyazdani42/nvim-tree.lua'
	use 'romgrk/barbar.nvim'
end)
