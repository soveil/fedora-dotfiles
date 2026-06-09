return {
	"folke/todo-comments.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
	},
	cond = not vim.g.vscode,
	opts = {},
	init = function()
		vim.keymap.set("n", "<leader>ft", function()
			vim.cmd("TodoTelescope")
		end, { desc = "Find todo" })
	end,
}
