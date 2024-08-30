return {
   "catppuccin/nvim",
   name = "catppuccin",
   config = function ()
      require("catppuccin").setup({
         flavour = "mocha", -- latte, frappe, macchiato, mocha
         background = { -- :h background
            light = "latte",
            dark = "mocha",
         },
         transparent_background = false, -- disables setting the background color.
         show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
         term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
         dim_inactive = {
            enabled = false, -- dims the background color of inactive window
            shade = "dark",
            percentage = 0.15, -- percentage of the shade to apply to the inactive window
         },
         no_italic = false, -- Force no italic
         no_bold = false, -- Force no bold
         no_underline = false, -- Force no underline
         styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
            comments = { "italic" }, -- Change the style of comments
            conditionals = { "italic" },
            loops = {},
            functions = {},
            keywords = { 'bold' },
            strings = {},
            variables = {},
            numbers = {},
            booleans = {},
            properties = {},
            types = {},
            operators = {},
            -- miscs = {}, -- Uncomment to turn off hard-coded styles
         },
         color_overrides = {},
         custom_highlights = function(colors)
            return{
               YaziFloat = { link = "NormalFloat" },
               TroubleNormal = { link = "NormalFloat" },
               TroubleNormalNC = { link = "NormalFloat" },
               CursorLineNr = { link = "CursorLine" },
               -- CursorLineFold = { link = "CursorLine" },
               -- CursorLineSign = { link = "CursorLine" },
               FloatBorder = { fg = colors.mantle, bg = colors.mantle },
               BufferLineFill = { bg = colors.surface0 },
               LazyGitFloat = { link = "NormalFloat" },
               LazyGitBorder = { link = "FloatBorder" },

               -- TELESCOPE
               TelescopeSelectionCaret = { bg = colors.surface0 },

               -- NOICE
               NoiceCmdlinePopupBorder = { fg = colors.surface0, bg = colors.surface0 },
               NoiceCmdlinePopupBorderSearch     = { link = "NoiceCmdlinePopupBorder" },
               NoiceCmdlinePopupBorderLua        = { link = "NoiceCmdlinePopupBorder" },
               NoiceCmdlinePopupBorderHelp       = { link = "NoiceCmdlinePopupBorder" },
               NoiceCmdlinePopupBorderInput      = { link = "NoiceCmdlinePopupBorder" },
               NoiceCmdlinePopupBorderFilter     = { link = "NoiceCmdlinePopupBorder" },
               NoiceCmdlinePopupBorderCmdline    = { link = "NoiceCmdlinePopupBorder" },
               NoiceCmdlinePopupBorderIncRename  = { link = "NoiceCmdlinePopupBorder" },
               NoiceCmdlinePopupBorderCalculator = { link = "NoiceCmdlinePopupBorder" },

               NoiceCmdlinePopupTitle  = { fg = colors.base, bg     = colors.red },
               NoiceCmdlinePopupTitleSearch     = { link = "NoiceCmdlinePopupTitle" },
               NoiceCmdlinePopupTitleLua        = { link = "NoiceCmdlinePopupTitle" },
               NoiceCmdlinePopupTitleHelp       = { link = "NoiceCmdlinePopupTitle" },
               NoiceCmdlinePopupTitleInput      = { link = "NoiceCmdlinePopupTitle" },
               NoiceCmdlinePopupTitleFilter     = { link = "NoiceCmdlinePopupTitle" },
               NoiceCmdlinePopupTitleCmdline    = { link = "NoiceCmdlinePopupTitle" },
               NoiceCmdlinePopupTitleIncRename  = { link = "NoiceCmdlinePopupTitle" },
               NoiceCmdlinePopupTitleCalculator = { link = "NoiceCmdlinePopupTitle" },
            }
         end,
         default_integrations = true,
         integrations = {
            cmp = true,
            gitsigns = true,
            nvimtree = true,
            treesitter = true,
            noice = true,
            lsp_trouble = true,
            notify = false,
            which_key = true,
            dashboard = true,
            mini = {
               enabled = true,
               indentscope_color = "",
            },
            indent_blankline = {
               enabled = true,
               scope_color = "lavender", -- catppuccin color (eg. `lavender`) Default: text
               colored_indent_levels = false,
            },
            telescope = {
               enabled = true,
               style = "nvchad"
            },
            native_lsp = {
               enabled = true,
               virtual_text = {
                  errors = { "italic","bold" },
                  hints = { "italic" },
                  warnings = { "italic" },
                  information = { "italic" },
                  ok = { "italic" },
               },
               underlines = {
                  errors = { "underline","bold" },
                  hints = { "underline" },
                  warnings = { "underline" },
                  information = { "underline" },
                  ok = { "underline" },
               },
               inlay_hints = {
                  background = true,
               },
            },
         },
      })
   end
}
