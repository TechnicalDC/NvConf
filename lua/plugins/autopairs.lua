return {
   "windwp/nvim-autopairs",
   enabled = false,
   config = function ()
      require('nvim-autopairs').setup({
         disable_filetype = { "TelescopePrompt" , "vim" },
      })
   end
}
