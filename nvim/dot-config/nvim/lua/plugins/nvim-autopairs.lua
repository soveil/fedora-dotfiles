return {
	"windwp/nvim-autopairs",
	cond = not vim.g.vscode,
	event = "InsertEnter",
	config = function()
		local rule = require("nvim-autopairs.rule")
		local npairs = require("nvim-autopairs")

		npairs.setup({})
		npairs.add_rules({
			rule("$", "$", { "tex", "latex" }),
		})
	end,
}
