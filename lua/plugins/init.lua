return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

	-- colorschemes
	use 'navarasu/onedark.nvim'
	use 'Mofiqul/dracula.nvim'
	use 'folke/tokyonight.nvim'
	use 'AlphaTechnolog/pywal.nvim'
	use "ellisonleao/gruvbox.nvim"
	use "catppuccin/nvim"

	-- UI
	use 'kyazdani42/nvim-web-devicons'
	use 'glepnir/dashboard-nvim'
	use 'rcarriga/nvim-notify'
	use 'nvim-lualine/lualine.nvim'
	use 'kyazdani42/nvim-tree.lua'
	use 'lewis6991/gitsigns.nvim'
	use 'romgrk/barbar.nvim'

	-- autocompletions
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'

	use 'ethanholz/nvim-lastplace'
	use 'numToStr/Comment.nvim'
	use 'neovim/nvim-lspconfig'
	use "lukas-reineke/indent-blankline.nvim"
	use "kylechui/nvim-surround"
	use 'nvim-orgmode/orgmode'
	use 'nvim-lua/plenary.nvim'
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}
	use 'nvim-telescope/telescope.nvim'
end)

