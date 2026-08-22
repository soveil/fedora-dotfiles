return {
	"mfussenegger/nvim-dap",
	cond = not vim.g.vscode,
	init = function()
		local dap = require("dap")
		dap.adapters.godot = {
			type = "server",
			host = "127.0.0.1",
			port = 6006,
		}
		dap.configurations.gdscript = {
			{
				type = "godot",
				request = "launch",
				name = "Launch scene",
				project = "${workspaceFolder}",
			},
		}
		vim.keymap.set("n", "<leader>b", function()
			require("dap").toggle_breakpoint()
		end)
		vim.keymap.set("n", "<F5>", function()
			require("dap").continue()
		end)
	end,
}
