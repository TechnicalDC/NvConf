return {
   'nvim-telescope/telescope.nvim',
   dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-ui-select.nvim'
   },
   enabled = false,
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
      { "<leader>fr", function ()
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
      { "<leader>fs", function ()
         require("telescope.builtin").spell_suggest()
      end, desc = "Fix spelling"  },
      { "<leader>ft", function ()
         require("telescope.builtin").filetypes()
      end, desc = "Change filetype"  },
   },
   config = function ()
      local toggle_preview = require("telescope.actions.layout").toggle_preview
      local actions = require("telescope.actions")
      local themes = require("telescope.themes")

      require('telescope').setup{
         defaults = themes.get_dropdown({
            layout_config = {
               anchor = "S",
               height = 0.5
            },
            prompt_prefix = "   ",
            entry_prefix = " ",
            multi_icon = "▌",
            selection_caret = "▌",
            dynamic_preview_title = true,
            -- borderchars = {
            --    { '═', '║', '═', '║', '╔', '╗', '╝', '╚'},
            --    prompt = {"═", "║", " ", "║", '╔', '╗', "║", "║"},
            --    results = {"═", "║", "═", "║", "╠", "╣", "╝", "╚"},
            --    preview = { '═', '║', '═', '║', '╔', '╗', '╝', '╚'},
            -- },
            file_ignore_patterns = {
               "**\\*.xlsx",
               "**\\*.png",
               "**\\*.jpg",
               "**\\*.jpeg",
               "**\\*.pdf",
               "**\\*.zip",
               "**\\*.docx",
            },

            mappings = {
               n = {
                  ["?"] = "which_key",
                  ["p"] = toggle_preview,
                  ["d"] = actions.delete_buffer,
                  ["q"] = actions.close
               },
               i = {
                  ["<C-/>"] = "which_key",
               }
            }
         }),
         pickers = {
            buffers = {
               sort_mru = false,
               sort_lastused = true,
               initial_mode = "normal",
            },
         },
         extensions = {
            ["ui-select"] = {
               require("telescope.themes").get_dropdown {
                  layout_strategy = "center",  -- Other layouts: vertical, horizontal, center
                  preview = false,
               }
            }
         },
      }

      require("telescope").load_extension("ui-select")
   end
}
