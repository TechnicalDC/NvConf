return {
   "ThePrimeagen/harpoon",
   branch = "harpoon2",
   dependencies = { "nvim-lua/plenary.nvim" },
   config = function ()
      local harpoon = require("harpoon")
      local opts = {
         border = "rounded",
         title = " Harpoon ",
         title_pos = "center"
      }

      -- REQUIRED
      harpoon:setup()

      local ok, wk = pcall(require, 'which-key')
      if not ok then
         return nil
      end

      wk.add({
         {
            mode = "n",
            -- REQUIRED
            { "<leader>ha", function() harpoon:list():add() end, desc = "Add current buffer to harpoon list" },
            { "<leader>ho", function() harpoon.ui:toggle_quick_menu(harpoon:list(), opts) end, desc = "Open harpoon menu" },
            { "<leader>1",  function() harpoon:list():select(1) end, desc = "Switch to 1st harpoon item" },
            { "<leader>2",  function() harpoon:list():select(2) end, desc = "Switch to 2nd harpoon item" },
            { "<leader>3",  function() harpoon:list():select(3) end, desc = "Switch to 3rd harpoon item" },
            { "<leader>4",  function() harpoon:list():select(4) end, desc = "Switch to 4th harpoon item" },
            { "<leader>hp", function() harpoon:list():prev() end, desc = "Next harpoon item" },
            { "<leader>hn", function() harpoon:list():next() end, desc = "Previous harpoon item" },
         }
      })
   end
}
