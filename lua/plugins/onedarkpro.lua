return {
   "olimorris/onedarkpro.nvim",
   priority = 1000, -- Ensure it loads first
   config = function ()
      local colors = require("onedarkpro.helpers").get_colors()
      require("onedarkpro").setup({
         colors = {},
         highlights = {
            CursorLine           = { bg = colors.none },
            CursorLineNr         = { bg = colors.none },
            CursorLineFold       = { bg = colors.none },
            CursorLineSign       = { bg = colors.none },
            FloatBorder          = { fg = colors.cyan },
            LazyGitBorder        = { fg = colors.cyan },
            TelescopeBorder      = { fg = colors.cyan },
            TelescopePromptTitle = { fg = colors.cyan },
         },
         styles = { -- For example, to apply bold and italic, use "bold,italic"
            types = "NONE", -- Style that is applied to types
            methods = "NONE", -- Style that is applied to methods
            numbers = "NONE", -- Style that is applied to numbers
            strings = "NONE", -- Style that is applied to strings
            comments = "italic", -- Style that is applied to comments
            keywords = "bold", -- Style that is applied to keywords
            constants = "NONE", -- Style that is applied to constants
            functions = "NONE", -- Style that is applied to functions
            operators = "NONE", -- Style that is applied to operators
            variables = "NONE", -- Style that is applied to variables
            parameters = "NONE", -- Style that is applied to parameters
            conditionals = "NONE", -- Style that is applied to conditionals
            virtual_text = "italic", -- Style that is applied to virtual text
         },
         options = {
            cursorline = true, -- Use cursorline highlighting?
            transparency = true, -- Use a transparent background?
            terminal_colors = true, -- Use the theme's colors for Neovim's :terminal?
            lualine_transparency = true, -- Center bar transparency?
         }
      })
   end
}
