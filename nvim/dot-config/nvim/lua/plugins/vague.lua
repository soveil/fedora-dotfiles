return {
	"vague-theme/vague.nvim",
	cond = not vim.g.vscode,
	opts = {
		on_highlights = function(hl, colors)
			hl["@markup.heading.1.markdown"] = { fg = colors.warning }
			hl["@markup.heading.2.markdown"] = { fg = colors.plus }
			hl["@markup.heading.3.markdown"] = { fg = colors.hint }
			hl["@markup.heading.4.markdown"] = { fg = colors.parameter }
			hl["@markup.heading.5.markdown"] = { fg = colors.builtin }
			hl["@markup.heading.6.markdown"] = { fg = colors.func }

			hl.RenderMarkdownH1Bg = { bg = "#2d2721" }
			hl.RenderMarkdownH2Bg = { bg = "#20251e" }
			hl.RenderMarkdownH3Bg = { bg = "#20232d" }
			hl.RenderMarkdownH4Bg = { bg = "#272428" }
			hl.RenderMarkdownH5Bg = { bg = "#262a2a" }
			hl.RenderMarkdownH6Bg = { bg = "#382a2b" }

			hl.Cursor = { bg = colors.fg }
		end,
	},
	init = function()
		vim.cmd("colorscheme vague")
	end,
}
