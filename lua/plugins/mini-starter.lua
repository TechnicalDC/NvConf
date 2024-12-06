return  	{
   'echasnovski/mini.starter',
   version = '*',
   config = function ()
      local starter = require('mini.starter')
      local header_art =
[[
╭╮╭┬─╮╭─╮┬  ┬┬╭┬╮
│││├┤ │ │╰┐┌╯││││
╯╰╯╰─╯╰─╯ ╰╯ ┴┴ ┴
]]
      require('mini.starter').setup( {
         -- Whether to open starter buffer on VimEnter. Not opened if Neovim was
         -- started with intent to show something else.
         autoopen = true,

         -- Whether to evaluate action of single active item
         evaluate_single = true,

         items = {
            { name = 'find files', action = 'Telescope find_files', section = 'Section' },
            { name = 'recent files', action = 'Telescope oldfiles', section = 'Section' },
            { name = 'browse files', action = 'lua require("mini.files").open(vim.uv.cwd(), true)', section = 'Section' },
            { name = 'edit new buffer', action = 'enew', section = 'Builtin actions' },
            { name = 'quit Neovim', action = 'qall', section = 'Builtin actions' },
            starter.sections.sessions(5, true)
         },

         header = header_art,
         footer = '',

         -- Array  of functions to be applied consecutively to initial content.
         -- Each function should take and return content for 'Starter' buffer (see
         -- |mini.starter| and |MiniStarter.content| for more details).
         content_hooks = {
            starter.gen_hook.adding_bullet(),
            starter.gen_hook.aligning('center', 'center'),
         },

         -- Characters to update query. Each character will have special buffer
         -- mapping overriding your global ones. Be careful to not add `:` as it
         -- allows you to go into command mode.
         query_updaters = [[abcdefghilmoqrstuvwxyz0123456789_-,.ABCDEFGHIJKLMOQRSTUVWXYZ]],

         -- Whether to disable showing non-error feedback
         silent = false,
      })
      vim.cmd([[
      augroup MiniStarterJK
      au!
      au User MiniStarterOpened nmap <buffer> j <Cmd>lua MiniStarter.update_current_item('next')<CR>
      au User MiniStarterOpened nmap <buffer> k <Cmd>lua MiniStarter.update_current_item('prev')<CR>
      au User MiniStarterOpened nmap <buffer> <C-p> <Cmd>Telescope find_files<CR>
      au User MiniStarterOpened nmap <buffer> <C-n> <Cmd>Telescope file_browser<CR>
      augroup END
      ]])
   end
}
