return  	{
   'echasnovski/mini.starter',
   version = '*',
   config = function ()
      local starter = require('mini.starter')
      local autocmd = vim.api.nvim_create_autocmd
      local map     = vim.keymap.set
      local opts    = { buffer = true }
      local eldritch_logo = [[
⠀⠀⠀⠀⠀⠀⠀⣠⡤⠶⡄⠀⠀⠀⠀⠀⠀⠀⢠⠶⣦⣀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⢀⣴⣿⡟⠀⠈⣀⣾⣝⣯⣿⣛⣷⣦⡀⠀⠈⢿⣿⣦⡀⠀⠀⠀⠀
⠀⠀⠀⣴⣿⣿⣿⡇⠀⢼⣿⣽⣿⢻⣿⣻⣿⣟⣷⡄⠀⢸⣿⣿⣾⣄⠀⠀⠀
⠀⠀⣞⣿⣿⣿⣿⣷⣤⣸⣟⣿⣿⣻⣯⣿⣿⣿⣿⣀⣴⣿⣿⣿⣿⣯⣆⠀⠀
⠀⡼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣜⡆⠀
⢠⣟⣯⣿⣿⣿⣷⢿⣫⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣬⣟⠿⣿⣿⣿⣿⡷⣾⠀
⢸⣯⣿⣿⡏⠙⡇⣾⣟⣿⡿⢿⣿⣿⣿⣿⣿⢿⣟⡿⣿⠀⡟⠉⢹⣿⣿⢿⡄
⢸⣯⡿⢿⠀⠀⠱⢈⣿⢿⣿⡿⣏⣿⣿⣿⣿⣿⣿⣿⣿⣀⠃⠀⢸⡿⣿⣿⡇
⢸⣿⣇⠈⢃⣴⠟⠛⢉⣸⣇⣹⣿⣿⠚⡿⣿⣉⣿⠃⠈⠙⢻⡄⠎⠀⣿⡷⠃
⠈⡇⣿⠀⠀⠻⣤⠠⣿⠉⢻⡟⢷⣝⣷⠉⣿⢿⡻⣃⢀⢤⢀⡏⠀⢠⡏⡼⠀
⠀⠘⠘⡅⠀⣔⠚⢀⣉⣻⡾⢡⡾⣻⣧⡾⢃⣈⣳⢧⡘⠤⠞⠁⠀⡼⠁⠀⠀
⠀⠀⠀⠸⡀⠀⢠⡎⣝⠉⢰⠾⠿⢯⡘⢧⡧⠄⠀⡄⢻⠀⠀⠀⢰⠁⠀⠀⠀
⠀⠀⠀⠀⠁⠀⠈⢧⣈⠀⠘⢦⠀⣀⠇⣼⠃⠰⣄⣡⠞⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⢤⠼⠁⠀⠀⠳⣤⡼⠀⠀⠀⠀⠀⠀
]]
      local header_art =
[[
▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
█            ▄ ▄                    █
█        ▄   ▄▄▄     ▄ ▄▄▄ ▄ ▄      █
█        █ ▄ █▄█ ▄▄▄ █ █▄█ █ █      █
█     ▄▄ █▄█▄▄▄█ █▄█▄█▄▄█▄▄█ █      █
█   ▄ █▄▄█ ▄ ▄▄ ▄█ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄   █
█   █▄▄▄▄ ▄▄▄ █ ▄ ▄▄▄ ▄ ▄▄▄ ▄ ▄ █ ▄ █
█ ▄ █ █▄█ █▄█ █ █ █▄█ █ █▄█ ▄▄▄ █ █ █
█ █▄█ ▄ █▄▄█▄▄█ █ ▄▄█ █ ▄ █ █▄█▄█ █ █
█     █▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█ █▄█▄▄▄█     █
█▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█
]]
      require('mini.starter').setup( {
         -- Whether to open starter buffer on VimEnter. Not opened if Neovim was
         -- started with intent to show something else.
         autoopen = true,

         -- Whether to evaluate action of single active item
         evaluate_single = true,

         items = {
            {
               name = 'edit new buffer',
               action = 'enew',
               section = 'Builtin actions'
            },
            {
               name = 'load session',
               action = 'lua MiniSessions.select()',
               section = 'Builtin actions'
            },
            {
               name = 'quit neovim',
               action = 'qall',
               section = 'Builtin actions'
            },
            {
               name = 'open notes',
               action = 'lua require("telescope.builtin").find_files({cwd = "~/Neorg/", prompt_title = "Open Notes", preview_title = ""})',
               section = 'Section'
            },
            {
               name = 'find files',
               action = 'lua require("telescope.builtin").find_files({preview_title = ""})',
               section = 'Section'
            },
            {
               name = 'recent files',
               action = 'lua require("telescope.builtin").oldfiles({preview_title = ""})',
               section = 'Section'
            },
            {
               name = 'browse files',
               action = 'lua require("mini.files").open(vim.uv.cwd(), true)',
               section = 'Section'
            },
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

      autocmd("User",{
         pattern = "MiniStarterOpened",
         callback = function(args)
            vim.opt_local.statuscolumn = ""
            map("n", "j", "<Cmd>lua MiniStarter.update_current_item('next')<CR>", opts)
            map("n", "k", "<Cmd>lua MiniStarter.update_current_item('prev')<CR>", opts)
            -- map("n", "<C-p>", "<Cmd>Telescope find_files<CR>", opts)
            -- map("n", "<C-n>", "<Cmd>Telescope file_browser<CR>", opts)
         end})
   end
}
