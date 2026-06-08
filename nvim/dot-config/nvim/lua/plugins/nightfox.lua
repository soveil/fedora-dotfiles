return {
	"EdenEast/nightfox.nvim",
	priority = 1000,
	cond = not vim.g.vscode,
	init = function()
		-- Default options
		require("nightfox").setup({
			options = {
				styles = { -- Style to be applied to different syntax groups
					comments = "italic", -- Value is any valid attr-list value `:help attr-list`
				},
				inverse = { -- Inverse highlight for different types
					match_paren = true,
				},
			},
			palettes = {},
			specs = {},
			groups = {
				all = {
					IncSearch = { fg = "palette.white", bg = "#7a6100" },
					Visual = { bg = "#1C3B59" },
					CursorLine = {bg = "#000000"},
					FloatBorder = {bg = "#0C0C0C"},
				},
			},
		})

		-- vim.cmd("colorscheme carbonfox")
	end,
}
