return {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = function ()
       require('nvim-autopairs').setup({
          disable_filetype = { "TelescopePrompt" },
          disable_in_visualblock = true,
          disable_in_replace_mode = true
       })
    end
}
