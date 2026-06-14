return {
	"nvim-telescope/telescope.nvim",
	version = "*",
	cond = not vim.g.vscode,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-fzy-native.nvim",
		"nvim-telescope/telescope-symbols.nvim",
	},
	config = function()
		require("telescope").setup({
			pickers = {
				symbols = {
					theme = "cursor",
					layout_config = { height = 0.4, width = 0.3 },
				},
			},
		})

		local builtin = require("telescope.builtin")

		require("telescope").load_extension("fzy_native")

		-- Set pickers
		vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Search help" })

		vim.keymap.set("i", "<C-e>", function()
			builtin.symbols({
				sources = { "emoji" },
			})
		end)
		vim.keymap.set("i", "<C-m>", function()
			builtin.symbols({
				sources = { "math" },
			})
		end)

		vim.keymap.set("n", "<leader>fd", function()
			builtin.lsp_dynamic_workspace_symbols({
				symbols = { "function", "method" },
				prompt_title = "Find Functions",
			})
		end, { desc = "Find functions" })

		vim.keymap.set("n", "<leader>fs", function()
			builtin.lsp_dynamic_workspace_symbols({
				prompt_title = "Find Symbols",
			})
		end, { desc = "Find symbols" })

		-- Godot specific overwrites
		if not vim.g.godot then
			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Grep files" })
		else
			vim.keymap.set("n", "<leader>fF", builtin.find_files, { desc = "Find files" })
			vim.keymap.set("n", "<leader>ff", function()
				builtin.find_files({
					find_command = {
						"rg",
						"--files",
						"--glob=*.gd",
					},
				})
			end, { desc = "Find GDScript files" })

			vim.keymap.set("n", "<leader>fG", builtin.find_files, { desc = "Grep files" })
			vim.keymap.set("n", "<leader>fg", function()
				builtin.live_grep({ glob_pattern = "*.gd" })
			end, { desc = "Grep GDScript files" })
		end
	end,
}
