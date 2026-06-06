if not vim.g.vscode then
	return {
		"stevearc/oil.nvim",
		config = function()
			require("oil").setup({
				default_file_explorer = not Netrw, -- If Netrw is true, set default_file_explorer to false
				keymaps = {
					["<C-p>"] = {
						"actions.preview",
						opts = { vertical = true, split = "belowright" },
					},
				},
				view_options = {
					show_hidden = true,
					is_always_hidden = function(name, _)
						return vim.endswith(name, ".uid")
					end,
				},
				preview_win = {
					preview_method = "load",
				},
			})
			vim.keymap.set("n", "-", "<CMD>Oil<CR>")
		end,
	}
else
	return {}
end
