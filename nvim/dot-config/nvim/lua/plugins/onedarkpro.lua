return {
	"olimorris/onedarkpro.nvim",
	priority = 1000, -- Ensure it loads first
	init = function()
		require("onedarkpro").setup({
			colors = {
				bg = "#000000",
				fg = "#ffffff",
				red = "#ef596f",
				orange = "#d19a66",
				yellow = "#e5c07b",
				green = "#89ca78",
				cyan = "#2bbac5",
				blue = "#2fafff",
				purple = "#b6a0ff",
				white = "#abb2bf",
				black = "#000000",
				gray = "#434852",
				highlight = "#e2be7d",
				comment = "#989898",
				none = "NONE",
				blue_warmer = "#79a8ff",
				pink = "#feacd0",
			},
			highlights = {
				Visual = { bg = "#1C3B59" },
				String = { fg = "${blue_warmer}" },
			},
			styles = {
				comments = "italic",
			},
		})
		vim.cmd("colorscheme onedark_dark")
	end,
}
