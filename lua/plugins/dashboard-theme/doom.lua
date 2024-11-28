local header_collection = require('plugins.dashboard-theme.headers')
return {
   theme = 'doom',
   hide = {
      statusline = false,    -- hide statusline default is true
      tabline = true,      -- hide the tabline
      winbar  = true,      -- hide winbar
   },
   config = {
      header = header_collection.doom,
      center = {
         {
            icon = '  ',
            icon_hl = 'Title',
            desc = 'New File            ',
            desc_hl = 'String',
            key = 'n',
            key_hl = 'Title',
            key_format = '[%s]', -- remove default surrounding `[]`
            action = 'ene | startinsert'
         },
         {
            icon = '  ',
            icon_hl = 'Title',
            desc = 'Find File           ',
            desc_hl = 'String',
            key = 'f',
            key_hl = 'Title',
            key_format = '[%s]', -- remove default surrounding `[]`
            action = 'Telescope find_files'
         },
         {
            icon = '󱑒  ',
            icon_hl = 'Title',
            desc = 'Find Recent File           ',
            desc_hl = 'String',
            key = 'r',
            key_hl = 'Title',
            key_format = '[%s]', -- remove default surrounding `[]`
            action = 'Telescope oldfiles'
         },
         {
            icon = '  ',
            icon_hl = 'Title',
            desc = 'Browse file                ',
            desc_hl = 'String',
            key = 'b',
            key_hl = 'Title',
            key_format = '[%s]', -- remove default surrounding `[]`
            action = 'Oil'
         },
         {
            icon = '  ',
            icon_hl = 'Title',
            desc = 'Open notes                 ',
            desc_hl = 'String',
            key = 'o',
            key_hl = 'Title',
            key_format = '[%s]', -- remove default surrounding `[]`
            action = 'Neorg index'
         },
         -- {
         --    icon = '  ',
         --    icon_hl = 'Title',
         --    desc = 'Open journal               ',
         --    desc_hl = 'String',
         --    key = 'J',
         --    key_hl = 'Title',
         --    key_format = '[%s]', -- remove default surrounding `[]`
         --    action = 'Neorg journal toc open'
         -- },
         {
            icon = '  ',
            icon_hl = 'Title',
            desc = 'Quit',
            desc_hl = 'String',
            key = 'q',
            key_hl = 'Title',
            key_format = '[%s]', -- remove default surrounding `[]`
            action = 'qa!'
         },
      },
      footer = {"Welcome to neovim!"},
      -- footer = header_collection.default_footer,
   }
}
