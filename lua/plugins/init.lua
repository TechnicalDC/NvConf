return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

	-- Browser Integration
	use 'glacambre/firenvim'

	-- Integration
	use 'prichrd/netrw.nvim'
	use "aserowy/tmux.nvim"

	-- colorschemes
	use "catppuccin/nvim"
	use 'Mofiqul/dracula.nvim'
	use 'folke/tokyonight.nvim'

	-- UI
	use 'kyazdani42/nvim-web-devicons'
	use 'glepnir/dashboard-nvim'
	use 'rcarriga/nvim-notify'
	use 'nvim-lualine/lualine.nvim'
	use 'kyazdani42/nvim-tree.lua'
	use 'lewis6991/gitsigns.nvim'
	use 'romgrk/barbar.nvim'

	-- LSP stuffs
	use {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		'neovim/nvim-lspconfig',
		"glepnir/lspsaga.nvim"
	}

	-- autocompletions stuffs
	use {
		'hrsh7th/nvim-cmp',
		requires = {
			{'hrsh7th/cmp-nvim-lsp'},
			{'hrsh7th/cmp-nvim-lua'},
			{'hrsh7th/cmp-buffer'},
			{'hrsh7th/cmp-path'},
			{'hrsh7th/cmp-cmdline'},
			{'saadparwaiz1/cmp_luasnip'},
			{'L3MON4D3/LuaSnip'},
		}
	}

	use 'ethanholz/nvim-lastplace'
	use "windwp/nvim-autopairs"
	use 'numToStr/Comment.nvim'
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

	-- Vimscript based plugins
	use "mattn/emmet-vim"
	-- use 'komissarex/vim-progress'
end)
