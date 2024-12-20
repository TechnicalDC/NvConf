return {
   'saghen/blink.cmp',
   dependencies = {
      'saghen/blink.compat',
      'LMON4D3/LuaSnip',
      -- 'TechnicalDC/cmp-abl',
   },
   version = 'v0.*',
   opts = {
      keymap = { preset = 'default' },
      appearance = {
         use_nvim_cmp_as_default = true,
         nerd_font_variant = 'normal'
      },
      snippets = {
         expand = function(snippet) require('luasnip').lsp_expand(snippet) end,
         active = function(filter)
            if filter and filter.direction then
               return require('luasnip').jumpable(filter.direction)
            end
            return require('luasnip').in_snippet()
         end,
         jump = function(direction) require('luasnip').jump(direction) end,
      },
      sources = {
         completion = {
            enabled_providers = { 'lsp', 'path', 'snippets', 'buffer' },
         },
         -- providers = {
         --    abl = {
         --       name = 'abl', -- IMPORTANT: use the same name as you would for nvim-cmp
         --       module = 'blink.compat.source',
         --
         --       -- all blink.cmp source config options work as normal:
         --       score_offset = -3,
         --
         --       -- this table is passed directly to the proxied completion source
         --       -- as the `option` field in nvim-cmp's source config
         --       --
         --       -- this is NOT the same as the opts in a plugin's lazy.nvim spec
         --       opts = {
         --          -- this is an option from cmp-digraphs
         --       },
         --    }
         -- },
         default = { 'lsp', 'path', 'snippets', 'buffer' },
         cmdline = function()
            local type = vim.fn.getcmdtype()
            if type == '/' or type == '?' then return { 'buffer' } end
            if type == ':' then return { 'cmdline' } end
            return {}
         end,
         -- per_filetype = {
         --    progress = { 'abl', 'snippets', 'buffer' },
         -- },
      },
      signature = {
         enabled = true,
         window = {
            scrollbar = false,
            border = "rounded",
            winhighlight = 'Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None',
         }
      },
      completion = {
         menu = {
            border = "rounded",
            scrollbar = false,
            winhighlight = 'Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None',
            draw = {
               padding = 1,
               columns = {{ 'label', 'label_description', gap = 1 }, { 'kind_icon', 'kind' }, { 'source_name' } },
               components = {
                  source_name = {
                     width = { max = 30 },
                     -- source_name or source_id are supported
                     text = function(ctx) return '(' .. ctx.source_name .. ')' end,
                     highlight = 'BlinkCmpSource',
                  },
               },
            }
         },
         documentation = {
            window = {
               scrollbar = false,
               border = "rounded",
               winhighlight = 'Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None',
            }
         },
         -- Displays a preview of the selected item on the current line
         ghost_text = {
            enabled = true,
         },
      }
   },
   -- allows extending the providers array elsewhere in your config
   -- without having to redefine it
   opts_extend = { "sources.default" }
}
