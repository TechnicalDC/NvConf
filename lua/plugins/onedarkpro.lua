return {
   "TechnicalDC/onedarkpro.nvim",
   enabled = false,
   priority = 1000,
   config = function ()
      local helpers = require("onedarkpro.helpers")
      local colors = helpers.get_colors()
      require("onedarkpro").setup({
         colors = {
            dark_grey =  "#111111",
         },
         highlights = {
            PmenuSel                = { fg   = "${dark_grey}", bg = colors.blue },
            PmenuThumb              = { bg   = colors.cyan },
            CursorLine              = { bg   = colors.none },
            CursorLineNr            = { fg   = colors.cyan,  bg   = colors.cysn },
            CursorLineFold          = { bg   = colors.none },
            CursorLineSign          = { bg   = colors.none },
            FloatTitle              = { fg   = colors.red },
            FloatBorder             = { fg   = colors.cyan },
            Visual                  = { fg   = "${dark_grey}",  bg   = colors.cyan },
            VisualNOS               = { fg   = "${dark_grey}",  bg   = colors.cyan },
            Search                  = { fg   = "${dark_grey}",  bg   = colors.green },
            IncSearch               = { fg   = "${dark_grey}",  bg   = colors.green },

            LazyGitBorder           = { fg   = colors.cyan },
            DashboardHeader         = { fg   = colors.red  },

            MiniFilesBorder         = { fg   = colors.cyan },
            MiniFilesBorderModified = { fg   = colors.yellow },
            MiniFilesTitle          = { fg   = colors.red },
            MiniFilesTitleFocused   = { fg   = colors.red },
            MiniFilesDirectory      = { fg   = colors.blue },
            SnacksIndent            = { fg   = colors.line_number },
            SnacksPickerFile        = { fg   = colors.blue },

            TelescopeBorder         = { fg   = colors.cyan },
            TelescopePromptTitle    = { fg   = colors.red },
            TelescopePreviewTitle   = { fg   = colors.red },
            TelescopeSelection      = { link = "PmenuSel" },
            TelescopeSelectionCaret = { link = "PmenuSel" },
            TelescopeMultiSelection = { bg = colors.none },

            NoiceCmdlinePopupBorder           = { link = "FloatBorder" },
            NoiceCmdlinePopupBorderLua        = { link = "FloatBorder" },
            NoiceCmdlinePopupBorderHelp       = { link = "FloatBorder" },
            NoiceCmdlinePopupBorderInput      = { link = "FloatBorder" },
            NoiceCmdlinePopupBorderFilter     = { link = "FloatBorder" },
            NoiceCmdlinePopupBorderSearch     = { link = "FloatBorder" },
            NoiceCmdlinePopupBorderCmdline    = { link = "FloatBorder" },
            NoiceCmdlinePopupBorderIncRename  = { link = "FloatBorder" },
            NoiceCmdlinePopupBorderCalculator = { link = "FloatBorder" },

            NoiceCmdlinePopupTitle           = { link = "TelescopePromptTitle" },
            NoiceCmdlinePopupTitleLua        = { link = "TelescopePromptTitle" },
            NoiceCmdlinePopupTitleHelp       = { link = "TelescopePromptTitle" },
            NoiceCmdlinePopupTitleInput      = { link = "TelescopePromptTitle" },
            NoiceCmdlinePopupTitleFilter     = { link = "TelescopePromptTitle" },
            NoiceCmdlinePopupTitleSearch     = { link = "TelescopePromptTitle" },
            NoiceCmdlinePopupTitleCmdline    = { link = "TelescopePromptTitle" },
            NoiceCmdlinePopupTitleIncRename  = { link = "TelescopePromptTitle" },
            NoiceCmdlinePopupTitleCalculator = { link = "TelescopePromptTitle" },
         },
         styles = {
            types = "NONE",
            methods = "NONE",
            numbers = "NONE",
            strings = "NONE",
            comments = "italic",
            keywords = "bold",
            constants = "NONE",
            functions = "NONE",
            operators = "NONE",
            variables = "NONE",
            parameters = "NONE",
            conditionals = "NONE",
            virtual_text = "italic",
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
