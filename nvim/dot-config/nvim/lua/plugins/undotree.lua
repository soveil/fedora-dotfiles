return {
	"mbbill/undotree",
	cond = not vim.g.vscode,
	init = function()
		vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Toggle undo tree" })
	end,
}
