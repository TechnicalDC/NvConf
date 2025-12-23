return {
  "folke/noice.nvim",
  opts = {
     cmdline = {
        view = "cmdline",
        format = {
           -- conceal: (default=true) This will hide the text in the cmdline that matches the pattern.
           -- view: (default is cmdline view)
           -- opts: any options passed to the view
           -- icon_hl_group: optional hl_group for the icon
           -- title: set to anything or empty string to hide
           cmdline = { pattern = "^:", icon = "  ", lang = "vim" },
           search_down = { kind = "search", pattern = "^/", icon = "   ", lang = "regex" },
           search_up = { kind = "search", pattern = "^%?", icon = "   ", lang = "regex" },
           filter = { pattern = "^:%s*!", icon = " $ ", lang = "bash" },
           lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = "  ", lang = "lua" },
           help = { pattern = "^:%s*he?l?p?%s+", icon = " 󰋖 " },
           input = { view = "cmdline_input", icon = " 󰥻  " }, -- Used by input()
           -- lua = false, -- to disable a format, set to `false`
        },
     },
     notify = {
        -- Noice can be used as `vim.notify` so you can route any notification like other messages
        -- Notification messages have their level and other properties set.
        -- event is always "notify" and kind can be any log level as a string
        -- The default routes will forward notifications to nvim-notify
        -- Benefit of using Noice for this is the routing and consistent history view
        enabled = true,
        view = "mini",
     },
     lsp = {
        message = { view = "mini" }
     }
  },
  dependencies = {
     "MunifTanjim/nui.nvim",
  }
}
