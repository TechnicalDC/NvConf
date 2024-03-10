return {
	"navarasu/onedark.nvim",
	-- 'TechnicalDC/onedark.nvim',
	lazy = true,
	enabled = true,
	config = function ()
		require('onedark').setup  {
			-- Main options --
			style = 'darker', -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
			transparent = true,  -- Show/hide background
			term_colors = true, -- Change terminal color as per the selected theme style
			ending_tildes = true, -- Show the end-of-buffer tildes. By default they are hidden
			cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

			-- toggle theme style ---
			toggle_style_key = nil, -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
			toggle_style_list = { 'light', 'dark' }, -- List of styles to toggle between
			-- toggle_style_list = {'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'}, -- List of styles to toggle between

			-- Change code style ---
			-- Options are italic, bold, underline, none
			-- You can configure multiple style with comma separated, For e.g., keywords = 'italic,bold'
			code_style = {
				comments = 'italic',
				keywords = 'none',
				functions = 'none',
				strings = 'none',
				variables = 'none'
			},

			-- Lualine options --
			lualine = {
				transparent = true, -- lualine center bar transparency
			},

			-- Custom Highlights --
			colors = {}, -- Override default colors
			highlights = {
				["FoldColumn"] = { bg = "NONE"},
				["VertSplit"] = { fg  = "#535965" },
				["WinSeparator"] = { fg  = "#535965" },
				["FloatBorder"] = { bg = "None" },
				["NormalFloat"] = { bg = "None" },
				["WarningMsg"] = { bg = "#282c34" },
				["ErrorMsg"] = { bg = "None" },
				["MoreMsg"] = { bg = "None" },
				["DiagnosticWarn"] = { bg = "None" },
				["DiagnosticError"] = { bg = "None" },
				["DiagnosticHint"] = { bg = "None" },
				["DiagnosticOK"] = { bg = "None" },
				["DiagnosticInfo"] = { bg = "None" },
				["lualine_b_normal"] = { bg = "None" },
				["lualine_y_normal"] = { bg = "None" },
				["QuickFixLine"] = { bg = "#282c34", fmt = "italic,bold" },
				["NoiceCmdlinePopupTitle"] = { fg = "#e55561" },
				["BufferLineBufferSelected"] = { fmt = "bold" },
				-- ["DiagnosticVirtualTextInfo"] = { fmt = "italic" },
				-- ["DiagnosticVirtualTextOK"] = { fmt = "italic" },
				-- ["DiagnosticVirtualTextHint"] = { fmt = "italic" },
				-- ["DiagnosticVirtualTextError"] = { fmt = "italic" },
				-- ["DiagnosticVirtualTextWarn"] = { fmt = "italic" },
			}, -- Override highlight groups

			-- Plugins Config --
			diagnostics = {
				darker = false, -- darker colors for diagnostic
				undercurl = true,   -- use undercurl instead of underline for diagnostics
				background = false,    -- use background color for virtual text
			},
		}
	end
}
