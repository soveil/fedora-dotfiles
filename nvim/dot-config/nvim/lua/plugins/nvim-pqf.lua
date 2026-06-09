return {
	"yorickpeterse/nvim-pqf",
	cond = not vim.g.vscode,
	opts = {
		signs = {
			error = { text = " " },
			warning = { text = " " },
			info = { text = " " },
			hint = { text = " " },
		},
	},
}
