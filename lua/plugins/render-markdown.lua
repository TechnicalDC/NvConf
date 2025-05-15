return {
   'MeanderingProgrammer/render-markdown.nvim',
   dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons'
   },
   init = function ()
   end,
   config = function ()
      local render = require('render-markdown')

      render.setup({
         render_modes = true,
         anti_conceal = { enabled = false },
         heading = {
            border = false,
            sign = false,
            position = "inline",
            backgrounds = {
               'Headline1Bg',
               'Headline2Bg',
               'Headline3Bg',
               'Headline4Bg',
               'Headline5Bg',
               'Headline6Bg',
            },
            foregrounds = {
               'RenderMarkdownH1',
               'RenderMarkdownH2',
               'RenderMarkdownH3',
               'RenderMarkdownH4',
               'RenderMarkdownH5',
               'RenderMarkdownH6',
            },
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
