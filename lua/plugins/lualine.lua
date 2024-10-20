local default_icon = '󰘳 '
local mode_map = {
   ['NORMAL']     = '󰘳 ',
   ['O-PENDING']  = ' ',
   ['INSERT']     = ' ',
   ['VISUAL']     = '󰒉 ',
   ['V-BLOCK']    = '󰒉 ',
   ['V-LINE']     = '󰒉 ',
   ['V-REPLACE']  = ' ',
   ['REPLACE']    = '󰬳 ',
   ['COMMAND']    = '󰘳 ',
   ['SHELL']      = ' ',
   ['TERMINAL']   = ' ',
   ['SELECT']     = ' ',
   ['CONFIRM']    = ' ',
   ['MORE']       = '󰍻 ',
}

local branch = {
   'branch',
   icon = '',
}

local tabs = {
   'tabs',
   mode = 0,
   tabs_color = {
      -- Same values as the general color option can be used here.
      active = 'lualine_a_normal',     -- Color for active tab.
      inactive = 'lualine_b_normal', -- Color for inactive tab.
   },
}

local diagnostics = {
   'diagnostics',
   symbols = {error = ' ', warn = ' ', info = ' ', hint = '󰌵 '},
   colored = true,           -- Displays diagnostics status in color if set to true.
   update_in_insert = false, -- Update diagnostics in insert mode.
   always_visible = false,   -- Show diagnostics even if there are none.
}

local diff = {
   'diff',
   colored = true, -- Displays a colored diff status if set to true
   symbols = {
      added = ' ',
      modified = ' ',
      removed = ' '
   }, -- Changes the symbols used by the diff.
   source = nil, -- A function that works as a data source for diff.
}

local filename = {
   'filename',
   file_status = true,      -- Displays file status (readonly status, modified status)
   newfile_status = false,  -- Display new file status (new file means no write after created)
   path = 0,                -- 0: Just the filename
   -- 1: Relative path
   -- 2: Absolute path
   -- 3: Absolute path, with tilde as the home directory
   -- 4: Filename and parent dir, with tilde as the home directory

   shorting_target = 40,    -- Shortens path to leave 40 spaces in the window
   -- for other components. (terrible name, any suggestions?)
   symbols = {
      modified = ' ',      -- Text to show when the file is modified.
      readonly = ' ',      -- Text to show when the file is non-modifiable or readonly.
      unnamed = ' [No Name]', -- Text to show for unnamed buffers.
      newfile = ' [New File]',     -- Text to show for newly created file before first write
   }
}

local colored_filetype = {
   'filetype',
   colored = true,
   icon_only = false,
   icon = { align = 'left' }, -- Display filetype icon on the right hand side
}

local filetype = {
   'filetype',
   colored = false,
   icon_only = false,
   icon = { align = 'left' }, -- Display filetype icon on the right hand side
}

local mode = {
   'mode',
   fmt = function(s)
      local icon = mode_map[s] or default_icon
      return icon .. s
   end
}

-- LSP clients attached to bufferlualine
local clients_lsp = function ()
   local bufnr = vim.api.nvim_get_current_buf()

   local clients = vim.lsp.buf_get_clients(bufnr)
   if next(clients) == nil then
      return ''
   end

   local c = {}
   for _, client in pairs(clients) do
      table.insert(c, client.name)
   end
   return '  ' .. table.concat(c, '|')
end

local buf_count = function ()
   local bufnrs = vim.tbl_filter(function(bufnr)
      if 1 ~= vim.fn.buflisted(bufnr) then
         return false
      end
      return true
   end, vim.api.nvim_list_bufs())

   local bufcnt = vim.tbl_count(bufnrs)
   local bufcur = vim.api.nvim_get_current_buf()
   local current = 0

   for index, value in ipairs(bufnrs) do
      if value == bufcur then
         current = index
      end
   end

   return " " .. tostring(current) .. "/" .. tostring(bufcnt)
end

local createExtention = function (filetype_name,b,y)
   local b_section = b or {}
   local y_section = y or {}
   return {
      sections = {
         lualine_a = {
            mode
         },
         lualine_b = b_section,
         lualine_y = y_section,
         lualine_z = { filetype }
      },
      filetypes = {filetype_name}
   }
end

return {
   'nvim-lualine/lualine.nvim',
   config = function ()
      require('lualine').setup {
         options = {
            icons_enabled = true,
            theme = "onedark",
            -- theme = "catppuccin",
            -- theme = "base16",
            -- theme = 'tokyonight',
            component_separators = { left = '', right = ''},
            section_separators = { left = '', right = ''},
            -- section_separators = { left = '', right = ''},
            disabled_filetypes = {},
            always_divide_middle = true,
            globalstatus = true,
            refresh = {                  -- sets how often lualine should refresh it's contents (in ms)
               statusline = 1000,         -- The refresh option sets minimum time that lualine tries
               tabline = 1000,            -- to maintain between refresh. It's not guarantied if situation
               winbar = 1000              -- arises that lualine needs to refresh itself before this time
            }
         },
         sections = {
            lualine_a = { mode },
            lualine_b = {
               branch,
               diff,
               diagnostics
            },
            lualine_c = { },
            lualine_x = {
               {
                  require("noice").api.status.mode.get,
                  cond = require("noice").api.status.mode.has,
                  color = {link = "lualine_b_diff_added_insert"},
               },
               -- 'searchcount',
               'selectioncount',
               buf_count,
               colored_filetype,
            },
            lualine_y = {clients_lsp},
            lualine_z = {
               'progress',
               -- 'location',
            }
         },
         inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = {filename},
            lualine_x = {'location'},
            lualine_y = {},
            lualine_z = {}
         },
         extensions = {
            'toggleterm',
            'trouble',
            'lazy',
            'nvim-tree',
            'quickfix',
            createExtention("help"),
            createExtention("dashboard",{branch}),
            createExtention("yazi"),
            createExtention("lazygit"),
            createExtention("TelescopePrompt"),
         }
      }
   end
}
