---@diagnostic disable: unused-function
local mode_icon = {
   -- ['NORMAL']     = '󰘳 ',
   -- ['O-PENDING']  = ' ',
   -- ['INSERT']     = ' ',
   -- ['VISUAL']     = '󰒉 ',
   -- ['V-BLOCK']    = '󰒉 ',
   -- ['V-LINE']     = '󰒉 ',
   -- ['V-REPLACE']  = ' ',
   -- ['REPLACE']    = '󰬳 ',
   -- ['COMMAND']    = '󰘳 ',
   -- ['SHELL']      = ' ',
   -- ['TERMINAL']   = ' ',
   -- ['SELECT']     = ' ',
   -- ['CONFIRM']    = ' ',
   -- ['MORE']       = '󰍻 ',
}
local mode_abbr = {
   ['NORMAL']     = 'NOR',
   ['O-PENDING']  = 'O-P',
   ['INSERT']     = 'INS',
   ['VISUAL']     = 'VIS',
   ['V-BLOCK']    = 'VIS',
   ['V-LINE']     = 'VIS',
   ['V-REPLACE']  = 'REP',
   ['REPLACE']    = 'REP',
   ['COMMAND']    = 'CMD',
   ['SHELL']      = 'SH',
   ['TERMINAL']   = 'TERM',
   ['SELECT']     = 'SEL',
   ['CONFIRM']    = 'CFM',
   ['MORE']       = 'MR',
}

local branch = {
   'branch',
   icon = ' ',
   -- icon = '%#Purple#%#lualine_b_normal#',
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
   symbols = {
      error = '  ',
      warn = '  ',
      info = '  ',
      hint = '  '
   },
   colored = true,           -- Displays diagnostics status in color if set to true.
   update_in_insert = false, -- Update diagnostics in insert mode.
   always_visible = false,   -- Show diagnostics even if there are none.
}

local diff = {
   'diff',
   colored = true, -- Displays a colored diff status if set to true
   symbols = {
      added = '  ',
      modified = '  ',
      removed = '  '
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
      -- modified = '%#Yellow# ',      -- Text to show when the file is modified.
      -- readonly = '%#Red# ',      -- Text to show when the file is non-modifiable or readonly.
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
      -- local icon = mode_icon[s] or default_icon
      local name = mode_abbr[s] or s
      return name
   end
}

-- LSP clients attached to bufferlualine
local clients_lsp = function ()
   local bufnr = vim.api.nvim_get_current_buf()

   ---@diagnostic disable-next-line: deprecated
   local clients = vim.lsp.get_clients({buffer=bufnr})
   -- local clients = vim.lsp.buf_get_clients(bufnr)
   if next(clients) == nil then
      return ''
   end

   local c = {}
   for _, client in pairs(clients) do
      table.insert(c, client.name)
   end
   return "  " .. table.concat(c, ' ')
   -- return "%#Yellow#  %#lualine_b_normal#" .. table.concat(c, ' ')
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
   -- return "%#Red# %#lualine_b_normal#" .. tostring(current) .. "/" .. tostring(bufcnt)
end

local terminal = function ()
   return "<C-\\><C-n>"
end

local block = function ()
   return '█'
end

local space = function ()
   return ' '
end

local createExtention = function(filetype_name,l,r)
   local left_section = l or {}
   local right_section = r or {}
   return {
      sections = {
         lualine_a = left_section,
         lualine_b = {},
         lualine_x = right_section,
         lualine_z = {}
      },
      filetypes = {filetype_name}
   }
end

require('lualine').setup({
   options = {
      icons_enabled = true,
      theme = "technicaldc",
      -- theme = "auto",
      -- theme = "minihues",
      component_separators = { left = '', right = ''},
      section_separators = { left = '', right = ''},
      disabled_filetypes = {
         "snacks_dashboard"
      },
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
      lualine_b = { },
      lualine_c = {
         diff,
         diagnostics,
         filename
      },
      lualine_x = {
         {
            require("noice").api.status.mode.get,
            cond = require("noice").api.status.mode.has,
            color = {link = "lualine_b_diff_added_insert"},
         },
         'selectioncount',
         filetype,
         branch,
         'location',
      },
      lualine_y = {},
      lualine_z = {}
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
      'trouble',
      'lazy',
      'quickfix',
      createExtention("help",{mode},{}),
      createExtention("harpoon",{mode},{}),
      createExtention("minifiles",{mode},{}),
      createExtention("ministarter",{mode},{}),
      createExtention("TelescopePrompt",{mode},{}),
   }
})
