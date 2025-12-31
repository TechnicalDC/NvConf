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
            right_pad = 0,
            icons = {
               "",
               "",
               "",
               "",
               "",
               "",
            },
            backgrounds = {
               'MarkdownH1Bg',
               'MarkdownH2Bg',
               'MarkdownH3Bg',
               'MarkdownH4Bg',
               'MarkdownH5Bg',
               'MarkdownH6Bg',
            },
            foregrounds = {
               'MarkdownH1',
               'MarkdownH2',
               'MarkdownH3',
               'MarkdownH4',
               'MarkdownH5',
               'MarkdownH6',
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
            -- icons = {'◆', '◇'},
            icons = {'', ''},
         },
         dash = { enabled = true },
         completions = {
            blink = { enabled = true },
            lsp = { enabled = true }
         },
         link = {
            hyperlink = '',
            custom = {
               web = { pattern = '^http', icon = '󰖟 ' },
               apple = { pattern = 'apple%.com', icon = ' ' },
               discord = { pattern = 'discord%.com', icon = '󰙯 ' },
               github = { pattern = 'github%.com', icon = '󰊤 ' },
               gitlab = { pattern = 'gitlab%.com', icon = '󰮠 ' },
               google = { pattern = 'google%.com', icon = '󰊭 ' },
               hackernews = { pattern = 'ycombinator%.com', icon = ' ' },
               linkedin = { pattern = 'linkedin%.com', icon = '󰌻 ' },
               microsoft = { pattern = 'microsoft%.com', icon = ' ' },
               neovim = { pattern = 'neovim%.org', icon = ' ' },
               reddit = { pattern = 'reddit%.com', icon = '󰑍 ' },
               slack = { pattern = 'slack%.com', icon = '󰒱 ' },
               stackoverflow = { pattern = 'stackoverflow%.com', icon = '󰓌 ' },
               steam = { pattern = 'steampowere%.com', icon = ' ' },
               twitter = { pattern = 'x%.com', icon = ' ' },
               wikipedia = { pattern = 'wikipedia%.org', icon = '󰖬 ' },
               youtube = { pattern = 'youtube[^.]*%.com', icon = '󰗃 ' },
               youtube_short = { pattern = 'youtu%.be', icon = '󰗃 ' },
            },
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
            checked = { icon = '󰄵' },
            unchecked = { icon = '󰄱' },
            custom = {
               todo = {
                  raw = '[-]',
                  rendered = '',
                  highlight = 'RenderMarkdownTodo',
                  scope_highlight = nil
               },
               important = {
                  raw = '[!]',
                  rendered = '󰓎',
                  highlight = 'DiagnosticWarn',
               },
            },
         },
      })
   end
}
