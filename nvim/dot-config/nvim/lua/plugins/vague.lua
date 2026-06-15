return {
	"vague-theme/vague.nvim",
	cond = not vim.g.vscode,
	opts = {},
	init = function()
		vim.cmd("colorscheme vague")
	end,
}
