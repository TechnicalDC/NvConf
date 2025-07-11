return {
   'nvim-treesitter/nvim-treesitter',
   build = ':TSUpdate',
   config = function ()
      require'nvim-treesitter.configs'.setup {
         ensure_installed = {
            "bash",
            "css",
            "diff",
				"java",
            "json",
            "latex",
            "lua",
            "markdown",
            "markdown_inline",
            "rust",
            "typescript",
            "xml",
         },
         sync_install = false,
         auto_install = false,
         ignore_install = { "javascript" },

         highlight = {
            -- `false` will disable the whole extension
            enable = true,
            disable = { "c", "rust" },
            additional_vim_regex_highlighting = {"org"},
         },
         incremental_selection = {
            disable = {},
            enable = true,
            keymaps = {
               init_selection = "gnn",
               node_decremental = "grm",
               node_incremental = "grn",
               scope_incremental = "grc"
            },
            module_path = "nvim-treesitter.incremental_selection"
         },
      }
   end
}
