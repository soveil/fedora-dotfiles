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
			highlight.PmenuSel = { link = "Visual" }
			highlight.CursorLine = { bg = "#101010" }
			highlight.FoldColumn = { fg = "#989898", bg = "#000000" }
			highlight.CursorLineNr = { bold = true, fg = "#ffffff", bg = "#000000" }
			highlight.TelescopeSelection = { link = "Visual" }
			highlight.RenderMarkdownCode = { bg = "#000000" }

			highlight.BlinkCmpKindText = { link = "CmpItemKindText" }
			highlight.BlinkCmpKindMethod = { link = "CmpItemKindMethod" }
			highlight.BlinkCmpKindFunction = { link = "CmpItemKindFunction" }
			highlight.BlinkCmpKindConstructor = { link = "CmpItemKindConstructor" }
			highlight.BlinkCmpKindField = { link = "CmpItemKindField" }
			highlight.BlinkCmpKindVariable = { link = "CmpItemKindVariable" }
			highlight.BlinkCmpKindClass = { link = "CmpItemKindClass" }
			highlight.BlinkCmpKindInterface = { link = "CmpItemKindInterface" }
			highlight.BlinkCmpKindModule = { link = "CmpItemKindModule" }
			highlight.BlinkCmpKindProperty = { link = "CmpItemKindProperty" }
			highlight.BlinkCmpKindUnit = { link = "CmpItemKindUnit" }
			highlight.BlinkCmpKindValue = { link = "CmpItemKindValue" }
			highlight.BlinkCmpKindEnum = { link = "CmpItemKindEnum" }
			highlight.BlinkCmpKindKeyword = { link = "CmpItemKindKeyword" }
			highlight.BlinkCmpKindSnippet = { link = "CmpItemKindSnippet" }
			highlight.BlinkCmpKindColor = { link = "CmpItemKindColor" }
			highlight.BlinkCmpKindFile = { link = "CmpItemKindFile" }
			highlight.BlinkCmpKindReference = { link = "CmpItemKindReference" }
			highlight.BlinkCmpKindFolder = { link = "CmpItemKindFolder" }
			highlight.BlinkCmpKindEnumMember = { link = "CmpItemKindEnumMember" }
			highlight.BlinkCmpKindConstant = { link = "CmpItemKindConstant" }
			highlight.BlinkCmpKindStruct = { link = "CmpItemKindStruct" }
			highlight.BlinkCmpKindEvent = { link = "CmpItemKindEvent" }
			highlight.BlinkCmpKindOperator = { link = "CmpItemKindOperator" }
			highlight.BlinkCmpKindTypeParameter = { link = "CmpItemKindTypeParameter" }
		end,
	},
	init = function()
		-- vim.cmd("colorscheme modus")
	end,
}
