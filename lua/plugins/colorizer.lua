return {
   'norcalli/nvim-colorizer.lua',
   event = { "BufReadPre", "BufNewFile" },
   config = function ()
      -- Attaches to every FileType mode
      require 'colorizer'.setup()
   end
}
