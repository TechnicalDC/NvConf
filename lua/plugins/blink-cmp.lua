return {
   'saghen/blink.cmp',
   dependencies = {
      'saghen/blink.compat',
      'LMON4D3/LuaSnip',
      'TechnicalDC/cmp-abl',
   },
   version = 'v0.*',
   opts = {
      keymap = { preset = 'default' },
      appearance = {
         use_nvim_cmp_as_default = true,
         nerd_font_variant = 'normal',
         kind_icons = {
            Class         = "",
            Color         = "",
            Constant      = "",
            Constructor   = "",
            Enum          = "",
            EnumMember    = "",
            Event         = "",
            Field         = "",
            File          = "",
            Folder        = "",
            Function      = "󰊕",
            Interface     = "",
            Keyword       = "",
            Method        = "󰊕",
            Module        = "",
            Operator      = "",
            Property      = "",
            Reference     = "",
            Snippet       = "",
            Struct        = "",
            Text          = "󰊄",
            TypeParameter = "",
            Unit          = "",
            Value         = "",
            Variable      = "",
         },
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
         -- completion = {
         --    enabled_providers = { 'lsp', 'path', 'luasnip', 'snippets', 'buffer' },
         -- },
         providers = {
            abl = {
               name = 'abl', -- IMPORTANT: use the same name as you would for nvim-cmp
               module = 'cmp-abl',
               -- opts = {
               --    keyword_length = 3,
               --    keyword_pattern = [[\%(-\?\d\+\%(\.\d\+\)\?\|\h\%(\w\|á\|Á\|é\|É\|í\|Í\|ó\|Ó\|ú\|Ú\)*\%(-\%(\w\|á\|Á\|é\|É\|í\|Í\|ó\|Ó\|ú\|Ú\)*\)*\)]],
               --    get_bufnrs = function()
               --       return { vim.api.nvim_get_current_buf() }
               --    end,
               --    indexing_batch_size = 1000,
               --    indexing_interval = 100,
               --    max_indexed_line_length = 1024 * 40,
               -- },
            }
         },
         default = { 'lsp', 'path', 'luasnip', 'snippets', 'buffer' },
         cmdline = function()
            local type = vim.fn.getcmdtype()
            if type == '/' or type == '?' then return { 'buffer' } end
            if type == ':' then return { 'cmdline' } end
            return {}
         end,
         per_filetype = {
            progress = { 'luasnip', 'buffer', 'lsp', 'abl' },
         },
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
                  label = {
                     width = { min = 15 }
                  },
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
            auto_show = true,
            window = {
               scrollbar = false,
               border = "rounded",
               winhighlight = 'Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None',
               direction_priority = {
                  menu_north = { 'e', 'w', 'n', 's' },
                  menu_south = { 'e', 'w', 's', 'n' },
               },
            }
         },
         -- Displays a preview of the selected item on the current line
         ghost_text = {
            enabled = false,
         },
      }
   },
   -- allows extending the providers array elsewhere in your config
   -- without having to redefine it
   opts_extend = { "sources.default" }
}
