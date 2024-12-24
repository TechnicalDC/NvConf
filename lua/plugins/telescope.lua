---@diagnostic disable: unused-local
return {
   'nvim-telescope/telescope.nvim',
   lazy = false,
   dependencies = {
      'nvim-lua/plenary.nvim',
   },
   keys = {
      { "<leader>ff", function ()
         require("telescope.builtin").find_files({preview_title = ""})
      end, desc = "Find files"    },
      { "<leader>fh", function ()
         require("telescope.builtin").help_tags({preview_title = ""})
      end, desc = "Find help files" },
      { "<leader>fs", function ()
         require("telescope.builtin").lsp_document_symbols({preview_title = ""})
      end,  desc = "Find symbols"  },
      { "<leader>fS",function ()
         require("telescope.builtin").lsp_workspace_symbols({preview_title = ""})
      end, desc = "Find workspace symbols" },
      { "<leader>fo", function ()
         require("telescope.builtin").oldfiles({preview_title = ""})
      end, desc = "Find recent files" },
      { "<leader>fb", function ()
         require("telescope.builtin").buffers({preview_title = ""})
      end, desc = "Find buffers"  },
      { "<leader>fw", function ()
         require("telescope.builtin").live_grep({preview_title = ""})
      end, desc = "Find word" },
   },
   config = function ()
      local center = require("plugins.telescope.layout.center")
      local flex = require("plugins.telescope.layout.flex")
      local bottom_pane = require("plugins.telescope.layout.bottom_pane")

      local toggle_preview = require("telescope.actions.layout").toggle_preview
      local actions = require("telescope.actions")
      local trouble = require("trouble.sources.telescope")
      local entry_maker = require("plugins.telescope.utils.buffer_entry_make")

      require('telescope').setup{
         defaults = {
            layout_strategy = "bottom_pane",  -- Other layouts: vertical, horizontal, center
            layout_config = bottom_pane.layout_config,
            sorting_strategy = "ascending",
            prompt_prefix = "   ",
            entry_prefix = "   ",
            multi_icon = "  ",
            selection_caret = "  ",
            border = true,
            borderchars = bottom_pane.border,
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
            dynamic_preview_title = true,

            mappings = {
               n = {
                  ["?"] = "which_key",
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
