---@diagnostic disable: unused-local
return {
   'nvim-telescope/telescope.nvim',
   lazy = false,
   dependencies = {
      'nvim-lua/plenary.nvim',
   },
   keys = {
      { "<leader>ff", "<cmd>Telescope find_files<cr>",            desc = "Find files"    },
      { "<leader>fs", "<cmd>Telescope lsp_document_symbols<cr>",  desc = "Find symbols"  },
      { "<leader>fS", "<cmd>Telescope lsp_workspace_symbols<cr>", desc = "Find workspace symbols" },
      { "<leader>fo", "<cmd>Telescope oldfiles<cr>",              desc = "Find recent    files"   },
      { "<leader>fb", "<cmd>Telescope buffers<cr>",               desc = "Find buffers"  },
      { "<leader>fw", "<cmd>Telescope live_grep<cr>",             desc = "Find word"     },
   },
   config = function ()
      local center = require("plugins.telescope.layout.center")
      local flex = require("plugins.telescope.layout.flex")

      local toggle_preview = require("telescope.actions.layout").toggle_preview
      local actions = require("telescope.actions")
      local trouble = require("trouble.sources.telescope")
      local entry_maker = require("plugins.telescope.utils.buffer_entry_make")

      require('telescope').setup{
         defaults = {
            layout_strategy = "center",  -- Other layouts: vertical, horizontal, center
            layout_config = flex.layout_config,
            sorting_strategy = "ascending",
            prompt_prefix = "   ",
            entry_prefix = "   ",
            multi_icon = "  ",
            selection_caret = "  ",
            border = true,
            -- borderchars = flex.border,
            borderchars = center.border,
            results_title = "",
            prompt_title = " prompt ",
            file_ignore_patterns = {
               "**\\*.xlsx",
               "**\\*.png",
               "**\\*.jpg",
               "**\\*.jpeg",
               "**\\*.pdf",
               "**\\*.zip",
               "**\\*.docx",
            },
            preview = true,

            mappings = {
               n = {
                  ["p"] = toggle_preview,
                  ["d"] = actions.delete_buffer,
                  ["q"] = actions.close
               },
               i = {
                  ["<C-/>"] = "which_key",
                  ["<C-p>"] = toggle_preview,
                  ["<c-b>"] = trouble.open_with_trouble
               }
            }
         },
         pickers = {
            buffers = {
               sort_mru = false,
               sort_lastused = true,
               initial_mode = "normal",
               entry_maker = entry_maker.gen_from_buffer_like_leaderf(),
            },
         },
         extensions = {},
      }

      require("telescope").load_extension("lazygit")
      require("telescope").load_extension("noice")
   end
}
