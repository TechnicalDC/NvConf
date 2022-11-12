return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

	-- colorschemes
	use 'RRethy/nvim-base16'

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
	use 'hrsh7th/cmp-nvim-lua'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'saadparwaiz1/cmp_luasnip'
	use 'L3MON4D3/LuaSnip'

	use 'ethanholz/nvim-lastplace'
	use "windwp/nvim-autopairs"
	use 'numToStr/Comment.nvim'
	use 'neovim/nvim-lspconfig'
	use "glepnir/lspsaga.nvim"
	use "lukas-reineke/indent-blankline.nvim"
	use "kylechui/nvim-surround"
	use 'nvim-lua/plenary.nvim'
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}
	use 'nvim-telescope/telescope.nvim'
	use 'nvim-telescope/telescope-ui-select.nvim'
	use "nvim-telescope/telescope-file-browser.nvim" 
	use 'nvim-orgmode/orgmode'

	-- Vimscript based plugins
	use "mattn/emmet-vim"
	-- use 'komissarex/vim-progress'
end)
