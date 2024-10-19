local defaults = require("plugins.ui.defaults")

require("dressing").setup({
   input = {
      enabled = true,
      default_prompt = "Input",
      title_pos = "left",
      insert_only = true,
      start_in_insert = true,
      border = "rounded",
      -- 'editor' and 'win' will default to being centered
      relative = "cursor",
      anchor = "NW",
      prefer_width = 0.3,
      width = 40,
      max_width = { 140, 0.9 },
      min_width = { 30, 0.2 },
      buf_options = {},
      win_options = {
         -- Disable line wrapping
         wrap = false,
         -- Indicator for when text exceeds window
         list = true,
         listchars = "precedes:…,extends:…",
         -- Increase this for more context when text scrolls off the window
         sidescrolloff = 0,
         winhighlight = "NormalFloat:TelescopePromptNormal,FloatBorder:TelescopePromptBorder,FloatTitle:TelescopePromptTitle",
      },

      -- Set to `false` to disable
      mappings = {
         n = {
            ["<Esc>"] = "Close",
            ["<CR>"] = "Confirm",
         },
         i = {
            ["<C-c>"] = "Close",
            ["<CR>"] = "Confirm",
            ["<Up>"] = "HistoryPrev",
            ["<Down>"] = "HistoryNext",
         },
      },

      override = function(conf)
         -- This is the config that will be passed to nvim_open_win.
         -- Change values here to customize the layout
         return conf
      end,

      -- see :help dressing_get_config
      get_config = nil,
   },
   select = {
      enabled = true,
      backend = { "telescope" },
      trim_prompt = true,
      telescope = {
         previewer = false,
         layout_config = {
            width = 0.999,
            height = 0.4,
         }
      },

      -- Used to override format_item. See :help dressing-format
      format_item_override = {
         codeaction = function(action_tuple)
            local title = action_tuple[2].title:gsub("\r\n", "\\r\\n")
            local client = vim.lsp.get_client_by_id(action_tuple[1])
            return string.format("%s\t[%s]", title:gsub("\n", "\\n"), client.name)
         end,
      },

      -- see :help dressing_get_config
      get_config = nil,
   },
})
