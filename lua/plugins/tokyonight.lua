---@diagnostic disable: unused-local, undefined-doc-param
return {
	'folke/tokyonight.nvim',
	lazy = true,
	config = function ()
		require("tokyonight").setup({
			style = "storm", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
			light_style = "day", -- The theme is used when the background is set to light
			transparent = false, -- Enable this to disable setting the background color
			terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
			styles = {
				comments = { italic = true },
				keywords = { italic = false },
				functions = {},
				variables = {},
				-- Background styles. Can be "dark", "transparent" or "normal"
				sidebars = "dark",
				floats = "dark",
			},
			sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
			day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
			hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
			dim_inactive = false, -- dims inactive windows
			lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold

			--- You can override specific color groups to use other groups or a hex color
			--- function will be called with a ColorScheme table
			---@param colors ColorScheme
			on_colors = function(colors) end,

			--- You can override specific highlights to use other groups or a hex color
			--- function will be called with a Highlights and ColorScheme table
			---@param highlights Highlights
			---@param colors ColorScheme
			on_highlights = function(hl, colors)

            hl.TelescopePromptTitle = { link = "lualine_a_visual" }
            hl.TelescopePreviewTitle = { link = "lualine_a_replace" }
            hl.TelescopeTitle = { link = "lualine_a_normal" }

				-- hl.TelescopeBorder = { fg = colors.bg_dark }
				-- hl.TelescopePromptNormal = { bg = colors.bg_dark }
				-- hl.TelescopePromptBorder = { fg = colors.bg_dark, bg = colors.bg_dark}
				-- hl.TelescopePromptTitle = { fg = colors.bg2, bg = colors.red }
				-- hl.TelescopeResultsNormal = { bg = colors.bg_dark }
				-- hl.TelescopeResultsBorder = { fg = colors.bg_dark, bg = colors.bg_dark}
				-- hl.TelescopeResultsTitle = { fg = colors.bg_dark, bg = colors.bg_dark}
				-- hl.TelescopePreviewNormal = { bg = colors.bg_dark }
				-- hl.TelescopePreviewBorder = { fg = colors.bg_dark, bg = colors.bg_dark}
				-- hl.TelescopePreviewTitle = { fg = colors.bg2, bg = colors.green }
				-- hl.TelescopeMatching = { fg = colors.orange, fmt = "bold" }
				-- hl.TelescopePromptPrefix = colors.Green
				-- hl.TelescopeSelection =  { bg = colors.bg2 }
				-- hl.TelescopeSelectionCaret = colors.Yello

				hl.PmenuSel = { link = "lualine_a_insert"}
				hl.PmenuThumb = { bg = "#c0caf5" }
				hl.TelescopeSelection = {link = "lualine_a_insert"}

				hl.NoiceMini = { link = "NoiceVirtualText" }
				hl.NoiceCmdlinePopupTitle = { link = "lualine_a_command" }
				hl.NoiceCmdline = { link = "lualine_c_normal" }

				hl.BufferTabpages = {link = "lualine_a_visual"}
				hl.BufferTabpagesSep = {link = "lualine_a_visual"}
			end,
		})
	end
}
