return {
	"zbirenbaum/copilot.lua",
	cond = vim.g.ai and not vim.g.vscode,
	cmd = "Copilot",
	opts = {
		suggestion = {
			auto_trigger = true,
		},
	},
}
