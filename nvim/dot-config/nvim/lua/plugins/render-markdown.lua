return {
	"MeanderingProgrammer/render-markdown.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	cond = not vim.g.vscode,

	---@module 'render-markdown'
	---@type render.md.UserConfig
	opts = {
		anti_conceal = {
			above = 2,
			below = 2,
		},
		code = {
			width = "block",
			sign = false,
			language_name = false,
			language_pad = 1,
			left_pad = 1,
			right_pad = 1,
		},
		overrides = {
			buftype = {
				nofile = {
					code = {
						width = "full",
						left_pad = 0,
						right_pad = 0,
						style = "normal",
					},
					anti_conceal = { enabled = false },
				},
			},
		},
	},

	init = function()
		vim.keymap.set("n", "<leader>mm", function()
			require("render-markdown").toggle()
		end, { desc = "Toggle Markdown" })

		vim.keymap.set("n", "<leader>ma", function()
			for _ = 0, vim.v.count do
				require("render-markdown").expand()
			end
		end, { desc = "Expand Markdown Context" })

		vim.keymap.set("n", "<leader>mx", function()
			for _ = 0, vim.v.count do
				require("render-markdown").contract()
			end
		end, { desc = "Contract Markdown Context" })
	end,
}
