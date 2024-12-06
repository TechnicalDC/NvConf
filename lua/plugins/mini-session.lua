return {
   'echasnovski/mini.sessions',
   version = '*',
   config = function ()
      require('mini.sessions').setup( {
         -- Whether to read default session if Neovim opened without file arguments
         autoread = false,

         -- Whether to write currently read session before quitting Neovim
         autowrite = true,

         -- Directory where global sessions are stored (use `''` to disable)
         directory = '', --<"session" subdir of user data directory from |stdpath()|>,

         -- File for local session (use `''` to disable)
         file = 'session.vim',

         -- Whether to force possibly harmful actions (meaning depends on function)
         force = { read = false, write = true, delete = false },

         -- Hook functions for actions. Default `nil` means 'do nothing'.
         hooks = {
            -- Before successful action
            pre = { read = nil, write = nil, delete = nil },
            -- After successful action
            post = { read = nil, write = nil, delete = nil },
         },

         -- Whether to print session path after action
         verbose = { read = false, write = true, delete = true },
      })
   end
}
