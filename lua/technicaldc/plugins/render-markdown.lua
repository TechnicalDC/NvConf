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
            sign = false,
            width = "block",
            -- position = "right",
            left_pad = 1,
            right_pad = 1,
            -- icons = {
            --    "",
            --    "",
            --    "",
            --    "",
            --    "",
            --    "",
            -- },
            backgrounds = {
               'MarkdownH1Bg',
               'MarkdownH2Bg',
               'MarkdownH3Bg',
               'MarkdownH4Bg',
               'MarkdownH5Bg',
               'MarkdownH6Bg',
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
            width = 'block',
            left_pad = 2,
            right_pad = 2,
            sign = false,
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
