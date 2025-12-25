return {
   "echaya/neowiki.nvim",
   ft = "markdown",
   keys = {
      { "<leader>ww", "<cmd>lua require('neowiki').open_wiki()<cr>", desc = "Open Wiki" },
      { "<leader>wW", "<cmd>lua require('neowiki').open_wiki_floating()<cr>", desc = "Open Wiki in Floating Window" },
      { "<leader>wT", "<cmd>lua require('neowiki').open_wiki_new_tab()<cr>", desc = "Open Wiki in Tab" },
   },
   config = function ()
      require("neowiki").setup({
         wiki_dirs = {
            { name = "notes" , path = "~/Notes/" },
            { name = "journal" , path = "~/Notes/journal/" }
         },

         -- The filename for a wiki's index page (e.g., "index.md").
         index_file = "index.md",

         -- Automatically discover and register nested wiki roots.
         discover_nested_roots = true,

         -- Defines the keymaps used by neowiki.
         -- Setting a keymap to `false` or an empty string will disable it.
         keymaps = {
            -- In Normal mode, follows the link under the cursor.
            -- In Visual mode, creates a link from the selection.
            action_link = "<CR>",
            action_link_vsplit = "<S-CR>",
            action_link_split = "<C-CR>",

            -- Jumps to the next link in the buffer.
            next_link = "<Tab>",
            -- Jumps to the previous link in the buffer.
            prev_link = "<S-Tab>",
            -- Navigate back and forth in history.
            navigate_back = "[[",
            navigate_forward = "]]",
            -- Jumps to the index page of the current wiki.
            jump_to_index = "<Backspace>",

            -- Renames the current wiki page and updates backlinks.
            rename_page = "<leader>wr",
            -- Deletes the current wiki page and updates backlinks.
            delete_page = "<leader>wd",
            -- Inserts a link to another wiki page.
            insert_link = "<leader>wi",
            -- Removes all links in the current file that point to non-existent pages.
            cleanup_links = "<leader>wc",

            -- Toggles the status of a gtd item.
            -- Works on the current line in Normal mode and on the selection in Visual mode.
            toggle_task = "<leader>wt",

            -- Closes the floating window.
            close_float = "q",
         },

         -- Configuration for the GTD functionality.
         gtd = {
            -- Set to false to disable the progress percentage virtual text.
            show_gtd_progress = true,
            -- The highlight group to use for the progress virtual text.
            gtd_progress_hl_group = "Comment",
         },

         -- Configuration for opening wiki in floating window.
         floating_wiki = {
            -- Config for nvim_open_win(). Defines the window's structure,
            -- position, and border.
            open = {
               relative = "editor",
               width = 0.7,
               height = 0.7,
               border = "rounded",
            },

            -- Options for nvim_win_set_option(). Defines the style
            -- within the window after it's created.
            style = {},
         },
      })
   end
}
