return {
   'MeanderingProgrammer/render-markdown.nvim',
   dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
   config = function ()
      local render = require('render-markdown')

      render.setup({
         render_modes = true,
         anti_conceal = { enabled = false },
         heading = {
            border = false,
            sign = false
         },
         code = { sign = false },
         quote = { icon = '▎' },
         completions = {
            blink = { enabled = true },
            lsp = { enabled = true }
         },
      })
   end
}
