local defaults = require("plugins.ui-configs.defaults")

require("dressing").setup({
   input = {
      -- Set to false to disable the vim.ui.input implementation
      enabled = true,

      -- Default prompt string
      default_prompt = "Input",

      -- Can be 'left', 'right', or 'center'
      title_pos = "left",

      -- When true, <Esc> will close the modal
      insert_only = true,

      -- When true, input will start in insert mode.
      start_in_insert = true,

      -- These are passed to nvim_open_win
      border = "rounded",
      -- 'editor' and 'win' will default to being centered
      relative = "cursor",

      -- These can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
      prefer_width = 0.3,
      width = 40,
      -- min_width and max_width can be a list of mixed types.
      -- min_width = {20, 0.2} means "the greater of 20 columns or 20% of total"
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
      -- Set to false to disable the vim.ui.select implementation
      enabled = true,

      -- Priority list of preferred vim.select implementations
      backend = { "telescope" },

      -- Trim trailing `:` from prompt
      trim_prompt = true,

      -- Options for telescope selector
      -- These are passed into the telescope picker directly. Can be used like:
      -- telescope = require('telescope.themes').get_ivy({...})
      telescope = {
         previewer = false,
         layout_config = {
            width = defaults.get_popup_width(),
            height = 0.4,
         }
      },

      -- Used to override format_item. See :help dressing-format
      format_item_override = {},

      -- see :help dressing_get_config
      get_config = nil,
   },
})
