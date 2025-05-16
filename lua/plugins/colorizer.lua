return {
   'norcalli/nvim-colorizer.lua',
   event = { "BufRead", "BufNewFile" },
   config = function ()
      -- Attaches to every FileType mode
      require 'colorizer'.setup()
   end
}
