---@diagnostic disable: unused-local, undefined-doc-param
return {
	'folke/tokyonight.nvim',
	lazy = true,
	config = function ()
		require("tokyonight").setup({
			style = "storm", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
			light_style = "day", -- The theme is used when the background is set to light
			transparent = true, -- Enable this to disable setting the background color
			terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
			styles = {
				comments = { italic = true },
				keywords = { italic = false },
				functions = {},
				variables = {},
				-- Background styles. Can be "dark", "transparent" or "normal"
				sidebars = "transparent",
				floats = "transparent",
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

				-- local color = vim.api.nvim_get_hl()
				-- hl.lualine_c_normal = { bg = "NONE"}
				-- hl.lualine_x_normal = { bg = colors.none }
				-- hl.CmpItemKindText = { link = "lualine_a_normal" }
            hl.TelescopePromptTitle = { link = "lualine_a_visual" }
            hl.TelescopePreviewTitle = { link = "lualine_a_replace" }
            hl.TelescopeTitle = { link = "lualine_a_normal" }

				hl.PmenuSel = { link = "lualine_a_insert"}
				-- hl.PmenuThumb = { bg = colors.}
				hl.TelescopeSelection = {link = "lualine_a_insert"}

				hl.NoiceMini = { link = "NoiceVirtualText" }
				hl.NoiceCmdlinePopupTitle = { link = "lualine_a_command" }

				hl.BufferTabpages = {link = "lualine_a_visual"}
				hl.BufferTabpagesSep = {link = "lualine_a_visual"}
			end,
		})
	end
}
