return {
   'L3MON4D3/LuaSnip',
   config = function ()
      local ls = require("luasnip")
      local types = require("luasnip.util.types")

      if vim.fn.has("win32") == 1 then
         -- For windows
         require("luasnip.loaders.from_lua").load({ paths = "~/Appdata/Local/nvim/snippets/" })
      else
         -- For linux
         require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/snippets/" })
      end

      ls.config.set_config({
         store_selection_keys = '<C-s>',
         history = true, -- keep around last snippet local to jump back
         updateevents = "TextChanged,TextChangedI", -- update changes as you type
         enable_autosnippets = true,
         ext_opts = {
            [types.choiceNode] = {
               active = {
                  virt_text = { { "● ", "GruvboxOrange" } },
               },
            },
         },
      })
   end
}
