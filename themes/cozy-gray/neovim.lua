return {
	{
		"bjarneo/aether.nvim",
		branch = "v2",
		name = "aether",
		priority = 1000,
		opts = {
			transparent = false,
			styles = {
				sidebars = "dark",
				floats = "dark",
			},
			colors = {
				-- Base16 colors adapted from cozygrey
				base00 = "#c8c8c8", -- Main background
				base01 = "#c8c8c8", -- Lighter grey for secondary areas
				base02 = "#c2c0bd", -- Selection/Highlight grey
				base03 = "#57555C", -- Neutral dark for comments
				base04 = "#6F6E69",
				base05 = "#020202", -- Primary text
				base08 = "#292a26", -- Red
				base09 = "#292a26", -- Orange
				base0A = "#494a43", -- Yellow
				base0B = "#393a35", -- Green
				base0C = "#575850", -- Cyan
				base0D = "#595a52", -- Blue
				base0E = "#696a60", -- Purple
				base0F = "#696a60", -- Magenta

				-- Background Overrides
				bg = "#c8c8c8",
				bg_dark = "#c8c8c8",
				bg_dark1 = "#c8c8c8",
				bg_highlight = "#c2c0bd", -- Slightly darker for contrast

				-- Hierarchy accents (Neutralized)
				blue0 = "#c8c8c8",
				blue5 = "#575850",
				blue6 = "#575850",
				blue7 = "#1c1c1b",

				-- Text & Gutter
				fg = "#020202",
				fg_dark = "#6F6E69",
				fg_gutter = "#11120b", -- Matches IntelliJ Line Number color

				-- Misc
				dark3 = "#11120b",
				dark5 = "#6F6CR",
				terminal_black = "#c8c8c8",
				magenta2 = "#696a60",
			},
		},
		config = function(_, opts)
			require("aether").setup(opts)
			vim.cmd.colorscheme("aether")

			-- Enable hot reload
			require("aether.hotreload").setup()

			-- Manual overrides to ensure the #c8c8c8 base is applied everywhere
			local colors = opts.colors
			vim.api.nvim_set_hl(0, "Normal", { bg = "#c8c8c8", fg = "#020202" })
			vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#c8c8c8" })
			vim.api.nvim_set_hl(0, "FloatBorder", { bg = "#c8c8c8", fg = "#11120b" })
			vim.api.nvim_set_hl(0, "Pmenu", { bg = "#c8c8c8" })
			vim.api.nvim_set_hl(0, "LineNr", { fg = "#11120b", bg = "#c8c8c8" })
			vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#292a26", bg = "#c2c0bd" })
			-- Match the IntelliJ Caret Row logic
			vim.api.nvim_set_hl(0, "CursorLine", { bg = "#c2c0bd" })
		end,
	},
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "aether",
		},
	},
}
