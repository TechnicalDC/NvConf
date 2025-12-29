return {
   'MeanderingProgrammer/render-markdown.nvim',
   dependencies = { 'nvim-treesitter/nvim-treesitter' },
   ft = "markdown",
   config = function ()
      local render = require('render-markdown')

      render.setup({
         render_modes = true,
         anti_conceal = { enabled = true },
         heading = {
            border = false,
            sign = true,
            width = "block",
            position = "right",
            left_pad = 1,
            -- icons = {
            --    "",
            --    "",
            --    "",
            --    "",
            --    "",
            --    "",
            -- },
            backgrounds = {
               'RenderMarkdownH1Bg',
               'RenderMarkdownH2Bg',
               'RenderMarkdownH3Bg',
               'RenderMarkdownH4Bg',
               'RenderMarkdownH5Bg',
               'RenderMarkdownH6Bg',
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
         code = {
            sign = false,
            style = 'full',
            border = 'thick',
         },
         quote = { icon = '▌' },
         bullet = {
            enabled = true,
            icons = {'◆', '◇'},
         },
         dash = { enabled = true },
         completions = {
            blink = { enabled = true },
            lsp = { enabled = true }
         },
         pipe_table = {
            preset = 'none',
            cell = 'trimmed',
            filler = 'RenderMarkdownTableRow',
            border = {
               '┌', '┬', '┐',
               '├', '┼', '┤',
               '└', '┴', '┘',
               '│', '─',
            },
         },
         checkbox = {
            checked = { icon = '󰄵 ' },
            custom = {
               important = {
                  raw = '[!]',
                  rendered = '󰓎 ',
                  highlight = 'DiagnosticWarn',
               },
            },
         },
      })
   end
}
