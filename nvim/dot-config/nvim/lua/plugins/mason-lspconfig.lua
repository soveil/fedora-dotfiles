return {
	"mason-org/mason-lspconfig.nvim",
	cond = not vim.g.vscode,
	opts = {},
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		"neovim/nvim-lspconfig",
	},
}
