---@diagnostic disable: unused-local
return {
   'nvim-telescope/telescope.nvim',
   dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-ui-select.nvim'
   },
   event = { "BufReadPre", "BufNewFile" },
   keys = {
      { "<leader>ff", function ()
         require("telescope.builtin").find_files()
      end, desc = "Find files"    },
      { "<leader>fh", function ()
         require("telescope.builtin").help_tags()
      end, desc = "Find help files" },
      { "<leader>fH", function ()
         require("telescope.builtin").highlights()
      end, desc = "Find highlights" },
      { "<leader>fo", function ()
         require("telescope.builtin").oldfiles()
      end, desc = "Find recent files" },
      { "<leader>fb", function ()
         require("telescope.builtin").buffers()
      end, desc = "Find buffers"  },
      { "<leader>fw", function ()
         require("telescope.builtin").grep_string()
      end, desc = "Find word under the cursor" },
      { "<leader>fW", function ()
         require("telescope.builtin").live_grep()
      end, desc = "Find word" },
   },
   config = function ()
      local toggle_preview = require("telescope.actions.layout").toggle_preview
      local actions = require("telescope.actions")
      -- local entry_maker = require("plugins.telescope.utils.buffer_entry_make")

      require('telescope').setup{
         defaults = {
            layout_strategy = "horizontal",  -- Other layouts: vertical, horizontal, center
            layout_config = {
               prompt_position = "top",
					preview_width = 0.5
            },
            sorting_strategy = "ascending",
            prompt_prefix = "   ",
            entry_prefix = "   ",
            multi_icon = "  ",
            selection_caret = "  ",
            border = true,
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
               }
            }
         },
         pickers = {
            buffers = {
               sort_mru = false,
               sort_lastused = true,
               initial_mode = "normal",
               -- entry_maker = entry_maker.gen_from_buffer_like_leaderf(),
            },
         },
         extensions = {
            ["ui-select"] = {
					require("telescope.themes").get_dropdown {
						layout_strategy = "horizontal",  -- Other layouts: vertical, horizontal, center
						preview = false,
					}
            }
         },
      }

      require("telescope").load_extension("noice")
      require("telescope").load_extension("ui-select")
   end
}
