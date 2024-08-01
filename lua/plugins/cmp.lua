return {
   'hrsh7th/nvim-cmp',
   dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-buffer',
      'TechnicalDC/cmp-abl',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'saadparwaiz1/cmp_luasnip',
      'L3MON4D3/LuaSnip',
   },
   event = "VimEnter",
   config = function ()
      -- Setup nvim-cmp.
      local cmp = require'cmp'

      local max_count = 15
      local rounded_border = true

      local function border(hl_name)
         if rounded_border then
            return {
               { "╭", hl_name },
               { "─", hl_name },
               { "╮", hl_name },
               { "│", hl_name },
               { "╯", hl_name },
               { "─", hl_name },
               { "╰", hl_name },
               { "│", hl_name },
            }
         else
            return {
               { "┌", hl_name },
               { "─", hl_name },
               { "┐", hl_name },
               { "│", hl_name },
               { "┘", hl_name },
               { "─", hl_name },
               { "└", hl_name },
               { "│", hl_name },
            }
         end
      end

      local kind_icons = {
         Text          = "󰊄",
         Method        = "󰊕",
         Function      = "󰊕",
         Constructor   = "",
         Field         = "",
         Variable      = "",
         Class         = "",
         Interface     = "",
         Module        = "",
         Property      = "",
         Unit          = "",
         Value         = "",
         Enum          = "",
         Keyword       = "",
         Snippet       = "",
         Color         = "",
         File          = "",
         Reference     = "",
         Folder        = "",
         EnumMember    = "",
         Constant      = "",
         Struct        = "",
         Event         = "",
         Operator      = "",
         TypeParameter = "",
      }

      cmp.setup({
         snippet = {
            -- REQUIRED - you must specify a snippet engine
            expand = function(args)
               require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
            end,
         },
         window = {
            completion = {
               -- winhighlight = "FloatBorder:None,CursorLine:PmenuSel,Normal:None,Search:None,ScrollbarHandle:None",
               border = false, -- border(None),
               scrollbar = true,
            },
            documentation = {
               border = border("FloatBorder"),
               winhighlight = "CursorLine:PmenuSel,Normal:NormalFloat,Search:None",
               max_height = 15,
               scrollbar = true,
            },
         },
         mapping = cmp.mapping.preset.insert({
            ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior }),
            ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior }),
            ['<C-b>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<C-e>'] = cmp.mapping.abort(),
            ['<C-y>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
         }),
         formatting = {
            -- fields = {"abbr", "kind"},
            fields = { "abbr", "kind", "menu" },
            -- fields = { "kind", "abbr", "menu" },
            format = function(entry, vim_item)
               -- Kind icons
               -- vim_item.kind = string.format(" %s ", kind_icons[vim_item.kind])
               vim_item.kind = string.format('   %s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind

               local source = entry.source.name
               vim_item.menu = ({
                  copilot	= "(copilot)",
                  luasnip	= "(luasnip)",
                  nvim_lua = "(nvim_lua)",
                  nvim_lsp = "(lsp)",
                  buffer	= "(buffer)",
                  abl		= "(abl)",
                  path		= "(path)",
               })[source]

               -- Removing dublicates
               if source == "luasnip"
                  or source == "nvim_lsp"
                  or source == "nvim_lua"
                  or source == "abl" then
                  vim_item.dup = 0
               end

               return vim_item
            end,
         },
         sources = cmp.config.sources({
            { name = 'luasnip' }, -- For luasnip users.
            { name = 'nvim_lsp' },
            {
               name = 'buffer',
               option = { keyword_length = 1 }
            },
            { name = "path" },
            { name = "orgmode" },
         }),
         experimental = {
            ghost_text = false
         }
      })

      -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline({'/','?'}, {
         formatting = {
            fields = { "kind", "abbr" },
            format = function(entry, vim_item)
               -- Kind icons
               vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
               vim_item.menu = ({
                  buffer = "(buffer)"
               })[entry.source.name]
               return vim_item
            end,
         },
         mapping = cmp.mapping.preset.cmdline(),
         sources = {
            {
               name = 'buffer',
               option = { max_item_count = max_count }
            }
         }
      })

      -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline(':', {
         formatting = {
            fields = { "kind", "abbr", "menu" },
            format = function(entry, vim_item)
               -- Kind icons
               vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
               vim_item.menu = ({
                  buffer = "(buffer)",
                  path = "(path)",
               })[entry.source.name]
               return vim_item
            end,
         },
         mapping = cmp.mapping.preset.cmdline(),
         sources = cmp.config.sources({
            {
               name = 'path',
               option = { max_item_count = 10 }
            }
         },
         {
            {
               name = 'cmdline',
               option = { max_item_count = 10 }
            }
         })
      })

      cmp.setup.filetype("lua", {
         sources = cmp.config.sources({
            { name = 'luasnip' }, -- For luasnip users.
            { name = 'nvim_lsp' },
            {
               name = "nvim_lua",
               option = { max_item_count = max_count }
            },
            {
               name = 'buffer',
               option = { keyword_length = 1 }
            },
            { name = "path" },
            { name = "orgmode" },
         }),
      })

      cmp.setup.filetype("norg", {
         sources = cmp.config.sources({
            { name = 'luasnip' }, -- For luasnip users.
            {
               name = 'neorg',
               option = { max_item_count = max_count }
            },
            { name = 'buffer', },
            { name = "path" },
         })
      })
      cmp.setup.filetype("progress", {
         sources = cmp.config.sources({
            { name = 'luasnip' }, -- For luasnip users.
            { name = 'buffer', },
            {
               name = 'abl',
               option = { max_item_count = max_count }
            },
            { name = "path" },
         })
      })
   end
}
