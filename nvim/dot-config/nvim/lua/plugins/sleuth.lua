return {
	"tpope/vim-sleuth",
	cond = not vim.g.vscode,
	init = function()
		vim.g.sleuth_yaml_heuristics = 0
	end,
}
