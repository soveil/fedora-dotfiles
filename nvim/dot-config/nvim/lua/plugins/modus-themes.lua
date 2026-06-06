return {
	"miikanissi/modus-themes.nvim",
	lazy = false,
	cond = not vim.g.vscode,
	priority = 1000,
	opts = {
		line_nr_column_background = false,
		on_highlights = function(highlight, color)
			highlight.Visual = { bg = "#1C3B59" }
			highlight.NormalFloat = { link = "Normal" }
			highlight.Title = { link = "NormalFloat" }
			highlight.FloatBorder = { link = "NormalFloat" }
			highlight.FloatTitle = { link = "NormalFloat" }
			highlight.Operator = { fg = "#89dcec" }
			highlight.EndOfBuffer = { fg = "#000000" }
			highlight.FoldClosed = { fg = "#d0bc00" }
			highlight.Folded = { link = "Normal" }
			highlight.QuickFixLine = { link = "Visual" }
			highlight.FoldColumn = {
				fg = vim.api.nvim_get_hl(0, { name = "LineNrAbove" }).fg,
				bg = vim.api.nvim_get_hl(0, { name = "Normal" }).bg,
			}
			highlight.CursorLineNr = {
				bold = true,
				fg = vim.api.nvim_get_hl(0, { name = "LineNr" }).fg,
				bg = vim.api.nvim_get_hl(0, { name = "Normal" }).bg,
			}
		end,
	},
}
